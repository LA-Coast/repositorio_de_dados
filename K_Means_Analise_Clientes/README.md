# Projeto de Análise de Clusters com K-Means

## Descrição do Projeto
Este projeto visa realizar uma análise descritiva de um grupo de clientes de uma operadora de cartão de crédito, utilizando o algoritmo de clusterização K-Means. O objetivo principal é segmentar os clientes em grupos distintos, identificar suas características gerais e atribuir a cada grupo um nome representativo, chamado de **PERSONA**.

## Objetivos
1. Identificar a quantidade ideal de grupos de clientes utilizando o método K-Means.
2. Selecionar e justificar as variáveis utilizadas na análise.
3. Nomear e descrever os perfis de cada PERSONA identificada.
4. Apresentar os resultados de forma clara e visualmente atraente.

## Ferramentas e Tecnologias Utilizadas
- Linguagem de programação: **Python**
- Bibliotecas:
  - `pandas` e `numpy` para manipulação de dados.
  - `sklearn` para implementação do algoritmo K-Means.
  - `matplotlib`, `seaborn` e `plotly` para visualização de dados.
  - `tqdm` para acompanhar a progressão de loops.

## Dataset
O dataset utilizado está disponível no [Kaggle](https://www.kaggle.com/datasets/sakshigoyal7/credit-card-customers). Ele contém informações sobre clientes de uma operadora de cartão de crédito, incluindo dados como límite de crédito, saldo rotativo, idade do cliente, entre outros.

## Metodologia
### 1. Carregamento e Exploração de Dados
- Leitura do dataset.
- Análise inicial das colunas e estatísticas descritivas.
- Seleção de variáveis relevantes (apenas variáveis numéricas).
- Normalização dos dados para garantir que todas as variáveis estejam na mesma escala.

### 2. Análise Exploratória
- Criação de gráficos de dispersão para entender a distribuição dos dados.
- Análise visual para identificar possíveis grupos.

### 3. Clusterização com K-Means
- **Escolha do número de clusters**: utilização do método do cotovelo para determinar a quantidade ideal de grupos.
- **Execução do algoritmo**: aplicação do K-Means com os parâmetros otimizados.
- **Nomeação dos clusters**: atribuição de nomes representativos com base nas características predominantes de cada grupo.

### 4. Visualização e Interpretação
- Gráficos de dispersão com os clusters identificados.
- Gráficos radar (spider) para comparar as características dos grupos.
- Gráficos de barras para análise comparativa das médias das variáveis por cluster.

## Resultados
### Personas Identificadas
1. **Conservador**: Clientes com baixo limite de crédito e saldo rotativo reduzido, indicando uma preferência por evitar dívidas.
2. **Consumista**: Clientes com alto limite de crédito e alto saldo rotativo, demonstrando maior propensão ao consumo.
3. **Moderado**: Clientes com baixo limite de crédito, mas que utilizam grande parte do limite disponível.
4. **Premium**: Clientes com alto limite de crédito e baixo saldo rotativo, indicando boa capacidade de pagamento com menor propensão ao consumo.

### Principais Métricas
- Tabela com as médias e medianas das variáveis selecionadas para cada cluster.
- Visualizações em 2D e 3D mostrando a distribuição dos clusters.

## Como Executar
1. Baixe o dataset no link do Kaggle fornecido.
2. Certifique-se de ter as bibliotecas Python instaladas.
3. Execute o notebook para reproduzir a análise.
