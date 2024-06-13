USE case_jump;

SELECT * FROM casesql_movies;
SELECT * FROM casesql_names;
SELECT * FROM casesql_ratings;
SELECT * FROM casesql_title_principals;

/* 1 - Gerar um relatório contendo os 10 filmes mais lucrativos de todos os tempos,
 e identificar em qual faixa de idade/gênero eles foram mais bem avaliados.*/
 
SELECT 
    t1.title as filme,
    CAST(REPLACE(t1.worldwide_gross_income,'$','') AS DECIMAL(15, 2)) AS renda_bruta_mundial, -- Estava em varchar
    t1.genre as genero,
    t1.avg_vote as media_votos,
    CASE GREATEST(t2.allgenders_0age_avg_vote, -- A função GREATEST retornará o maior valor
              t2.allgenders_18age_avg_vote,
              t2.allgenders_30age_avg_vote,
              t2.allgenders_45age_avg_vote)
        WHEN t2.allgenders_0age_avg_vote THEN '0-17'
        WHEN t2.allgenders_18age_avg_vote THEN '18-29'
        WHEN t2.allgenders_30age_avg_vote THEN '30-44'
        ELSE '45+'
    END AS faixa_idade_melhor_avaliado
FROM
    casesql_movies t1
JOIN
    casesql_ratings t2
    ON t1.imdb_title_id = t2.imdb_title_id
WHERE
    t1.worldwide_gross_income LIKE '%$%'
ORDER BY 
   renda_bruta_mundial DESC
LIMIT 10;


-- 2 - Quais os gêneros que mais aparecem entre os Top 10 filmes mais bem avaliados de cada ano, nos últimos 10 anos.

CREATE VIEW Top10PorAno AS (
    SELECT
        imdb_title_id,
        title,
        year,
        genre,
        avg_vote,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY avg_vote DESC) AS ranque 
    FROM
        CaseSQL_movies
    WHERE
        year >= YEAR(CURDATE()) - 10
);

SELECT * FROM top10porano;

SELECT
    genre,
    COUNT(*) AS quantidade_genero
FROM
    Top10PorAno
WHERE
    ranque <= 10
GROUP BY
    genre
ORDER BY
    quantidade_genero DESC;
    
    
-- 3 - Quais os 50 filmes com menor lucratividade ou que deram prejuízo, nos últimos 30 anos. Considerar apenas valores em dólar ($).

SELECT
    imdb_title_id,
    title as titulo,
    year as ano,
    budget as orcamento,
    worldwide_gross_income as renda_bruta_mundial,
    lucro
FROM
    (
        SELECT
            imdb_title_id,
            title,
            year,
            CAST(REPLACE(budget, '$', '') AS DECIMAL(15,2)) AS budget,
            CAST(REPLACE(worldwide_gross_income, '$', '') AS DECIMAL(15,2)) AS worldwide_gross_income,
            (CAST(REPLACE(worldwide_gross_income, '$', '') AS DECIMAL(15,2)) - CAST(REPLACE(budget, '$', '') AS DECIMAL(15,2))) AS lucro
        FROM
            CaseSQL_movies
        WHERE
            year >= YEAR(CURDATE()) - 30
            AND budget IS NOT NULL
            AND worldwide_gross_income IS NOT NULL
    ) AS lucro_filme
ORDER BY
    lucro ASC
LIMIT 50;

-- 4 - Selecionar os top 10 filmes baseados nas avaliações dos usuários, para cada ano, nos últimos 20 anos.

SELECT
    imdb_title_id,
    title AS titulo,
    year AS ano,
    avg_vote AS media_votos
FROM
    (
        SELECT
            imdb_title_id,
            title,
            year,
            avg_vote,
            ROW_NUMBER() OVER (PARTITION BY year ORDER BY avg_vote DESC) AS ranque
        FROM
            CaseSQL_movies
        WHERE
            year >= YEAR(CURDATE()) - 20
    ) AS ranque_filmes
WHERE
    ranque <= 10
ORDER BY
    year DESC, ranque;

/*  - Gerar um relatório com os top 10 filmes mais bem avaliados pela crítica e os top 10 pela avaliação de usuário,
 contendo também o budget dos filmes*/ 
 
WITH Top10Critica AS (
    SELECT
        imdb_title_id,
        title,
        year,
        CAST(Metascore AS DECIMAL(10, 1)) AS Metascore,
        budget,
        ROW_NUMBER() OVER (ORDER BY CAST(Metascore AS DECIMAL(10, 1)) DESC) AS ranque_critica
    FROM
        CaseSQL_movies
    WHERE
        Metascore IS NOT NULL
),
Top10Usuarios AS (
    SELECT
        imdb_title_id,
        title,
        year,
        ROUND(avg_vote, 1) AS avg_vote,
        budget,
        ROW_NUMBER() OVER (ORDER BY avg_vote DESC) AS ranque_usuario
    FROM
        CaseSQL_movies
    WHERE
        avg_vote IS NOT NULL
)

SELECT
    'Critica' AS tipo_avaliacao,
    imdb_title_id,
    title,
    year,
    Metascore AS pontuacao,
    budget
FROM
    Top10Critica
WHERE
    ranque_critica <= 10

UNION ALL

SELECT
    'Usuario' AS tipo_avaliacao,
    imdb_title_id,
    title,
    year,
    avg_vote AS pontuacao,
    budget
FROM
    Top10Usuarios
WHERE
    ranque_usuario <= 10
ORDER BY
    tipo_avaliacao,
    pontuacao DESC;


-- 6 - Gerar um relatório contendo a duração média de 5 gêneros a sua escolha.

SELECT
    genre,
    round(AVG(duration),0) AS duracao_media_min
FROM
    casesql_movies
WHERE
    genre IN ('Romance', 'Drama', 'Comedy', 'Fantasy', 'Horror') -- seleciono gêneros específicos 
GROUP BY
    genre;


/* 7 - Gerar um relatório sobre os 5 filmes mais lucrativos de um ator/atriz(que podemos filtrar),
 trazendo o nome, ano de exibição, e Lucro obtido. Considerar apenas valores em dólar($).
*/

SELECT 
    t2.name AS nome,
    t1.title AS nome_filme,
    t1.year AS ano_exibicao,
    CAST(REPLACE(t1.worldwide_gross_income, '$', '') AS DECIMAL(15,2)) - CAST(REPLACE(t1.budget, '$', '') AS DECIMAL(15,2)) AS lucro_obtido
FROM 
    casesql_movies t1
LEFT JOIN
    casesql_names t2 
    ON t1.actors LIKE CONCAT('%', t2.name, '%')
WHERE 
    t1.worldwide_gross_income LIKE '%$%'
    AND t1.budget LIKE '%$%'
    AND t2.name = 'Nome do Ator/Atriz'
ORDER BY 
    lucro_obtido DESC
LIMIT 5;

/*8 - Baseado em um filme que iremos selecionar, trazer um relatório contendo quais os atores/atrizes participantes,
 e pra cada ator trazer um campo com a média de avaliação da crítica dos últimos 5 filmes em que esse ator/atriz participou.
*/

WITH Ranque_filmes AS (
    SELECT 
        t1.title AS nome_filme,
        t2.name AS nome_ator,
        t1.metascore AS media_avaliacao_critica,
        ROW_NUMBER() OVER (PARTITION BY t2.name ORDER BY t1.date_published DESC) AS ranking_filme
    FROM 
        casesql_movies t1
    JOIN 
        casesql_names t2 
		    ON CONCAT(',', t1.actors, ',') LIKE CONCAT('%,', t2.name, ',%')
    WHERE 
        t1.metascore IS NOT NULL
        AND t1.title = 'Cleopatra' -- Substitua pelo filme 
)
SELECT 
    nome_filme,
    nome_ator,
    AVG(media_avaliacao_critica) as media_avaliacao_critica
FROM 
    Ranque_filmes
WHERE 
    ranking_filme <= 5
GROUP BY 
    nome_filme, nome_ator;

/* 9 - Gerar mais duas análises a sua escolha, baseado nessas tabelas (em uma delas deve incluir a análise exploratória de dois campos,
 um quantitativo e um qualitativo, respectivamente).*/
 
SELECT * FROM casesql_movies;
SELECT * FROM casesql_names;
SELECT * FROM casesql_ratings;
SELECT * FROM casesql_title_principals;

-- Calcular o número de filmes lançados por ano a partir de 2000 e calcular a média total de filmes lançados nesses anos.
WITH filmes_por_ano AS (
    SELECT 
        year,
        COUNT(*) AS numero_filmes
    FROM 
        casesql_movies
    WHERE 
        year >= 2000
    GROUP BY 
        year
),
media_total_filmes AS (
    SELECT 
        ROUND(AVG(numero_filmes),0) AS media_total
    FROM 
        filmes_por_ano
)
SELECT 
    year AS ano,
    numero_filmes,
    media_total
FROM 
    filmes_por_ano, media_total_filmes
ORDER BY year;

-- Ranking de diretores dos EUA com base na avaliação média dos seus filmes
SELECT 
    director,
    avg_vote
FROM 
    casesql_movies
WHERE 
    director IS NOT NULL
    AND year >= 2000
    AND country LIKE '%USA%'
GROUP BY 
    director, avg_vote
ORDER BY 
   avg_vote DESC
LIMIT 20;
