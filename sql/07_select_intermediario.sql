/*===========================================================
 Projeto : Retail Analytics
 Script  : 07_select_intermediario.sql
 Objetivo: Consultas intermediárias
===========================================================*/

USE RetailAnalytics;
GO

/*===========================================================
1. Pedidos com informações do cliente
===========================================================*/

SELECT
    p.id_pedido,
    c.nome AS Cliente,
    p.data_pedido,
    p.valor_total
FROM Pedido p
INNER JOIN Cliente c
    ON p.id_cliente = c.id_cliente;
GO

/*===========================================================
2. Produtos e suas categorias
===========================================================*/

SELECT
    pr.nome AS Produto,
    c.nome_categoria AS Categoria,
    pr.preco_venda
FROM Produto pr
INNER JOIN Categoria c
    ON pr.id_categoria = c.id_categoria;
GO

/*===========================================================
3. Produtos e fornecedores
===========================================================*/

SELECT
    pr.nome AS Produto,
    f.nome AS Fornecedor,
    pr.custo,
    pr.preco_venda
FROM Produto pr
INNER JOIN Fornecedor f
    ON pr.id_fornecedor = f.id_fornecedor;
GO

/*===========================================================
4. Funcionários e suas lojas
===========================================================*/

SELECT
    f.nome AS Funcionario,
    f.cargo,
    l.nome_loja,
    l.cidade
FROM Funcionario f
INNER JOIN Loja l
    ON f.id_loja = l.id_loja;
GO

/*===========================================================
5. Quantidade de pedidos por cliente
===========================================================*/

SELECT
    c.nome AS Cliente,
    COUNT(p.id_pedido) AS Quantidade_Pedidos
FROM Cliente c
INNER JOIN Pedido p
    ON c.id_cliente = p.id_cliente
GROUP BY
    c.nome
ORDER BY
    Quantidade_Pedidos DESC;
GO

/*===========================================================
6. Valor total vendido por loja
===========================================================*/

SELECT
    l.nome_loja,
    SUM(p.valor_total) AS Total_Vendido
FROM Loja l
INNER JOIN Pedido p
    ON l.id_loja = p.id_loja
GROUP BY
    l.nome_loja
ORDER BY
    Total_Vendido DESC;
GO

/*===========================================================
7. Ticket médio por cliente
===========================================================*/

SELECT
    c.nome AS Cliente,
    AVG(p.valor_total) AS Ticket_Medio
FROM Cliente c
INNER JOIN Pedido p
    ON c.id_cliente = p.id_cliente
GROUP BY
    c.nome
ORDER BY
    Ticket_Medio DESC;
GO

/*===========================================================
8. Funcionários com salário acima da média
===========================================================*/

SELECT 
	f.nome AS Funcionario, 
	f.salario AS Salario
FROM Funcionario f
WHERE 
	f.salario > (SELECT AVG(salario) FROM Funcionario);

/*Cálculo da Média geral*/
SELECT 
	AVG(salario) AS Media_Geral
FROM Funcionario;


/*===========================================================
9. Produtos sem estoque
===========================================================*/

SELECT 
	p.id_produto, 
	p.nome, 
	e.quantidade
FROM Produto p
LEFT JOIN Estoque e ON p.id_produto = e.id_produto
WHERE e.quantidade = 0
ORDER BY p.nome;

/*Todos os produtos e suas quantidades em estoque*/
SELECT 
	p.id_produto, 
	p.nome, 
	e.quantidade
FROM Produto p
LEFT JOIN Estoque e ON p.id_produto = e.id_produto
ORDER BY p.nome;

/*===========================================================
10. Clientes que nunca compraram
===========================================================*/

SELECT 
    c.id_cliente, 
    c.nome
FROM Cliente c
LEFT JOIN Pedido p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY c.nome;


/*===========================================================
11. Top 10 clientes que mais compraram
===========================================================*/

SELECT TOP 10
    c.id_cliente,
    c.nome,
    COUNT(p.id_pedido) AS Total_Pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY Total_Pedidos DESC;

/*===========================================================
12. Produtos mais vendidos
===========================================================*/

SELECT
    p.nome,
    SUM(i.quantidade) AS Quantidade_Total
FROM Produto p 
INNER JOIN Item_Pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome
ORDER BY Quantidade_Total DESC;


/*===========================================================
13. Faturamento por categoria
===========================================================*/

SELECT
	c.nome_categoria,
	SUM(i.quantidade*i.valor_unitario) AS Faturamento_Total
FROM Categoria c
INNER JOIN Produto p ON c.id_categoria = p.id_categoria
INNER JOIN Item_Pedido i ON p.id_produto = i.id_produto
GROUP BY c.nome_categoria
ORDER BY Faturamento_Total DESC;


/*===========================================================
14. Desempenho dos vendedores
===========================================================*/

SELECT
    f.nome AS Funcionario,
    COUNT(p.id_pedido) AS Quantidade_Pedidos,
    SUM(p.valor_total) AS Valor_Vendido
FROM Funcionario f
INNER JOIN Pedido p ON f.id_funcionario = p.id_funcionario
GROUP BY f.nome
ORDER BY Valor_Vendido DESC;

/*===========================================================
15. Dashboard SQL (Desafio Final)
===========================================================*/

SELECT
    l.nome_loja AS Loja,
    YEAR(p.data_pedido) AS Ano,
    MONTH(p.data_pedido) AS Mes,
    COUNT(p.id_pedido) AS Quantidade_Pedidos,
    SUM(p.valor_total) AS Valor_Vendido,
    AVG(p.valor_total) AS Ticket_Medio
FROM Loja l
INNER JOIN Pedido p ON l.id_loja = p.id_loja
GROUP BY 
    l.nome_loja,
    YEAR(p.data_pedido),
    MONTH(p.data_pedido)
ORDER BY 
    l.nome_loja,
    Ano,
    Mes;

