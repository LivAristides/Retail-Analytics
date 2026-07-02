# Regras de Negócio

> **Projeto:** Retail Analytics – Plataforma de Business Intelligence para uma Rede Nacional de Varejo
> **Documento:** Regras de Negócio
> **Versão:** 1.0
> **Autor:** Lívia
> **Data:** Julho de 2026

---

# Histórico de Revisões

| Versão | Data       | Autor | Descrição                                 |
| ------ | ---------- | ----- | ----------------------------------------- |
| 1.0    | Julho/2026 | Lívia | Criação do documento de regras de negócio |

---

# Sumário

1. Objetivo
2. Conceitos do Negócio
3. Regras Gerais
4. Regras de Clientes
5. Regras de Endereços
6. Regras de Produtos
7. Regras de Categorias
8. Regras de Fornecedores
9. Regras de Funcionários
10. Regras de Lojas
11. Regras de Pedidos
12. Regras de Itens do Pedido
13. Regras de Pagamentos
14. Regras de Estoque
15. Regras de Transportadoras
16. Regras de Metas Comerciais
17. Regras Analíticas
18. Regras para ETL
19. Regras para Data Warehouse
20. Conclusão

---

# 1. Objetivo

Este documento estabelece as regras de negócio que deverão ser respeitadas durante o desenvolvimento da solução Retail Analytics.

As regras descritas servirão de base para:

* modelagem conceitual;
* modelagem lógica;
* implementação do banco de dados;
* definição de chaves e restrições;
* desenvolvimento de procedures e triggers;
* construção do processo ETL;
* modelagem dimensional;
* criação dos dashboards no Power BI.

---

# 2. Conceitos do Negócio

A SmartRetail comercializa produtos por meio de lojas físicas e comércio eletrônico.

Cada venda é registrada como um pedido, contendo um ou mais produtos, vinculados a um cliente, processados por um funcionário e associados a uma loja.

Os dados gerados nessas operações serão posteriormente utilizados para análises estratégicas em um ambiente de Business Intelligence.

---

# 3. Regras Gerais

| Código | Regra                                                        | Impacto                             |
| ------ | ------------------------------------------------------------ | ----------------------------------- |
| RN001  | Um cliente pode realizar vários pedidos.                     | Relação 1:N entre Cliente e Pedido. |
| RN002  | Todo pedido pertence a um único cliente.                     | Chave estrangeira em Pedido.        |
| RN003  | Um pedido deve possuir pelo menos um item.                   | Validação no cadastro de pedidos.   |
| RN004  | Um item pertence a um único pedido.                          | Integridade referencial.            |
| RN005  | Cada produto pertence a uma única categoria.                 | FK entre Produto e Categoria.       |
| RN006  | Um fornecedor pode fornecer diversos produtos.               | Relação 1:N.                        |
| RN007  | Cada funcionário pertence a apenas uma loja.                 | FK entre Funcionário e Loja.        |
| RN008  | Um pagamento está vinculado a um único pedido.               | FK entre Pagamento e Pedido.        |
| RN009  | Todo pedido deverá possuir um status válido.                 | Constraint de domínio.              |
| RN010  | O estoque deverá ser atualizado após a confirmação da venda. | Trigger ou procedure.               |

---

# 4. Regras de Clientes

| Código | Regra                                              |
| ------ | -------------------------------------------------- |
| RN011  | O CPF deve ser único.                              |
| RN012  | O cliente deve possuir nome completo.              |
| RN013  | A data de nascimento não pode ser futura.          |
| RN014  | O e-mail deverá possuir formato válido.            |
| RN015  | O cliente poderá possuir apenas um cadastro ativo. |
| RN016  | Todo cliente deverá possuir um endereço principal. |

---

# 5. Regras de Endereços

| Código | Regra                                                                     |
| ------ | ------------------------------------------------------------------------- |
| RN017  | Todo endereço deve possuir CEP válido.                                    |
| RN018  | O estado deverá utilizar a sigla oficial (UF).                            |
| RN019  | Cidade e estado são obrigatórios.                                         |
| RN020  | Um cliente poderá alterar seu endereço sem perder o histórico de compras. |

---

# 6. Regras de Produtos

| Código | Regra                                                         |
| ------ | ------------------------------------------------------------- |
| RN021  | Todo produto deve possuir categoria.                          |
| RN022  | Todo produto deve possuir fornecedor.                         |
| RN023  | O preço de venda deve ser maior que zero.                     |
| RN024  | O custo não poderá ser negativo.                              |
| RN025  | Produtos poderão ser descontinuados sem exclusão do cadastro. |
| RN026  | O código do produto deverá ser único.                         |

---

# 7. Regras de Categorias

| Código | Regra                                  |
| ------ | -------------------------------------- |
| RN027  | Cada categoria possui vários produtos. |
| RN028  | O nome da categoria deverá ser único.  |

---

# 8. Regras de Fornecedores

| Código | Regra                                                  |
| ------ | ------------------------------------------------------ |
| RN029  | Um fornecedor poderá fornecer vários produtos.         |
| RN030  | O CNPJ deverá ser único.                               |
| RN031  | O fornecedor deverá possuir situação ativa ou inativa. |

---

# 9. Regras de Funcionários

| Código | Regra                                                     |
| ------ | --------------------------------------------------------- |
| RN032  | Cada funcionário pertence a apenas uma loja.              |
| RN033  | Um funcionário poderá registrar vários pedidos.           |
| RN034  | Funcionários inativos não poderão registrar novas vendas. |

---

# 10. Regras de Lojas

| Código | Regra                                             |
| ------ | ------------------------------------------------- |
| RN035  | Cada loja possui seu próprio estoque.             |
| RN036  | Toda loja deverá possuir gerente responsável.     |
| RN037  | A loja poderá ser física ou virtual (e-commerce). |

---

# 11. Regras de Pedidos

| Código | Regra                                             |
| ------ | ------------------------------------------------- |
| RN038  | Todo pedido deverá possuir cliente.               |
| RN039  | Todo pedido deverá possuir data e hora.           |
| RN040  | Todo pedido deverá possuir status.                |
| RN041  | O valor total será calculado pela soma dos itens. |
| RN042  | Pedidos cancelados deverão manter histórico.      |
| RN043  | Não será permitida exclusão física de pedidos.    |

Status permitidos:

* Em Aberto
* Pago
* Faturado
* Enviado
* Entregue
* Cancelado

---

# 12. Regras de Itens do Pedido

| Código | Regra                                                   |
| ------ | ------------------------------------------------------- |
| RN044  | Cada item refere-se a apenas um produto.                |
| RN045  | A quantidade deverá ser maior que zero.                 |
| RN046  | O desconto não poderá ultrapassar 50% do valor do item. |
| RN047  | O preço unitário será armazenado no momento da venda.   |

---

# 13. Regras de Pagamentos

| Código | Regra                                                   |
| ------ | ------------------------------------------------------- |
| RN048  | Todo pedido deverá possuir pagamento registrado.        |
| RN049  | O pagamento poderá ser parcelado em até 12 vezes.       |
| RN050  | O valor pago deverá ser igual ao valor final do pedido. |

Formas de pagamento:

* Pix
* Cartão de Crédito
* Cartão de Débito
* Dinheiro
* Boleto

---

# 14. Regras de Estoque

| Código | Regra                                                       |
| ------ | ----------------------------------------------------------- |
| RN051  | O estoque nunca poderá ficar negativo.                      |
| RN052  | Cada loja possui controle próprio de estoque.               |
| RN053  | O estoque será reduzido após confirmação da venda.          |
| RN054  | Cancelamentos deverão devolver os produtos ao estoque.      |
| RN055  | O sistema deverá registrar a última atualização do estoque. |

---

# 15. Regras de Transportadoras

| Código | Regra                                                              |
| ------ | ------------------------------------------------------------------ |
| RN056  | Um pedido poderá possuir apenas uma transportadora.                |
| RN057  | A transportadora deverá possuir prazo médio de entrega cadastrado. |

---

# 16. Regras de Metas Comerciais

| Código | Regra                                                                 |
| ------ | --------------------------------------------------------------------- |
| RN058  | Cada vendedor possuirá metas mensais.                                 |
| RN059  | As metas serão definidas por mês e ano.                               |
| RN060  | O desempenho será calculado comparando meta versus vendas realizadas. |

---

# 17. Regras Analíticas

Estas regras serão utilizadas na construção dos indicadores do Data Warehouse e dos dashboards.

| Código | Regra                                                                                 |
| ------ | ------------------------------------------------------------------------------------- |
| RN061  | Pedidos cancelados não deverão compor o faturamento.                                  |
| RN062  | O ticket médio será calculado dividindo a receita pela quantidade de pedidos válidos. |
| RN063  | O lucro será calculado pela diferença entre receita e custo.                          |
| RN064  | O faturamento mensal utilizará a data do pedido faturado.                             |
| RN065  | Clientes sem compras há mais de 12 meses serão considerados inativos.                 |
| RN066  | Produtos sem vendas por 180 dias serão classificados como baixa rotatividade.         |

---

# 18. Regras para ETL

Durante o processo de extração, transformação e carga deverão ser aplicadas as seguintes validações:

* Remoção de registros duplicados.
* Padronização de datas.
* Padronização das siglas dos estados.
* Conversão de textos para formato consistente.
* Tratamento de valores nulos.
* Validação das chaves estrangeiras.
* Registro de logs de execução.
* Identificação de erros de carga.

---

# 19. Regras para Data Warehouse

O ambiente analítico deverá seguir as seguintes diretrizes:

* Utilização de esquema estrela.
* Criação de chaves substitutas (Surrogate Keys).
* Separação entre tabelas fato e dimensões.
* Implementação de carga incremental.
* Preservação do histórico dos dados.
* Criação de Data Marts por área de negócio.
* Utilização de tabela calendário para análises temporais.

---

# 20. Conclusão

As regras de negócio apresentadas neste documento representam a base para todas as etapas seguintes do projeto Retail Analytics.

Essas regras orientarão a modelagem conceitual, a modelagem lógica, a implementação do banco de dados relacional, os processos ETL, a construção do Data Warehouse e o desenvolvimento dos dashboards no Power BI.

Qualquer alteração nas regras aqui definidas deverá ser refletida em todos os artefatos do projeto, garantindo consistência entre documentação, banco de dados e solução analítica.
