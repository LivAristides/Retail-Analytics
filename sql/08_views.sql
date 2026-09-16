/*View 1 — vw_Clientes*/

CREATE VIEW vw_Clientes AS
SELECT 
	c.nome,
	c.cpf,
	c.email,
	e.cidade,
	e.cep
FROM Cliente c
INNER JOIN Endereco e ON c.id_cliente = e.id_cliente;

/*Conculta*/
SELECT * FROM vw_Clientes;

/*View 2 — vw_Produtos*/

CREATE VIEW vw_Produtos AS
SELECT
    p.nome AS Nome_Produto,
    c.nome_categoria AS Nome_Categoria,
    f.nome AS Nome_Fornecedor,
    p.custo,
    p.preco_venda
FROM Produto p 
LEFT JOIN Categoria c ON p.id_categoria = c.id_categoria
LEFT JOIN Fornecedor f ON p.id_fornecedor = f.id_fornecedor;

/*Conculta*/
SELECT * FROM vw_Produtos;

/*View 3 — vw_Funcionarios*/

CREATE VIEW vw_Funcionarios AS
SELECT
    f.nome AS Nome_Funcionario,
    f.cargo,
    f.salario,
    l.nome_loja AS Nome_Loja,
    l.cidade
FROM Funcionario f
LEFT JOIN Loja l ON f.id_loja = l.id_loja;

/*Conculta*/
SELECT * FROM vw_Funcionarios

/*View 4 — vw_Pedidos*/

CREATE VIEW vw_Pedidos AS
SELECT
	p.id_pedido,
	c.nome AS Nome_Cliente,
	f.nome AS Nome_Funcionario,
	l.nome_loja AS Nome_Loja,
	t.nome AS Nome_Transportadora,
	p.data_pedido,
	p.valor_total
FROM Pedido p
LEFT JOIN Cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN Funcionario f ON p.id_funcionario = f.id_funcionario
LEFT JOIN Loja l ON p.id_loja = l.id_loja
LEFT JOIN Transportadora t ON p.id_transportadora = t.id_transportadora;

/*Conculta*/
SELECT * FROM vw_Pedidos;

/*View 5 — vw_Vendas*/

CREATE VIEW vw_Vendas AS
SELECT
    pd.id_pedido,
    p.nome AS Nome_Produto,
    cat.nome_categoria AS Nome_Categoria,
    i.quantidade,
    i.valor_unitario,
    i.desconto,
    l.nome_loja AS Nome_Loja,
    f.nome AS Nome_Funcionario,
    pd.data_pedido
FROM Item_Pedido i
LEFT JOIN Pedido pd ON i.id_pedido = pd.id_pedido
LEFT JOIN Produto p ON i.id_produto = p.id_produto
LEFT JOIN Categoria cat ON p.id_categoria = cat.id_categoria
LEFT JOIN Loja l ON pd.id_loja = l.id_loja
LEFT JOIN Funcionario f ON pd.id_funcionario = f.id_funcionario;

/*Conculta*/
SELECT * FROM vw_Vendas;


/*View 6 — vw_Estoque*/

CREATE VIEW vw_Estoque AS
SELECT
	l.nome_loja AS Nome_Loja,
	p.nome AS Nome_Produto,
	e.quantidade
FROM Estoque e
LEFT JOIN Loja l ON e.id_loja = l.id_loja
LEFT JOIN Produto p ON e.id_produto = p.id_produto;

/*Conculta*/
SELECT * FROM vw_Estoque;


/*View 7 — vw_Pagamentos*/

CREATE VIEW vw_Pagamentos AS
SELECT
    pg.id_pagamento AS Pagamento,
    c.nome AS Cliente,
    pg.forma_pagamento AS Forma_Pagamento,
    pg.valor_pago AS Valor_Pago,
    pg.data_pagamento AS Data
FROM Pagamento pg
LEFT JOIN Pedido p ON pg.id_pedido = p.id_pedido
LEFT JOIN Cliente c ON p.id_cliente = c.id_cliente;

/*Conculta*/
SELECT * FROM vw_Pagamentos;


/*View 8 — vw_Metas*/

CREATE VIEW vw_Metas AS
SELECT
    f.nome AS Funcionario,
    l.nome_loja AS Loja,
    mc.mes AS Mes,
    mc.ano AS Ano,
    mc.valor_meta AS Meta
FROM Meta_Comercial mc
LEFT JOIN Funcionario f ON mc.id_funcionario = f.id_funcionario
LEFT JOIN Loja l ON f.id_loja = l.id_loja;


/*Conculta*/
SELECT * FROM vw_Metas;


/*View 9 — vw_FaturamentoMensal*/

CREATE VIEW vw_FaturamentoMensal AS
SELECT
    YEAR(p.data_pedido) AS Ano,
    MONTH(p.data_pedido) AS Mes,
    COUNT(p.id_pedido) AS Pedidos,
    SUM(p.valor_total) AS Faturamento,
    AVG(p.valor_total) AS Ticket_Medio
FROM Pedido p
GROUP BY 
    YEAR(p.data_pedido),
    MONTH(p.data_pedido);


/*Conculta*/
SELECT * FROM vw_FaturamentoMensal;

/*View 10 — vw_DashboardExecutivo*/

CREATE VIEW vw_DashboardExecutivo AS
SELECT
    l.nome_loja AS Loja,
    l.cidade AS Cidade,
    c.nome AS Cliente,
    f.nome AS Funcionario,
    p.nome AS Produto,
    cat.nome_categoria AS Categoria,
    i.quantidade AS Quantidade,
    i.valor_unitario AS Valor_Unitario,
    i.desconto AS Desconto,
    pd.valor_total AS Valor_Total_Pedido,
    pd.data_pedido AS Data_Pedido
FROM Pedido pd
LEFT JOIN Cliente c ON pd.id_cliente = c.id_cliente
LEFT JOIN Funcionario f ON pd.id_funcionario = f.id_funcionario
LEFT JOIN Loja l ON pd.id_loja = l.id_loja
LEFT JOIN Item_Pedido i ON pd.id_pedido = i.id_pedido
LEFT JOIN Produto p ON i.id_produto = p.id_produto
LEFT JOIN Categoria cat ON p.id_categoria = cat.id_categoria;


/*Conculta*/
SELECT * FROM vw_DashboardExecutivo;