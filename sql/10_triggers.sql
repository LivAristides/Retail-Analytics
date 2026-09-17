/*===========================================================
Trigger 1 — tr_ValidarEstoque (INSTEAD OF INSERT)
===========================================================*/

CREATE TRIGGER tr_ValidarEstoque
ON Item_Pedido
INSTEAD OF INSERT
AS
BEGIN

    SET NOCOUNT ON;

    -- Verifica se existe estoque suficiente para TODOS os itens sendo inseridos
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Estoque e ON i.id_produto = e.id_produto
        WHERE e.quantidade < i.quantidade
    )
    BEGIN
        RAISERROR('Estoque insuficiente para concluir a venda.', 16, 1);
        RETURN;
    END

    -- Se passou na validação, insere de fato os itens
    INSERT INTO Item_Pedido (id_pedido, id_produto, quantidade, valor_unitario, desconto)
    SELECT id_pedido, id_produto, quantidade, valor_unitario, desconto
    FROM inserted;

END;
GO


/*===========================================================
Trigger 2 — tr_BaixarEstoque (AFTER INSERT)
===========================================================*/

CREATE TRIGGER tr_BaixarEstoque
ON Item_Pedido
AFTER INSERT
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE e
    SET e.quantidade = e.quantidade - i.quantidade
    FROM Estoque e
    INNER JOIN inserted i ON e.id_produto = i.id_produto;

END;
GO


/*===========================================================
Trigger 3 — tr_AtualizarValorPedido (AFTER INSERT)
===========================================================*/

CREATE TRIGGER tr_AtualizarValorPedido
ON Item_Pedido
AFTER INSERT
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE p
    SET p.valor_total = (
        SELECT SUM(ip.quantidade * ip.valor_unitario - ip.desconto)
        FROM Item_Pedido ip
        WHERE ip.id_pedido = p.id_pedido
    )
    FROM Pedido p
    WHERE p.id_pedido IN (SELECT DISTINCT id_pedido FROM inserted);

END;
GO


/*===========================================================
Trigger 4 — tr_LogAtualizacaoPedido (AFTER UPDATE)
===========================================================*/

CREATE TRIGGER tr_LogAtualizacaoPedido
ON Pedido
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO Log_Pedido (id_pedido, operacao, data_hora, usuario)
    SELECT 
        id_pedido, 
        'UPDATE', 
        GETDATE(), 
        SUSER_SNAME()
    FROM inserted;

END;
GO


/*===========================================================
Trigger 5 — tr_CancelarPedido (AFTER UPDATE)
===========================================================*/

CREATE TRIGGER tr_CancelarPedido
ON Pedido
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    -- Só age se o status realmente mudou PARA 'Cancelado'
    IF NOT EXISTS (
        SELECT 1 
        FROM inserted i
        INNER JOIN deleted d ON i.id_pedido = d.id_pedido
        WHERE i.status = 'Cancelado' AND d.status <> 'Cancelado'
    )
        RETURN;

    -- Devolve os produtos ao estoque
    UPDATE e
    SET e.quantidade = e.quantidade + ip.quantidade
    FROM Estoque e
    INNER JOIN Item_Pedido ip ON e.id_produto = ip.id_produto
    INNER JOIN inserted i ON ip.id_pedido = i.id_pedido
    INNER JOIN deleted d ON i.id_pedido = d.id_pedido
    WHERE i.status = 'Cancelado' AND d.status <> 'Cancelado';

    -- Registra o log do cancelamento
    INSERT INTO Log_Pedido (id_pedido, operacao, data_hora, usuario)
    SELECT 
        i.id_pedido, 
        'CANCELAMENTO', 
        GETDATE(), 
        SUSER_SNAME()
    FROM inserted i
    INNER JOIN deleted d ON i.id_pedido = d.id_pedido
    WHERE i.status = 'Cancelado' AND d.status <> 'Cancelado';

END;
GO