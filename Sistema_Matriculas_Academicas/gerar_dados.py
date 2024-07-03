import pandas as pd
import numpy as np
import random
import string

# Parâmetros
num_registros = 1000
cursos = [1, 2, 3, 4, 5]
turnos = [1, 2, 3]
anos = [2020, 2021, 2022]
semestres = [1, 2]
formas_ingresso = [1, 2, 3]
ra_max = 35
renda_faixas = [1, 2, 3, 4]
etnias = [1, 2, 3, 4, 5]
idades = range(16, 101)
sexos = ["M", "F"]

# Função para gerar matrículas aleatórias
def gerar_matricula():
    letras = ''.join(random.choices(string.ascii_uppercase, k=3))
    numeros = ''.join(random.choices(string.digits, k=6))
    return letras + numeros

# Função para salvar dados em CSV
def salvar_csv(nome_tabela, dados, colunas):
    df = pd.DataFrame(dados, columns=colunas)
    df.to_csv(f'{nome_tabela}.csv', index=False)

# Gerar dados aleatórios para a tabela de origem
np.random.seed(0)  # Para reprodutibilidade
random.seed(0)  # Para reprodutibilidade das matrículas
dados_origem = {
    'matricula': [gerar_matricula() for _ in range(num_registros)],
    'curso': np.random.choice(cursos, num_registros),
    'ano': np.random.choice(anos, num_registros),
    'semestre': np.random.choice(semestres, num_registros),
    'turno': np.random.choice(turnos, num_registros),
    'ingresso': np.random.choice(formas_ingresso, num_registros),
    'ra': np.random.randint(1, ra_max + 1, num_registros),
    'renda': np.random.choice(renda_faixas, num_registros),
    'idade': np.random.choice(idades, num_registros),
    'etnia': np.random.choice(etnias, num_registros),
    'sexo': np.random.choice(sexos, num_registros)
}

# Criar DataFrame e salvar em CSV
df_origem = pd.DataFrame(dados_origem)
df_origem.to_csv('tab_origem.csv', index=False)

# Dados das tabelas dimensões
cursos_dim = [
    (1, 'ADS', 'Análise e Desenvolvimento de Sistemas'),
    (2, 'CD', 'Ciência de Dados'),
    (3, 'GTI', 'Gestão da Tecnologia da Informação'),
    (4, 'SI', 'Segurança da Informação'),
    (5, 'RH', 'Recursos Humanos')
]

turnos_dim = [
    (1, 'Matutino'),
    (2, 'Vespertino'),
    (3, 'Noturno')
]

ingressos_dim = [
    (1, 'Vestibular'),
    (2, 'Segunda Graduação'),
    (3, 'Transferência')
]

etnias_dim = [
    (1, 'Branca'),
    (2, 'Preta'),
    (3, 'Parda'),
    (4, 'Indígena'),
    (5, 'Amarela')
]

ra_dim = [
    (1, 'Plano Piloto'),
    (2, 'Gama'),
    (3, 'Taguatinga'),
    (4, 'Brazlândia'),
    (5, 'Sobradinho'),
    (6, 'Planaltina'),
    (7, 'Paranoá'),
    (8, 'Núcleo Bandeirante'),
    (9, 'Ceilândia'),
    (10, 'Guará'),
    (11, 'Cruzeiro'),
    (12, 'Samambaia'),
    (13, 'Santa Maria'),
    (14, 'São Sebastião'),
    (15, 'Recanto das Emas'),
    (16, 'Lago Sul'),
    (17, 'Riacho Fundo'),
    (18, 'Lago Norte'),
    (19, 'Candangolândia'),
    (20, 'Águas Claras'),
    (21, 'Riacho Fundo 2'),
    (22, 'Sudoeste/Octogonal'),
    (23, 'Varjão'),
    (24, 'Park Way'),
    (25, 'Estrutural/Scia'),
    (26, 'Sobradinho II'),
    (27, 'Jardim Botânico'),
    (28, 'Itapoã'),
    (29, 'SIA'),
    (30, 'Vicente Pires'),
    (31, 'Fercal'),
    (32, 'Sol Nascente/Pôr do Sol'),
    (33, 'Arniqueira'),
    (34, 'Arapoanga1'),
    (35, 'Água Quente1')
]

faixa_renda_dim = [
    (1, 'Baixa renda'),
    (2, 'Média baixa'),
    (3, 'Média alta'),
    (4, 'Alta renda')
]

# Salvando cada dimensão em um arquivo CSV
salvar_csv('dim_curso', cursos_dim, ['id_curso', 'sigla_curso', 'nome_curso'])
salvar_csv('dim_turno', turnos_dim, ['id_turno', 'nome_turno'])
salvar_csv('dim_ingresso', ingressos_dim, ['id_ingresso', 'nome_ingresso'])
salvar_csv('dim_etnia', etnias_dim, ['id_etnia', 'nome_etnia'])
salvar_csv('dim_ra', ra_dim, ['id_ra', 'nome_ra'])
salvar_csv('dim_renda', faixa_renda_dim, ['id_renda', 'faixa_renda'])

print("Arquivos CSV gerados com sucesso!")
