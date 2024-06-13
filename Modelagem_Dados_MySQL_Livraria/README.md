# Modelagem de Dados Conceitual para Livraria

![Imagem da Entidade Relacionamento](https://github.com/LA-Coast/DataInsightsHub/blob/main/Modelagem_Dados_MySQL_Livraria/MR_livros_img.mwb.png)

## Descrição do Projeto
Este projeto consiste em criar um modelo conceitual para um banco de dados de uma livraria. O objetivo é representar as informações relevantes sobre clientes, livros, editoras e compras.

## Habilidades Utilizadas
Neste projeto, utilizei habilidades de modelagem de dados, incluindo a criação de diagramas Entidade-Relacionamento (ER) e a definição de cardinalidades nos relacionamentos.

## Requisitos do Modelo Proposto
1. **Clientes:**
   - Cada cliente possui um código único.
   - Informações a serem mantidas: nome, endereço, telefone, CPF.
   - Lista dos livros que o cliente já comprou, incluindo a data de cada compra.

2. **Livros:**
   - Cada livro possui um código único.
   - Informações a serem mantidas: nome do livro, nome do autor, assunto, editora, ISBN e quantidade em estoque.
   - Um livro pode ser vendido para vários clientes.

3. **Editoras:**
   - Cada editora possui um código único.
   - Informações a serem mantidas: nome, endereço, telefone de contato e nome do gerente.
   - A livraria compra livros de diferentes editoras.

4. **Relacionamentos:**
   - Cliente → Compra → Livro
   - Livro → Pertence à → Editora
