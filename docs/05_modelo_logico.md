# Modelo Lógico

> **Projeto:** Retail Analytics – Plataforma de Business Intelligence para uma Rede Nacional de Varejo  
> **Documento:** Modelo Lógico  
> **Versão:** 1.0  
> **Autor:** Lívia  
> **Data:** Julho de 2026

---

# Histórico de Revisões

| Versão | Data | Autor | Descrição |
|--------|------|--------|-----------|
| 1.0 | Julho/2026 | Lívia | Criação do Modelo Lógico |

---

# Sumário

1. Objetivo  
2. Visão Geral do Modelo Lógico  
3. Modelo de Entidades  
4. Relacionamentos e Chaves  
5. Descrição das Tabelas  
6. Regras de Integridade  
7. Considerações para Implementação SQL  
8. Conclusão  

---

# 1. Objetivo

O Modelo Lógico tem como objetivo transformar o Modelo Conceitual em uma estrutura mais próxima de um banco de dados relacional.

Nesta etapa, são definidos:

- atributos das entidades;
- chaves primárias (PK);
- chaves estrangeiras (FK);
- relacionamentos formais entre tabelas.

Este modelo será a base para a implementação física no SQL Server.

---

# 2. Visão Geral do Modelo Lógico

O sistema Retail Analytics é composto por um modelo relacional que representa o processo de vendas da empresa SmartRetail.

As principais áreas modeladas são:

- Clientes e Endereços  
- Produtos, Categorias e Fornecedores  
- Pedidos e Itens de Pedido  
- Pagamentos e Estoque  
- Funcionários, Lojas e Metas Comerciais  
- Transportadoras  

---

# 3. Modelo de Entidades

## 3.1 Cliente

Cliente (entidade principal do sistema)

```text id="cli001"
Cliente (
    id_cliente (PK),
    nome,
    cpf,
    email,
    data_nascimento
)
```

---

## 3.2 Endereço

```text id="end001"
Endereco (
    id_endereco (PK),
    id_cliente (FK),
    logradouro,
    numero,
    cidade,
    estado,
    cep
)
```

---

## 3.3 Pedido

```text id="ped001"
Pedido (
    id_pedido (PK),
    id_cliente (FK),
    id_funcionario (FK),
    id_loja (FK),
    id_transportadora (FK),
    data_pedido,
    status,
    valor_total
)
```

---

## 3.4 Item do Pedido

```text id="item001"
Item_Pedido (
    id_item_pedido (PK),
    id_pedido (FK),
    id_produto (FK),
    quantidade,
    valor_unitario,
    desconto
)
```

---

## 3.5 Produto

```text id="prod001"
Produto (
    id_produto (PK),
    id_categoria (FK),
    id_fornecedor (FK),
    nome,
    descricao,
    preco_venda,
    custo,
    status
)
```

---

## 3.6 Categoria

```text id="cat001"
Categoria (
    id_categoria (PK),
    nome_categoria
)
```

---

## 3.7 Fornecedor

```text id="forn001"
Fornecedor (
    id_fornecedor (PK),
    nome,
    cnpj,
    status
)
```

---

## 3.8 Loja

```text id="loja001"
Loja (
    id_loja (PK),
    nome_loja,
    tipo_loja,
    cidade,
    estado
)
```

---

## 3.9 Funcionário

```text id="func001"
Funcionario (
    id_funcionario (PK),
    id_loja (FK),
    nome,
    cargo,
    salario,
    status
)
```

---

## 3.10 Pagamento

```text id="pag001"
Pagamento (
    id_pagamento (PK),
    id_pedido (FK),
    forma_pagamento,
    valor_pago,
    data_pagamento,
    parcelas
)
```

---

## 3.11 Estoque

```text id="est001"
Estoque (
    id_estoque (PK),
    id_produto (FK),
    id_loja (FK),
    quantidade
)
```

---

## 3.12 Transportadora

```text id="trans001"
Transportadora (
    id_transportadora (PK),
    nome,
    prazo_medio_entrega
)
```

---

## 3.13 Meta Comercial

```text id="meta001"
Meta_Comercial (
    id_meta (PK),
    id_funcionario (FK),
    mes,
    ano,
    valor_meta
)
```

---

# 4. Relacionamentos e Chaves

## Relacionamentos principais

```text id="rel001"
Cliente 1 ─── N Endereco
Cliente 1 ─── N Pedido

Pedido 1 ─── N Item_Pedido
Produto 1 ─── N Item_Pedido

Categoria 1 ─── N Produto
Fornecedor 1 ─── N Produto

Loja 1 ─── N Funcionario
Funcionario 1 ─── N Pedido

Pedido 1 ─── 1 Pagamento
Pedido N ─── 1 Transportadora

Produto 1 ─── N Estoque
Loja 1 ─── N Estoque

Funcionario 1 ─── N Meta_Comercial
```

---

# 5. Descrição das Tabelas

## Cliente
Armazena dados dos clientes que realizam compras.

## Endereco
Armazena múltiplos endereços por cliente.

## Pedido
Representa a venda realizada no sistema.

## Item_Pedido
Representa os produtos contidos em cada pedido.

## Produto
Representa os itens vendidos pela empresa.

## Categoria
Agrupamento de produtos por tipo.

## Fornecedor
Empresa responsável pelo fornecimento dos produtos.

## Loja
Unidades físicas ou virtuais de venda.

## Funcionario
Responsáveis pelas vendas e atendimento.

## Pagamento
Registro financeiro do pedido.

## Estoque
Controle de quantidade de produtos por loja.

## Transportadora
Responsável pela entrega dos pedidos.

## Meta_Comercial
Objetivos de vendas por funcionário.

---

# 6. Regras de Integridade

- Toda PK deve ser única e não nula  
- Toda FK deve respeitar integridade referencial  
- Não pode existir pedido sem cliente  
- Não pode existir item sem pedido  
- Não pode existir item sem produto  
- Estoque não pode ser negativo  
- CPF do cliente deve ser único  
- CNPJ do fornecedor deve ser único  
- Produto não pode ter preço negativo  
- Pagamento deve estar vinculado a um pedido  

---

# 7. Considerações para Implementação SQL

Este modelo será implementado no SQL Server com as seguintes práticas:

- Criação de tabelas normalizadas (até 3FN)  
- Definição de Primary Keys e Foreign Keys  
- Uso de constraints (CHECK, UNIQUE, NOT NULL)  
- Uso de triggers para controle de estoque  
- Uso de procedures para registro de pedidos  
- Índices para otimização de consultas  

---

# 8. Conclusão

O Modelo Lógico representa a transição entre a análise conceitual do negócio e a implementação física no banco de dados.

A partir deste modelo será possível construir o Diagrama Entidade-Relacionamento (DER) e posteriormente a estrutura física no SQL Server.

Este documento garante consistência entre as regras de negócio, o modelo conceitual e a futura implementação analítica da solução Retail Analytics.