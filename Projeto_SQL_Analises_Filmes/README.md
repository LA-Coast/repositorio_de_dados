# Case SQL 

## Introdução

Este projeto envolve a importação e análise de várias bases de dados utilizando MySQL para gerar relatórios específicos conforme solicitado. As bases de dados fornecidas incluem informações detalhadas sobre filmes, atores, diretores, avaliações e classificações. A seguir, são descritas as bases de dados utilizadas e as tarefas realizadas com as mesmas.

### Bases de Dados Utilizadas

- **CaseSQL_movies**: Inclui milhares de filmes com atributos como título, avaliação média, gênero, ano, etc.
- **CaseSQL_names**: Inclui nomes e características pessoais relacionadas a atores, atrizes e diretores.
- **CaseSQL_ratings**: Inclui avaliações sobre os filmes, contendo categorizações como masculino/feminino, faixa etária, etc.
- **CaseSQL_title_principals**: Inclui os membros (atores, atrizes, diretores) que trabalharam nos filmes, assim como papéis e cargos.

### Importação dos Dados

Os dados foram importados para o MySQL e, em seguida, foram criadas novas tabelas e views nos esquemas, conforme necessário, para facilitar a análise e a geração dos relatórios solicitados.

## Tarefas Realizadas

### 1. Relatório dos 10 Filmes Mais Lucrativos
Foi gerado um relatório contendo os 10 filmes mais lucrativos de todos os tempos, identificando em qual faixa de idade/gênero foram mais bem avaliados.

### 2. Gêneros dos Top 10 Filmes Mais Bem Avaliados
Foi identificada a frequência dos gêneros que mais aparecem entre os Top 10 filmes mais bem avaliados de cada ano, nos últimos 10 anos.

### 3. Filmes com Menor Lucratividade
Foi gerado um relatório listando os 50 filmes com menor lucratividade ou que deram prejuízo, nos últimos 30 anos, considerando apenas valores em dólar ($).

### 4. Top 10 Filmes Baseados nas Avaliações dos Usuários
Foi selecionado os top 10 filmes baseados nas avaliações dos usuários, para cada ano, nos últimos 20 anos.

### 5. Relatório dos Top 10 Filmes Mais Bem Avaliados pela Crítica e Usuários
Foi gerado um relatório com os top 10 filmes mais bem avaliados pela crítica e os top 10 pela avaliação de usuários, contendo também o budget dos filmes.

### 6. Duração Média dos Gêneros
Foi gerado um relatório contendo a duração média de 5 gêneros específicos.

### 7. Relatório dos 5 Filmes Mais Lucrativos de um Ator/Atriz
Foi gerado um relatório sobre os 5 filmes mais lucrativos de um ator ou atriz selecionado, trazendo o nome, ano de exibição, e lucro obtido (em dólar).

### 8. Relatório Baseado em um Filme Selecionado
Foi gerado um relatório contendo os atores/atrizes participantes de um filme selecionado, e para cada ator, foi incluído um campo com a média de avaliação da crítica dos últimos 5 filmes em que esse ator/atriz participou.

### 9. Análises Adicionais
Foram geradas duas análises adicionais baseadas nas tabelas fornecidas, incluindo uma análise exploratória de dois campos (um quantitativo e um qualitativo).

## Habilidades Adquiridas

Ao longo deste projeto, foram adquiridas e aprimoradas várias habilidades, incluindo:

- **Importação e Manipulação de Dados**: Importação de grandes volumes de dados para MySQL e criação de tabelas/views para facilitar a análise.
- **Análise de Dados com SQL**: Utilização de comandos SQL avançados para filtrar, agrupar e ordenar dados para gerar relatórios específicos.
- **Exploração de Dados**: Realização de análises exploratórias para entender melhor os dados e identificar padrões ou insights.
- **Geração de Relatórios**: Criação de relatórios detalhados que atendem às especificações fornecidas, utilizando SQL.
