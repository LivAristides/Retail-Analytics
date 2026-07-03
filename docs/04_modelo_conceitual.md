# Modelo Conceitual

> **Projeto:** Retail Analytics – Plataforma de Business Intelligence para uma Rede Nacional de Varejo
> **Documento:** Modelo Conceitual
> **Versão:** 1.0
> **Autor:** Lívia
> **Data:** Julho de 2026

---

# Histórico de Revisões

| Versão | Data       | Autor | Descrição                    |
| ------ | ---------- | ----- | ---------------------------- |
| 1.0    | Julho/2026 | Lívia | Criação do Modelo Conceitual |

---

# Sumário

1. Objetivo
2. Visão Geral
3. Entidades Identificadas
4. Relacionamentos Conceituais
5. Descrição das Entidades
6. Diagrama Conceitual
7. Considerações Finais

---

# 1. Objetivo

O Modelo Conceitual representa uma visão de alto nível do domínio de negócio da SmartRetail.

Seu objetivo é identificar as principais entidades envolvidas no processo de vendas e seus relacionamentos, sem considerar aspectos técnicos de implementação, como tipos de dados, chaves primárias ou restrições físicas.

Este documento servirá como base para a elaboração do Modelo Lógico, do Diagrama Entidade-Relacionamento (DER) e da modelagem física do banco de dados.

---

# 2. Visão Geral

Após a análise dos requisitos e das regras de negócio, foram identificadas as entidades fundamentais que representam o funcionamento da empresa.

Essas entidades descrevem os elementos essenciais envolvidos no processo de vendas, controle de estoque, cadastro de clientes, fornecedores e geração de informações estratégicas.

O modelo busca representar o negócio de forma simples, clara e independente de tecnologia.

---

# 3. Entidades Identificadas

As seguintes entidades compõem o domínio do negócio:

| Entidade       | Descrição                                               |
| -------------- | ------------------------------------------------------- |
| Cliente        | Pessoa que realiza compras na empresa.                  |
| Endereço       | Localização cadastrada para cada cliente.               |
| Produto        | Item comercializado pela empresa.                       |
| Categoria      | Classificação dos produtos.                             |
| Fornecedor     | Empresa responsável pelo fornecimento dos produtos.     |
| Loja           | Unidade física ou virtual onde ocorre a venda.          |
| Funcionário    | Colaborador responsável pelo atendimento da venda.      |
| Pedido         | Registro principal da venda realizada.                  |
| Item do Pedido | Produtos pertencentes a cada pedido.                    |
| Pagamento      | Registro financeiro da venda.                           |
| Estoque        | Controle da quantidade disponível de produtos por loja. |
| Transportadora | Empresa responsável pela entrega dos pedidos.           |
| Meta Comercial | Objetivos mensais de vendas dos funcionários.           |

---

# 4. Relacionamentos Conceituais

Os principais relacionamentos identificados são:

* Um cliente realiza pedidos.
* Um pedido pertence a um cliente.
* Um pedido possui um ou mais itens.
* Cada item está associado a um produto.
* Um produto pertence a uma categoria.
* Um fornecedor fornece diversos produtos.
* Uma loja possui diversos funcionários.
* Um funcionário registra diversos pedidos.
* Um pedido possui um pagamento.
* Um pedido pode ser entregue por uma transportadora.
* Cada loja controla seu próprio estoque.
* Funcionários possuem metas comerciais mensais.

Esses relacionamentos representam o fluxo operacional da empresa e servirão como base para a modelagem lógica.

---

# 5. Descrição das Entidades

## Cliente

Representa a pessoa física ou jurídica que realiza compras na empresa.

Principais responsabilidades:

* manter informações cadastrais;
* registrar histórico de compras;
* possibilitar análises de comportamento.

---

## Endereço

Armazena as informações de localização do cliente.

Responsabilidades:

* endereço principal;
* cidade;
* estado;
* CEP.

---

## Produto

Representa cada item comercializado.

Responsabilidades:

* identificação;
* preço;
* custo;
* categoria;
* fornecedor.

---

## Categoria

Agrupa produtos com características semelhantes.

Exemplos:

* Smartphones
* Informática
* Games
* Televisores
* Eletrodomésticos

---

## Fornecedor

Representa as empresas responsáveis pelo fornecimento dos produtos.

---

## Loja

Representa uma unidade de venda.

Pode ser:

* Loja Física
* Loja Virtual (E-commerce)

---

## Funcionário

Representa o colaborador responsável pelo atendimento ao cliente e registro das vendas.

---

## Pedido

Representa a venda realizada.

Cada pedido possui:

* cliente;
* funcionário;
* loja;
* pagamento;
* itens.

---

## Item do Pedido

Representa cada produto vendido dentro de um pedido.

---

## Pagamento

Representa a forma utilizada para quitar o pedido.

---

## Estoque

Controla a quantidade disponível dos produtos em cada loja.

---

## Transportadora

Responsável pela entrega dos pedidos aos clientes.

---

## Meta Comercial

Representa as metas mensais atribuídas aos vendedores.

Será utilizada posteriormente na construção dos indicadores de desempenho.

---

# 6. Diagrama Conceitual

O diagrama conceitual será desenvolvido utilizando a ferramenta Draw.io.

O objetivo é representar visualmente as entidades identificadas e seus relacionamentos de negócio, servindo como referência para a construção do modelo lógico.

O arquivo será armazenado na pasta:

```text
diagrams/modelo_conceitual.drawio
```

Também será exportado para o formato PNG para facilitar sua visualização no GitHub.

---

# 7. Considerações Finais

O Modelo Conceitual representa uma visão simplificada do domínio de negócio da SmartRetail.

Nesta etapa não foram definidos atributos, tipos de dados ou restrições físicas, pois essas definições serão realizadas durante a construção do Modelo Lógico e do Diagrama Entidade-Relacionamento (DER).

A elaboração deste documento garante que a estrutura do banco de dados esteja alinhada às necessidades do negócio antes do início da implementação técnica.
