/*01 - Faturamento mensal*/

SELECT
    YEAR(data_pedido) AS Ano,
    MONTH(data_pedido) AS Mes,
    SUM(valor_total) AS Faturamento
FROM Pedido
GROUP BY
    YEAR(data_pedido),
    MONTH(data_pedido)
ORDER BY
    Ano,
    Mes;
GO

/*02 - Quantidade de pedidos por mês*/

SELECT
    YEAR(data_pedido) AS Ano,
    MONTH(data_pedido) AS Mes,
    COUNT(*) AS Quantidade_Pedidos
FROM Pedido
GROUP BY
    YEAR(data_pedido),
    MONTH(data_pedido)
ORDER BY
    Ano,
    Mes;
GO

/*03 - Ticket médio*/

SELECT
    YEAR(data_pedido) AS Ano,
    MONTH(data_pedido) AS Mes,
    AVG(valor_total) AS Ticket_Medio
FROM Pedido
GROUP BY
    YEAR(data_pedido),
    MONTH(data_pedido);
GO

/*04 - Top 10 clientes*/

SELECT TOP 10
    c.nome,
    SUM(p.valor_total) AS Total_Comprado
FROM Cliente c
INNER JOIN Pedido p
ON c.id_cliente = p.id_cliente
GROUP BY
    c.nome
ORDER BY
    Total_Comprado DESC;
GO

/*05 - Top 10 produtos*/

SELECT TOP 10
    pr.nome,
    SUM(ip.quantidade) AS Quantidade_Vendida
FROM Produto pr
INNER JOIN Item_Pedido ip
ON pr.id_produto = ip.id_produto
GROUP BY
    pr.nome
ORDER BY
    Quantidade_Vendida DESC;
GO

/*06 - Ranking funcionarios*/

SELECT
    f.nome,
    SUM(p.valor_total) AS Total_Vendido
FROM Funcionario f
INNER JOIN Pedido p
ON f.id_funcionario = p.id_funcionario
GROUP BY
    f.nome
ORDER BY
    Total_Vendido DESC;
GO

/*07 - Ranking lojas*/

SELECT
    l.nome_loja,
    SUM(p.valor_total) AS Faturamento
FROM Loja l
INNER JOIN Pedido p
ON l.id_loja = p.id_loja
GROUP BY
    l.nome_loja
ORDER BY
    Faturamento DESC;
GO


/*08 - Produtos sem venda*/

SELECT
    pr.nome
FROM Produto pr
LEFT JOIN Item_Pedido ip
ON pr.id_produto = ip.id_produto
WHERE ip.id_produto IS NULL;
GO

/*09 - Clientes sem pedidos*/

SELECT
    c.nome
FROM Cliente c
LEFT JOIN Pedido p
ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;
GO


/*10 - Produtos mais lucrativos*/

SELECT
    pr.nome,
    SUM((ip.valor_unitario - pr.custo) * ip.quantidade) AS Lucro_Total
FROM Produto pr
INNER JOIN Item_Pedido ip
ON pr.id_produto = ip.id_produto
GROUP BY
    pr.nome
ORDER BY
    Lucro_Total DESC;
GO


/*11 - Meta x Realizado*/

SELECT
    f.nome,
    SUM(mc.valor_meta) AS Meta,
    SUM(p.valor_total) AS Realizado,
    (SUM(p.valor_total) / SUM(mc.valor_meta)) * 100 AS Percentual
FROM Funcionario f
INNER JOIN Meta_Comercial mc
ON f.id_funcionario = mc.id_funcionario
INNER JOIN Pedido p
ON f.id_funcionario = p.id_funcionario
GROUP BY
    f.nome;
GO

/*12 - Crescimento mensal*/

WITH Vendas AS
(
SELECT
    YEAR(data_pedido) AS Ano,
    MONTH(data_pedido) AS Mes,
    SUM(valor_total) AS Total
FROM Pedido
GROUP BY
    YEAR(data_pedido),
    MONTH(data_pedido)
)

SELECT
    Ano,
    Mes,
    Total,
    LAG(Total) OVER(ORDER BY Ano,Mes) AS Mes_Anterior,
    Total - LAG(Total) OVER(ORDER BY Ano,Mes) AS Crescimento
FROM Vendas;
GO


/*13 - Row_number*/

SELECT
    nome,
    preco_venda,
    ROW_NUMBER() OVER(ORDER BY preco_venda DESC) AS Ranking
FROM Produto;
GO

/*14 - Rank()*/

SELECT
    nome,
    preco_venda,
    RANK() OVER(ORDER BY preco_venda DESC) AS Ranking
FROM Produto;
GO


/*15 - Dense_Rank()*/

SELECT
    nome,
    preco_venda,
    DENSE_RANK() OVER(ORDER BY preco_venda DESC) AS Ranking
FROM Produto;
GO


/*16 - Participação das lojas*/

SELECT
    l.nome_loja,
    SUM(p.valor_total) AS Total,
    SUM(p.valor_total) * 100.0 /
    SUM(SUM(p.valor_total)) OVER() AS Percentual
FROM Loja l
INNER JOIN Pedido p
ON l.id_loja = p.id_loja
GROUP BY
    l.nome_loja;
GO

/*17 - Curva ABC*/

WITH Curva AS
(
SELECT
    pr.nome,
    SUM(ip.quantidade * ip.valor_unitario) AS Faturamento
FROM Produto pr
INNER JOIN Item_Pedido ip
ON pr.id_produto = ip.id_produto
GROUP BY
    pr.nome
)

SELECT
    *,
    CASE

        WHEN Faturamento >= 50000 THEN 'A'

        WHEN Faturamento >= 20000 THEN 'B'

        ELSE 'C'

    END AS Classe
FROM Curva
ORDER BY
    Faturamento DESC;
GO


/*18 - CTE*/

WITH ProdutosCaros AS
(
SELECT
    nome,
    preco_venda
FROM Produto
WHERE preco_venda > 500
)

SELECT *
FROM ProdutosCaros;
GO


/*19 - Produtos por categoria*/

SELECT
    c.nome_categoria,
    COUNT(pr.id_produto) AS Quantidade,
    SUM(ip.quantidade * ip.valor_unitario) AS Receita
FROM Categoria c
INNER JOIN Produto pr
ON c.id_categoria = pr.id_categoria
INNER JOIN Item_Pedido ip
ON pr.id_produto = ip.id_produto
GROUP BY
    c.nome_categoria;
GO

/*20 - Dashboard executivo*/

SELECT

    pe.id_pedido,

    pe.data_pedido,

    c.nome AS Cliente,

    f.nome AS Funcionario,

    l.nome_loja,

    pr.nome AS Produto,

    ca.nome_categoria,

    ip.quantidade,

    ip.valor_unitario,

    ip.desconto,

    pe.valor_total,

    (ip.valor_unitario - pr.custo) * ip.quantidade AS Lucro

FROM Pedido pe

INNER JOIN Cliente c
ON pe.id_cliente = c.id_cliente

INNER JOIN Funcionario f
ON pe.id_funcionario = f.id_funcionario

INNER JOIN Loja l
ON pe.id_loja = l.id_loja

INNER JOIN Item_Pedido ip
ON pe.id_pedido = ip.id_pedido

INNER JOIN Produto pr
ON ip.id_produto = pr.id_produto

INNER JOIN Categoria ca
ON pr.id_categoria = ca.id_categoria;
GO