# 🏨 AirBnB-- Sistema de Hospedagens e Aluguéis

## 📌 Sobre o projeto

Este projeto simula um **sistema de gestão de hospedagens e aluguéis**,
desenvolvido em **MySQL**, com o objetivo de aplicar conceitos de
**modelagem de dados, procedures, manipulação de datas, tratamento de
erros e consultas analíticas**.

O banco foi criado a partir de tabelas relacionadas a clientes,
proprietários, hospedagens, endereços, aluguéis e avaliações.

Além disso, foram desenvolvidas **Stored Procedures** para automatizar
processos de reserva e funções auxiliares para cálculo de datas,
garantindo consistência e integridade nos registros.

------------------------------------------------------------------------

## 🗄️ Estrutura do Banco de Dados

O banco é composto pelas seguintes entidades principais:

-   **Clientes** (`clientes`) → Cadastro de clientes com nome, CPF e
    contato.\
-   **Proprietários** (`proprietarios`) → Donos das hospedagens.\
-   **Endereços** (`enderecos`) → Informações de localização das
    hospedagens.\
-   **Hospedagens** (`hospedagens`) → Casas, apartamentos e hotéis
    disponíveis.\
-   **Aluguéis** (`alugueis`) → Reservas realizadas pelos clientes.\
-   **Avaliações** (`avaliacoes`) → Feedback dos clientes com notas e
    comentários.

Cada tabela está normalizada e possui chaves primárias e estrangeiras
para garantir a integridade referencial.

------------------------------------------------------------------------

## ⚙️ Stored Procedures

Foram criadas procedures para automatizar processos:

-   **`Novo_Aluguel_Procedures`** → Insere um novo aluguel na base,
    verificando se o cliente existe, calculando datas úteis e aplicando
    regras de negócio.\
-   **`calculaDataDesconto`** → Calcula a data final do aluguel
    considerando apenas **dias úteis** (ignora finais de semana).

Essas procedures incluem:\
✔️ Tratamento de erros de chave estrangeira\
✔️ Cálculo automático de preço total\
✔️ Geração automática do `aluguel_id`\
✔️ Mensagens de retorno amigáveis

------------------------------------------------------------------------

## 📊 Consultas SQL Analíticas

Além da modelagem e procedures, foram desenvolvidas queries para análise
de dados:

-   **Ticket Médio por Cliente**\
-   **Média de Estadia por Cliente**\
-   **Top 10 Proprietários com mais Hospedagens Ativas**\
-   **Hospedagens com Melhores e Piores Avaliações**\
-   **Receita Total por Mês**\
-   **Hospedagens com alta demanda e nota baixa**

Essas consultas simulam relatórios que poderiam ser usados em dashboards
de **BI**.

------------------------------------------------------------------------

## 🚀 Tecnologias Utilizadas

-   **MySQL 8.0**\
-   **Procedures e Triggers**\
-   **Consultas SQL Analíticas**

------------------------------------------------------------------------

## 📌 Objetivo de Aprendizado

Este projeto foi desenvolvido para reforçar:\
- Modelagem relacional com integridade referencial.\
- Automação de processos com Stored Procedures.\
- Tratamento de erros e regras de negócio no banco.\
- Criação de consultas analíticas para **Data Analysis**.

