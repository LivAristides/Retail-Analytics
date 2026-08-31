/*
===========================================================
Projeto : Retail Analytics
Script  : 04_indexes.sql
Objetivo: Criação dos índices para otimização das consultas
===========================================================
*/


USE RetailAnalytics;
GO


/*
===========================================================
CLIENTE
===========================================================
*/


CREATE INDEX IX_Cliente_Nome
ON Cliente(nome);

GO


CREATE INDEX IX_Cliente_Email
ON Cliente(email);

GO



/*
===========================================================
FORNECEDOR
===========================================================
*/


CREATE INDEX IX_Fornecedor_Nome
ON Fornecedor(nome);

GO



/*
===========================================================
FUNCIONARIO
===========================================================
*/


CREATE INDEX IX_Funcionario_Loja
ON Funcionario(id_loja);

GO


CREATE INDEX IX_Funcionario_Cargo
ON Funcionario(cargo);

GO



/*
===========================================================
PRODUTO
===========================================================
*/


CREATE INDEX IX_Produto_Categoria
ON Produto(id_categoria);

GO


CREATE INDEX IX_Produto_Fornecedor
ON Produto(id_fornecedor);

GO


CREATE INDEX IX_Produto_Nome
ON Produto(nome);

GO



/*
===========================================================
PEDIDO
===========================================================
*/


CREATE INDEX IX_Pedido_Cliente
ON Pedido(id_cliente);

GO


CREATE INDEX IX_Pedido_Funcionario
ON Pedido(id_funcionario);

GO


CREATE INDEX IX_Pedido_Loja
ON Pedido(id_loja);

GO


CREATE INDEX IX_Pedido_Data
ON Pedido(data_pedido);

GO


CREATE INDEX IX_Pedido_Status
ON Pedido(status);

GO



/*
===========================================================
ITEM_PEDIDO
===========================================================
*/


CREATE INDEX IX_ItemPedido_Pedido
ON Item_Pedido(id_pedido);

GO


CREATE INDEX IX_ItemPedido_Produto
ON Item_Pedido(id_produto);

GO



/*
===========================================================
PAGAMENTO
===========================================================
*/


CREATE INDEX IX_Pagamento_Pedido
ON Pagamento(id_pedido);

GO


CREATE INDEX IX_Pagamento_Forma
ON Pagamento(forma_pagamento);

GO



/*
===========================================================
ESTOQUE
===========================================================
*/


CREATE INDEX IX_Estoque_Produto
ON Estoque(id_produto);

GO


CREATE INDEX IX_Estoque_Loja
ON Estoque(id_loja);

GO



/*
===========================================================
ENDERECO
===========================================================
*/


CREATE INDEX IX_Endereco_Cliente
ON Endereco(id_cliente);

GO



/*
===========================================================
META COMERCIAL
===========================================================
*/


CREATE INDEX IX_MetaComercial_Funcionario
ON Meta_Comercial(id_funcionario);

GO


CREATE INDEX IX_MetaComercial_Periodo
ON Meta_Comercial(ano,mes);

GO