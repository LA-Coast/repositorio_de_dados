Drop schema if exists sistema_academico_matriculas;
Create Schema sistema_academico_matriculas;
USE sistema_academico_matriculas;

-- Criação e load da tabela origem
CREATE TABLE tab_origem (
    matricula varchar(10) PRIMARY KEY,
    curso int(2),
    ano int(4),
    semestre int(1),
    turno int(1),
    ingresso int(1),
    ra int(2),
    renda int(1),
    idade int(2),
    etnia int(1),
    sexo varchar(1)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\tab_origem.csv'
INTO TABLE tab_origem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE dim_curso (
    id_curso int(1) PRIMARY KEY,
    sigla_curso char(3),
    nome_curso varchar(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dim_curso.csv' 
INTO TABLE dim_curso 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

CREATE TABLE dim_turno (
    id_turno int(1) PRIMARY KEY,
    nome_turno varchar(10)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dim_turno.csv' 
INTO TABLE dim_turno 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


CREATE TABLE dim_ingresso (
    id_ingresso int(1) PRIMARY KEY,
    nome_ingresso varchar(30)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dim_ingresso.csv' 
INTO TABLE dim_ingresso 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

CREATE TABLE dim_etnia (
    id_etnia int(1) PRIMARY KEY,
    nome_etnia varchar(10)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dim_etnia.csv' 
INTO TABLE dim_etnia 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


CREATE TABLE dim_ra (
    id_ra int(2) PRIMARY KEY,
    nome_ra varchar(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dim_ra.csv' 
INTO TABLE dim_ra 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


CREATE TABLE dim_renda (
    id_renda int(1) PRIMARY KEY,
    faixa_renda varchar(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dim_renda.csv' 
INTO TABLE dim_renda 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

CREATE TABLE fato_ingressante (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10)
);

INSERT INTO fato_ingressante (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno)
SELECT 
	matricula,
	curso,
	sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno;

CREATE TABLE fato_forma_ingresso (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10),
    ingresso int(1),
    nome_ingresso varchar(30)
);

INSERT INTO fato_forma_ingresso (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno, ingresso, nome_ingresso)
SELECT 
	matricula,
    curso,
    sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno,
    ingresso,
    nome_ingresso
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno
	INNER JOIN dim_ingresso 
		ON tab_origem.ingresso = dim_ingresso.id_ingresso;


CREATE TABLE fato_regiao_administrativa (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10),
    ra int(2),
    nome_ra varchar(255)
);

INSERT INTO fato_regiao_administrativa (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno, ra, nome_ra)
SELECT 
	matricula,
    curso,
    sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno,
    ra,
    nome_ra
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno
	INNER JOIN dim_ra 
		ON tab_origem.ra = dim_ra.id_ra;
        

CREATE TABLE fato_renda (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10),
    renda int(1),
    faixa_renda varchar(255)
);

INSERT INTO fato_renda (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno, renda, faixa_renda)
SELECT 
	matricula,
    curso,
    sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno,
    renda,
    faixa_renda
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno
	INNER JOIN dim_renda 
		ON tab_origem.renda = dim_renda.id_renda;

CREATE TABLE fato_idade (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10),
    idade int(2)
);

INSERT INTO fato_idade (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno, idade)
SELECT 
	matricula,
    curso,
    sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno,
    idade
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno;
        
CREATE TABLE fato_etnia (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10),
    etnia int(1),
    nome_etnia varchar(10)
);

INSERT INTO fato_etnia (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno, etnia, nome_etnia)
SELECT 
	matricula,
    curso,
    sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno,
    etnia,
    nome_etnia
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno
	INNER JOIN dim_etnia 
		ON tab_origem.etnia = dim_etnia.id_etnia;
        
CREATE TABLE fato_sexo (
    id_matricula varchar(10) PRIMARY KEY,
    curso int(2),
    sigla_curso varchar(3),
    ano int(4),
    semestre int(2),
    turno varchar(1),
    nome_turno varchar(10),
    sexo varchar(1)
);

INSERT INTO fato_sexo (id_matricula, curso, sigla_curso, ano, semestre, turno, nome_turno, sexo)
SELECT 
	matricula,
	curso,
    sigla_curso,
    ano,
    semestre,
    turno,
    nome_turno,
    sexo
FROM tab_origem 
	INNER JOIN dim_curso 
		ON tab_origem.curso = dim_curso.id_curso 
	INNER JOIN dim_turno 
		ON tab_origem.turno = dim_turno.id_turno;




