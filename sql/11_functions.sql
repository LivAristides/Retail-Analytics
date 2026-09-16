/*===========================================================
Function 1 - fn_CalcularIdade
===========================================================*/
CREATE FUNCTION fn_CalcularIdade
(
    @data_nascimento DATE
)
RETURNS INT
AS
BEGIN

    DECLARE @idade INT;

    SET @idade = DATEDIFF(YEAR, @data_nascimento, GETDATE())
        - CASE 
            WHEN (MONTH(@data_nascimento) > MONTH(GETDATE())) 
                OR (MONTH(@data_nascimento) = MONTH(GETDATE()) AND DAY(@data_nascimento) > DAY(GETDATE()))
            THEN 1
            ELSE 0
          END;

    RETURN @idade;

END;




SELECT nome, data_nascimento, dbo.fn_CalcularIdade(data_nascimento) AS Idade
FROM Cliente;

/*===========================================================
Function 2 — fn_LucroProduto
===========================================================*/

CREATE FUNCTION fn_LucroProduto
(
    @preco_venda DECIMAL(10,2),
    @custo DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @lucro DECIMAL(10,2);
    SET @lucro = @preco_venda - @custo;
    RETURN @lucro;
END;
GO



SELECT dbo.fn_LucroProduto(150, 100) AS Lucro; 

/*===========================================================
Function 3 — fn_MargemLucro
===========================================================*/

CREATE FUNCTION fn_MargemLucro
(
    @preco_venda DECIMAL(10,2),
    @custo DECIMAL(10,2)
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @margem DECIMAL(5,2);
    SET @margem = CASE 
        WHEN @preco_venda = 0 THEN 0
        ELSE ((@preco_venda - @custo) / @preco_venda) * 100
    END;
    RETURN @margem;
END;
GO



SELECT dbo.fn_MargemLucro(150, 100) AS Margem; 

/*===========================================================
Function 4 — fn_TotalComprasCliente
===========================================================*/

CREATE FUNCTION fn_TotalComprasCliente
(
    @id_cliente INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total DECIMAL(10,2);
    SELECT @total = SUM(valor_total)
    FROM Pedido
    WHERE id_cliente = @id_cliente;
    RETURN ISNULL(@total, 0);
END;
GO


SELECT dbo.fn_TotalComprasCliente(1) AS Total_Compras;

/*===========================================================
Function 5 — fn_QuantidadePedidosCliente
===========================================================*/

CREATE FUNCTION fn_QuantidadePedidosCliente
(
    @id_cliente INT
)
RETURNS INT
AS
BEGIN
    DECLARE @quantidade INT;
    SELECT @quantidade = COUNT(*)
    FROM Pedido
    WHERE id_cliente = @id_cliente;
    RETURN @quantidade;
END;
GO



SELECT dbo.fn_QuantidadePedidosCliente(1) AS Qtd_Pedidos;

/*===========================================================
Function 6 — fn_TicketMedioCliente
===========================================================*/

CREATE FUNCTION fn_TicketMedioCliente
(
    @id_cliente INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @ticket_medio DECIMAL(10,2);
    SELECT @ticket_medio = AVG(valor_total)
    FROM Pedido
    WHERE id_cliente = @id_cliente;
    RETURN ISNULL(@ticket_medio, 0);
END;
GO



SELECT dbo.fn_TicketMedioCliente(1) AS Ticket_Medio;

/*===========================================================
Function 7 — fn_TotalVendidoFuncionario
===========================================================*/

CREATE FUNCTION fn_TotalVendidoFuncionario
(
    @id_funcionario INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total DECIMAL(10,2);
    SELECT @total = SUM(valor_total)
    FROM Pedido
    WHERE id_funcionario = @id_funcionario;
    RETURN ISNULL(@total, 0);
END;
GO



SELECT dbo.fn_TotalVendidoFuncionario(1) AS Total_Vendido;

/*===========================================================
Function 8 — fn_QuantidadeProdutosCategoria
===========================================================*/

CREATE FUNCTION fn_QuantidadeProdutosCategoria
(
    @id_categoria INT
)
RETURNS INT
AS
BEGIN
    DECLARE @quantidade INT;
    SELECT @quantidade = COUNT(*)
    FROM Produto
    WHERE id_categoria = @id_categoria;
    RETURN @quantidade;
END;
GO



SELECT dbo.fn_QuantidadeProdutosCategoria(1) AS Qtd_Produtos;