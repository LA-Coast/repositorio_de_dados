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
O dataset utilizado está disponível no [Kaggle](https://www.kaggle.com/datasets/sakshigoyal7/credit-card-customers). Ele contém informações sobre clientes de uma operadora de cartão de crédito, incluindo dados como limite de crédito, saldo rotativo, idade do cliente, entre outros.

## Metodologia
### 1. Carregamento e Exploração de Dados
#### Código:
```python
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler

df = pd.read_csv('credit_card_customers.csv')
print(df.head())

# Seleção de variáveis relevantes
data = df[['Credit_Limit', 'Total_Revolving_Bal', 'Avg_Open_To_Buy']]

# Normalização dos dados
scaler = StandardScaler()
data_scaled = scaler.fit_transform(data)
```

### 2. Análise Exploratória
#### Código:
```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.pairplot(df[['Credit_Limit', 'Total_Revolving_Bal', 'Avg_Open_To_Buy']])
plt.show()
```

### 3. Clusterização com K-Means
#### Escolha do número de clusters:
```python
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

inertia = []
for k in range(1, 11):
    kmeans = KMeans(n_clusters=k, random_state=42)
    kmeans.fit(data_scaled)
    inertia.append(kmeans.inertia_)

plt.plot(range(1, 11), inertia, marker='o')
plt.title('Método do Cotovelo')
plt.xlabel('Número de Clusters')
plt.ylabel('Inércia')
plt.show()
```

#### Execução do algoritmo:
```python
kmeans = KMeans(n_clusters=4, random_state=42)
kmeans.fit(data_scaled)

# Adicionando os clusters ao DataFrame original
df['Cluster'] = kmeans.labels_
```

#### Nomeação dos clusters:
```python
def nomear_clusters(row):
    if row['Cluster'] == 0:
        return 'Conservador'
    elif row['Cluster'] == 1:
        return 'Consumista'
    elif row['Cluster'] == 2:
        return 'Moderado'
    elif row['Cluster'] == 3:
        return 'Premium'

# Aplicando as nomeações
df['Persona'] = df.apply(nomear_clusters, axis=1)
```

### 4. Visualização e Interpretação
#### Gráficos de dispersão:
```python
import plotly.express as px

fig = px.scatter_3d(
    df, x='Credit_Limit', y='Total_Revolving_Bal', z='Avg_Open_To_Buy',
    color='Cluster', title='Clusters Identificados'
)
fig.show()
```

#### Gráficos radar (spider):
```python
def radar_chart(data, cluster_id):
    from math import pi
    import matplotlib.pyplot as plt

    cluster_data = data[data['Cluster'] == cluster_id].mean()
    categories = list(data.columns[:-2])

    values = cluster_data.tolist()
    values += values[:1]

    angles = [n / float(len(categories)) * 2 * pi for n in range(len(categories))]
    angles += angles[:1]

    plt.figure(figsize=(8, 8))
    ax = plt.subplot(111, polar=True)
    plt.xticks(angles[:-1], categories, color='grey', size=8)
    ax.plot(angles, values, linewidth=1, linestyle='solid')
    ax.fill(angles, values, alpha=0.4)
    plt.title(f'Cluster {cluster_id}', size=20, color='blue', y=1.1)
    plt.show()

# Exemplo de uso
for cluster_id in range(4):
    radar_chart(df, cluster_id)
```

### 5. Entregas
- Link para o notebook do projeto.
- Vídeo de apresentação (10 minutos).

## Resultados
### Personas Identificadas
1. **Conservador**: Clientes com baixo limite de crédito e saldo rotativo reduzido, indicando uma preferência por evitar dívidas.
   - **Imagem sugerida:** Exemplo de perfil visual "Conservador".
2. **Consumista**: Clientes com alto limite de crédito e alto saldo rotativo, demonstrando maior propensão ao consumo.
   - **Imagem sugerida:** Exemplo de perfil visual "Consumista".
3. **Moderado**: Clientes com baixo limite de crédito, mas que utilizam grande parte do limite disponível.
   - **Imagem sugerida:** Exemplo de perfil visual "Moderado".
4. **Premium**: Clientes com alto limite de crédito e baixo saldo rotativo, indicando boa capacidade de pagamento com menor propensão ao consumo.
   - **Imagem sugerida:** Exemplo de perfil visual "Premium".

### Principais Métricas
#### Código para cálculo das métricas:
```python
metrics = df.groupby('Cluster').mean()
print(metrics)
```

- Tabela com as médias e medianas das variáveis selecionadas para cada cluster.
  - **Imagem sugerida:** Tabela resumo das métricas dos clusters.
- Visualizações em 2D e 3D mostrando a distribuição dos clusters.
  - **Imagem sugerida:** Gráficos de dispersão mostrando as separações claras entre clusters.

## Como Executar
1. Baixe o dataset no link do Kaggle fornecido.
2. Certifique-se de ter as bibliotecas Python instaladas.
3. Execute o notebook para reproduzir a análise.

#### Código para execução do notebook:
```python
!pip install pandas numpy scikit-learn matplotlib seaborn plotly tqdm

# Certifique-se de ter o dataset salvo localmente como 'credit_card_customers.csv'.
```

## Contato
Em caso de dúvidas ou sugestões, entre em contato com o grupo através do e-mail: [email@example.com](mailto:email@example.com).

