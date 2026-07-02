# Levantamento de Requisitos

> **Projeto:** Retail Analytics – Plataforma de Business Intelligence para uma Rede Nacional de Varejo
> **Documento:** Levantamento de Requisitos
> **Versão:** 1.0
> **Autor:** Lívia
> **Data:** Julho de 2026

---

# Histórico de Revisões

| Versão | Data       | Autor | Descrição                                          |
| ------ | ---------- | ----- | -------------------------------------------------- |
| 1.0    | Julho/2026 | Lívia | Criação do documento de levantamento de requisitos |

---

# Sumário

1. Objetivo
2. Escopo Funcional
3. Stakeholders
4. Perfis de Usuários
5. Requisitos Funcionais
6. Requisitos Não Funcionais
7. Regras Gerais do Sistema
8. Processos de Negócio
9. Indicadores Estratégicos (KPIs)
10. Premissas
11. Restrições
12. Critérios de Aceite
13. Conclusão

---

# 1. Objetivo

Este documento tem como objetivo especificar os requisitos funcionais e não funcionais da solução **Retail Analytics**, definindo todas as funcionalidades, regras e características que deverão ser implementadas durante o desenvolvimento do projeto.

O levantamento de requisitos servirá como base para as etapas de modelagem conceitual, modelagem lógica, implementação do banco de dados relacional, desenvolvimento do processo ETL, construção do Data Warehouse e criação dos dashboards analíticos.

---

# 2. Escopo Funcional

A solução deverá contemplar os seguintes processos de negócio:

* Cadastro de clientes;
* Cadastro de endereços;
* Cadastro de produtos;
* Cadastro de categorias;
* Cadastro de fornecedores;
* Cadastro de lojas;
* Cadastro de funcionários;
* Registro de pedidos;
* Registro dos itens de cada pedido;
* Registro de pagamentos;
* Controle de estoque por loja;
* Cadastro de transportadoras;
* Cadastro de metas comerciais;
* Disponibilização de dados para processos ETL;
* Construção do Data Warehouse;
* Construção de Data Marts;
* Disponibilização de indicadores para o Power BI.

---

# 3. Stakeholders

| Stakeholder         | Interesse                                |
| ------------------- | ---------------------------------------- |
| Diretoria Executiva | Acompanhar indicadores estratégicos      |
| Gerência Comercial  | Avaliar desempenho de vendas             |
| Gerência Financeira | Monitorar faturamento e lucratividade    |
| Marketing           | Analisar comportamento dos clientes      |
| Equipe de TI        | Administrar banco de dados               |
| Analista de Dados   | Desenvolver e manter a solução analítica |

---

# 4. Perfis de Usuários

## Diretoria

Responsável pelo acompanhamento dos indicadores estratégicos da organização.

Necessidades:

* Receita total;
* Lucro;
* Crescimento das vendas;
* Comparativos mensais;
* Indicadores consolidados.

---

## Gerência Comercial

Responsável pelo acompanhamento das operações comerciais.

Necessidades:

* Vendas por loja;
* Vendas por vendedor;
* Produtos mais vendidos;
* Categorias com maior faturamento;
* Metas comerciais.

---

## Gerência Financeira

Necessidades:

* Receita;
* Custos;
* Margem de lucro;
* Descontos concedidos;
* Formas de pagamento.

---

## Marketing

Necessidades:

* Perfil dos clientes;
* Faixa etária;
* Distribuição geográfica;
* Frequência de compra;
* Ticket médio.

---

## Analista de Dados

Responsável pela manutenção da solução.

Necessidades:

* Banco de dados consistente;
* Processos ETL;
* Data Warehouse;
* Documentação técnica.

---

# 5. Requisitos Funcionais

## Cadastro

| Código | Requisito                          |
| ------ | ---------------------------------- |
| RF01   | Permitir cadastrar clientes        |
| RF02   | Permitir atualizar clientes        |
| RF03   | Permitir consultar clientes        |
| RF04   | Permitir cadastrar endereços       |
| RF05   | Permitir cadastrar produtos        |
| RF06   | Permitir cadastrar categorias      |
| RF07   | Permitir cadastrar fornecedores    |
| RF08   | Permitir cadastrar lojas           |
| RF09   | Permitir cadastrar funcionários    |
| RF10   | Permitir cadastrar transportadoras |

## Operações

| Código | Requisito                    |
| ------ | ---------------------------- |
| RF11   | Registrar pedidos            |
| RF12   | Registrar itens dos pedidos  |
| RF13   | Registrar pagamentos         |
| RF14   | Atualizar estoque após venda |
| RF15   | Registrar metas de vendas    |

## Consultas

| Código | Requisito                     |
| ------ | ----------------------------- |
| RF16   | Consultar histórico de vendas |
| RF17   | Consultar vendas por cliente  |
| RF18   | Consultar vendas por produto  |
| RF19   | Consultar vendas por loja     |
| RF20   | Consultar vendas por vendedor |

## Business Intelligence

| Código | Requisito                        |
| ------ | -------------------------------- |
| RF21   | Disponibilizar dados para ETL    |
| RF22   | Alimentar o Data Warehouse       |
| RF23   | Alimentar Data Marts             |
| RF24   | Disponibilizar dados ao Power BI |
| RF25   | Gerar indicadores estratégicos   |

---

# 6. Requisitos Não Funcionais

| Código | Descrição                                                 |
| ------ | --------------------------------------------------------- |
| RNF01  | Utilizar SQL Server como banco de dados                   |
| RNF02  | Utilizar Git para controle de versão                      |
| RNF03  | Utilizar GitHub para hospedagem do projeto                |
| RNF04  | Utilizar Power BI para construção dos dashboards          |
| RNF05  | O banco deverá estar normalizado até a 3ª Forma Normal    |
| RNF06  | O Data Warehouse utilizará esquema estrela                |
| RNF07  | O ETL deverá permitir cargas incrementais                 |
| RNF08  | Todas as tabelas deverão possuir chave primária           |
| RNF09  | Todas as relações deverão possuir integridade referencial |
| RNF10  | As consultas deverão ser documentadas                     |
| RNF11  | O código deverá seguir padrão de nomenclatura             |
| RNF12  | O projeto deverá possuir documentação técnica             |
| RNF13  | Os dashboards deverão possuir filtros interativos         |
| RNF14  | O projeto deverá ser organizado em módulos                |
| RNF15  | Os scripts SQL deverão ser versionados                    |

---

# 7. Regras Gerais do Sistema

* Um cliente pode realizar vários pedidos.
* Cada pedido pertence a um único cliente.
* Um pedido deve possuir pelo menos um item.
* Cada item do pedido refere-se a apenas um produto.
* Um produto pertence a uma única categoria.
* Um fornecedor pode fornecer diversos produtos.
* Cada funcionário pertence a apenas uma loja.
* O estoque deverá ser atualizado após cada venda.
* Um pagamento deve estar associado a um pedido.
* Pedidos cancelados não deverão compor os indicadores de faturamento.

---

# 8. Processos de Negócio

## Processo de Venda

1. Cliente realiza um pedido.
2. O pedido é registrado no sistema.
3. Os produtos são adicionados ao pedido.
4. O pagamento é registrado.
5. O estoque é atualizado.
6. O pedido é enviado para entrega.
7. As informações ficam disponíveis para o processo ETL.

---

## Processo ETL

1. Extração dos dados operacionais.
2. Validação dos dados.
3. Limpeza e padronização.
4. Transformação.
5. Carga das dimensões.
6. Carga da tabela fato.
7. Atualização dos Data Marts.

---

# 9. Indicadores Estratégicos (KPIs)

## Comercial

* Receita Total
* Quantidade de Pedidos
* Ticket Médio
* Vendas por Loja
* Vendas por Vendedor
* Vendas por Categoria
* Produtos Mais Vendidos

## Financeiro

* Receita Líquida
* Lucro Bruto
* Margem de Lucro
* Descontos Concedidos

## Clientes

* Clientes Ativos
* Novos Clientes
* Clientes Inativos
* Frequência de Compra
* Ticket Médio por Cliente

## Produtos

* Produtos Mais Vendidos
* Produtos Sem Venda
* Curva ABC
* Margem por Produto

---

# 10. Premissas

* Os dados utilizados serão fictícios.
* O projeto será desenvolvido em ambiente local.
* O SQL Server será utilizado como banco de dados principal.
* Os dashboards serão desenvolvidos no Power BI Desktop.
* Todos os artefatos do projeto serão versionados no GitHub.

---

# 11. Restrições

* Não haverá integração com sistemas externos.
* Não serão utilizados dados reais.
* O projeto terá finalidade acadêmica e de portfólio.
* Não será realizada implantação em ambiente de produção.

---

# 12. Critérios de Aceite

O projeto será considerado apto para a próxima fase quando:

* Todos os requisitos estiverem documentados.
* As regras de negócio estiverem definidas.
* Os processos de negócio estiverem descritos.
* Os KPIs estiverem aprovados.
* A documentação estiver versionada no GitHub.

---

# 13. Conclusão

Este documento define os requisitos necessários para o desenvolvimento da solução Retail Analytics, estabelecendo uma base sólida para as próximas etapas do projeto.

A partir deste levantamento serão elaborados os documentos de regras de negócio, modelo conceitual, modelo lógico, diagrama entidade-relacionamento (DER), implementação do banco de dados, processos ETL, Data Warehouse, Data Marts e dashboards analíticos.

A definição clara dos requisitos garante que todas as fases do projeto permaneçam alinhadas aos objetivos do negócio e às necessidades dos futuros usuários da plataforma de Business Intelligence.
