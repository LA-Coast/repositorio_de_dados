### README para o Projeto

# Análise de Dados de Arrecadação Fiscal

## Descrição
Este projeto realiza a análise de dados fiscais da Receita Federal, abordando arrecadação tributária e previdenciária de 2021 a 2023. Ele é baseado em quatro datasets principais: séries históricas por ano e dados desagregados por estado. O objetivo é identificar padrões, realizar comparações e oferecer insights sobre a arrecadação tributária no Brasil.

## Estrutura dos Dados
Os dados utilizados neste projeto incluem:
1. **Séries Históricas de Arrecadação**:
   - `serie_historica_2021`: Dados de arrecadação de 2021.
   - `serie_historica_2022`: Dados de arrecadação de 2022.
   - `serie_historica_2023`: Dados de arrecadação de 2023.
   - **Observações**: Dados transpostos, colunas renomeadas com base na primeira linha.
2. **Arrecadação por Estado**:
   - `arrecadacao_estado`: Dados de arrecadação por UF, incluindo informações sobre impostos e contribuições previdenciárias.
   - **Observações**: Dados numéricos convertidos para tipos adequados; filtrados para os anos de 2021-2023.

## Objetivos do Projeto
- **Análise Temporal**: Identificar a evolução da arrecadação ao longo dos anos.
- **Análise Geográfica**: Avaliar a distribuição da arrecadação entre os estados.
- **Comparação Tributária**: Estudar a proporção de impostos diretos e indiretos.
- **Tendências Mensais**: Explorar sazonalidades nos dados.

## Metodologia
1. **Tratamento de Dados**:
   - Transposição e limpeza das séries históricas.
   - Conversão de dados para tipos numéricos.
   - Tratamento de valores ausentes.
2. **Análises Realizadas**:
   - Comparação entre arrecadação estadual e nacional.
   - Análise de picos sazonais na arrecadação.
   - Comparação de arrecadação entre tipos de tributos.
3. **Visualizações**:
   - Gráficos de barras para arrecadação total anual.
   - Comparações regionais e temporais.

## Ferramentas Utilizadas
- **Linguagens**: Python.
- **Bibliotecas**: Pandas, NumPy, Seaborn, Matplotlib.
- **Ambiente**: Jupyter Notebook.

## Resultados
- Identificação de padrões de crescimento anual na arrecadação.
- Destaque de disparidades regionais na contribuição fiscal.
- Análise das contribuições previdenciárias e seus impactos.
- Insights sobre sazonalidade e impacto de políticas tributárias.

