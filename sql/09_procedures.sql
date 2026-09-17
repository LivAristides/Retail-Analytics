/*===========================================================
1 — sp_CadastrarCliente
===========================================================*/

CREATE PROCEDURE sp_CadastrarCliente
(
    @nome VARCHAR(150),
    @cpf VARCHAR(11),
    @email VARCHAR(150),
    @data_nascimento DATE
)
AS
BEGIN

 IF EXISTS (SELECT 1 FROM Cliente WHERE cpf = @cpf)
    BEGIN
        RAISERROR('Já existe um cliente cadastrado com esse CPF.', 16, 1);
        RETURN;
    END

    INSERT INTO Cliente
    (
        nome,
        cpf,
        email,
        data_nascimento
    )
    VALUES
    (
        @nome,
        @cpf,
        @email,
        @data_nascimento
    );

END;
GO



/*===========================================================
2 — sp_AtualizarEmailCliente
===========================================================*/

CREATE PROCEDURE sp_AtualizarEmailCliente
(
    @id_cliente INT,
    @novo_email VARCHAR(150)
)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE id_cliente = @id_cliente)
    BEGIN
        RAISERROR('Cliente não encontrado.', 16, 1);
        RETURN;
    END

    UPDATE Cliente
    SET email = @novo_email
    WHERE id_cliente = @id_cliente;

END;
GO


/*===========================================================
3 — sp_CadastrarProduto
===========================================================*/

CREATE PROCEDURE sp_CadastrarProduto
(
    @id_categoria INT,
    @id_fornecedor INT,
    @nome VARCHAR(150),
    @descricao VARCHAR(200),
    @preco_venda DECIMAL(10,2),
    @custo DECIMAL(10,2),
    @status VARCHAR(10)
)
AS
BEGIN

    IF EXISTS (SELECT 1 FROM Produto WHERE nome = @nome)
    BEGIN
        RAISERROR('Já existe um produto cadastrado com esse nome.', 16, 1);
        RETURN;
    END

    INSERT INTO Produto
    (
        id_categoria,
        id_fornecedor,
        nome,
        descricao,
        preco_venda,
        custo,
        status
    )
    VALUES
    (
        @id_categoria,
        @id_fornecedor,
        @nome,
        @descricao,
        @preco_venda,
        @custo,
        @status
    );

END;
GO




/*===========================================================
4 — sp_RegistrarPedido
===========================================================*/

CREATE PROCEDURE sp_RegistrarPedido
(
    @id_cliente INT,
    @id_funcionario INT,
    @id_loja INT,
    @id_transportadora INT,
    @data_pedido DATE,
    @valor_total DECIMAL(10,2),
    @status VARCHAR(10)
)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE id_cliente = @id_cliente)
    BEGIN
        RAISERROR('Cliente não encontrado.', 16, 1);
        RETURN;
    END

    INSERT INTO Pedido
    (
        id_cliente,
        id_funcionario,
        id_loja,
        id_transportadora,
        data_pedido,
        valor_total,
        status
    )
    VALUES
    (
        @id_cliente,
        @id_funcionario,
        @id_loja,
        @id_transportadora,
        @data_pedido,
        @valor_total,
        @status
    );

END;
GO



/*===========================================================
5 — sp_CancelarPedido
===========================================================*/

CREATE PROCEDURE sp_CancelarPedido
(
    @id_pedido INT
)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Pedido WHERE id_pedido = @id_pedido)
    BEGIN
        RAISERROR('Pedido não encontrado.', 16, 1);
        RETURN;
    END

    UPDATE Pedido
    SET status = 'Cancelado'
    WHERE id_pedido = @id_pedido;

END;
GO


/*===========================================================
6 — sp_AtualizarEstoque
===========================================================*/

CREATE PROCEDURE sp_AtualizarEstoque
(
    @id_produto INT,
    @id_loja INT,
    @nova_quantidade INT
)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Estoque WHERE id_produto = @id_produto AND id_loja = @id_loja)
    BEGIN
        RAISERROR('Registro de estoque não encontrado para esse produto/loja.', 16, 1);
        RETURN;
    END

    UPDATE Estoque
    SET quantidade = @nova_quantidade
    WHERE id_produto = @id_produto
      AND id_loja = @id_loja;

END;
GO


/*===========================================================
7 — sp_RelatorioVendasPeriodo
===========================================================*/

CREATE PROCEDURE sp_RelatorioVendasPeriodo
(
    @DataInicial DATE,
    @DataFinal DATE
)
AS
BEGIN

    SELECT
        p.id_pedido AS Pedido,
        c.nome AS Cliente,
        p.valor_total AS Valor,
        p.data_pedido AS Data
    FROM Pedido p
    INNER JOIN Cliente c ON p.id_cliente = c.id_cliente
    WHERE p.data_pedido BETWEEN @DataInicial AND @DataFinal
    ORDER BY p.data_pedido;

END;
GO


/*===========================================================
8 — sp_RankingClientes
===========================================================*/

CREATE PROCEDURE sp_RankingClientes
AS
BEGIN

    SELECT
        c.nome AS Cliente,
        SUM(p.valor_total) AS Valor_Comprado
    FROM Pedido p
    INNER JOIN Cliente c ON p.id_cliente = c.id_cliente
    GROUP BY c.nome
    ORDER BY Valor_Comprado DESC;

END;
GO


/*===========================================================
9 — sp_RankingProdutos
===========================================================*/

CREATE PROCEDURE sp_RankingProdutos
AS
BEGIN

    SELECT
        p.nome AS Produto,
        SUM(i.quantidade) AS Quantidade_Vendida
    FROM Produto p
    INNER JOIN Item_Pedido i ON p.id_produto = i.id_produto
    GROUP BY p.nome
    ORDER BY Quantidade_Vendida DESC;

END;
GO


/*===========================================================
10 — sp_FaturamentoMensal
===========================================================*/

CREATE PROCEDURE sp_FaturamentoMensal
AS
BEGIN

    SELECT
        YEAR(p.data_pedido) AS Ano,
        MONTH(p.data_pedido) AS Mes,
        SUM(p.valor_total) AS Faturamento,
        COUNT(p.id_pedido) AS Pedidos,
        AVG(p.valor_total) AS Ticket_Medio
    FROM Pedido p
    GROUP BY
        YEAR(p.data_pedido),
        MONTH(p.data_pedido)
    ORDER BY Ano, Mes;

END;
GO