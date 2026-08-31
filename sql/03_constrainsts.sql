/*===========================================================
 Projeto : Retail Analytics
 Script  : 03_constraints.sql
 Objetivo: Criação das Foreign Keys, UNIQUE e CHECK Constraints
===========================================================*/

USE RetailAnalytics;
GO

/*===========================================================
                FOREIGN KEYS
===========================================================*/

/* Funcionario -> Loja */
ALTER TABLE Funcionario
ADD CONSTRAINT FK_Funcionario_Loja
FOREIGN KEY (id_loja)
REFERENCES Loja(id_loja);
GO

/* Produto -> Categoria */
ALTER TABLE Produto
ADD CONSTRAINT FK_Produto_Categoria
FOREIGN KEY (id_categoria)
REFERENCES Categoria(id_categoria);
GO

/* Produto -> Fornecedor */
ALTER TABLE Produto
ADD CONSTRAINT FK_Produto_Fornecedor
FOREIGN KEY (id_fornecedor)
REFERENCES Fornecedor(id_fornecedor);
GO

/* Pedido -> Cliente */
ALTER TABLE Pedido
ADD CONSTRAINT FK_Pedido_Cliente
FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente);
GO

/* Pedido -> Funcionario */
ALTER TABLE Pedido
ADD CONSTRAINT FK_Pedido_Funcionario
FOREIGN KEY (id_funcionario)
REFERENCES Funcionario(id_funcionario);
GO

/* Pedido -> Loja */
ALTER TABLE Pedido
ADD CONSTRAINT FK_Pedido_Loja
FOREIGN KEY (id_loja)
REFERENCES Loja(id_loja);
GO

/* Pedido -> Transportadora */
ALTER TABLE Pedido
ADD CONSTRAINT FK_Pedido_Transportadora
FOREIGN KEY (id_transportadora)
REFERENCES Transportadora(id_transportadora);
GO

/* Endereco -> Cliente */
ALTER TABLE Endereco
ADD CONSTRAINT FK_Endereco_Cliente
FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente);
GO

/* Pagamento -> Pedido */
ALTER TABLE Pagamento
ADD CONSTRAINT FK_Pagamento_Pedido
FOREIGN KEY (id_pedido)
REFERENCES Pedido(id_pedido);
GO

/* Estoque -> Loja */
ALTER TABLE Estoque
ADD CONSTRAINT FK_Estoque_Loja
FOREIGN KEY (id_loja)
REFERENCES Loja(id_loja);
GO

/* Estoque -> Produto */
ALTER TABLE Estoque
ADD CONSTRAINT FK_Estoque_Produto
FOREIGN KEY (id_produto)
REFERENCES Produto(id_produto);
GO

/* Meta_Comercial -> Funcionario */
ALTER TABLE Meta_Comercial
ADD CONSTRAINT FK_MetaComercial_Funcionario
FOREIGN KEY (id_funcionario)
REFERENCES Funcionario(id_funcionario);
GO

/* Item_Pedido -> Pedido */
ALTER TABLE Item_Pedido
ADD CONSTRAINT FK_ItemPedido_Pedido
FOREIGN KEY (id_pedido)
REFERENCES Pedido(id_pedido);
GO

/* Item_Pedido -> Produto */
ALTER TABLE Item_Pedido
ADD CONSTRAINT FK_ItemPedido_Produto
FOREIGN KEY (id_produto)
REFERENCES Produto(id_produto);
GO

/*===========================================================
                UNIQUE
===========================================================*/

ALTER TABLE Cliente
ADD CONSTRAINT UQ_Cliente_CPF
UNIQUE (cpf);
GO

ALTER TABLE Cliente
ADD CONSTRAINT UQ_Cliente_Email
UNIQUE (email);
GO

ALTER TABLE Fornecedor
ADD CONSTRAINT UQ_Fornecedor_CNPJ
UNIQUE (cnpj);
GO

/*===========================================================
                CHECKS
===========================================================*/

/* Funcionario */

ALTER TABLE Funcionario
ADD CONSTRAINT CK_Funcionario_Status
CHECK (status IN ('Ativo','Inativo'));
GO

ALTER TABLE Funcionario
ADD CONSTRAINT CK_Funcionario_Salario
CHECK (salario >= 0);
GO

/* Fornecedor */

ALTER TABLE Fornecedor
ADD CONSTRAINT CK_Fornecedor_Status
CHECK (status IN ('Ativo','Inativo'));
GO

/* Produto */

ALTER TABLE Produto
ADD CONSTRAINT CK_Produto_Status
CHECK (status IN ('Ativo','Inativo'));
GO

ALTER TABLE Produto
ADD CONSTRAINT CK_Produto_Preco
CHECK (preco_venda >= 0);
GO

ALTER TABLE Produto
ADD CONSTRAINT CK_Produto_Custo
CHECK (custo >= 0);
GO

/* Pedido */

ALTER TABLE Pedido
ADD CONSTRAINT CK_Pedido_Status
CHECK (status IN
('Pendente',
 'Pago',
 'Enviado',
 'Entregue',
 'Cancelado'));
GO

ALTER TABLE Pedido
ADD CONSTRAINT CK_Pedido_Valor
CHECK (valor_total >= 0);
GO

/* Pagamento */

ALTER TABLE Pagamento
ADD CONSTRAINT CK_Pagamento_Valor
CHECK (valor_pago >= 0);
GO

ALTER TABLE Pagamento
ADD CONSTRAINT CK_Pagamento_Parcelas
CHECK (parcelas >= 1);
GO

/* Transportadora */

ALTER TABLE Transportadora
ADD CONSTRAINT CK_Transportadora_Prazo
CHECK (prazo_medio_entrega >= 0);
GO

/* Estoque */

ALTER TABLE Estoque
ADD CONSTRAINT CK_Estoque_Quantidade
CHECK (quantidade >= 0);
GO

/* Item Pedido */

ALTER TABLE Item_Pedido
ADD CONSTRAINT CK_ItemPedido_Quantidade
CHECK (quantidade > 0);
GO

ALTER TABLE Item_Pedido
ADD CONSTRAINT CK_ItemPedido_Valor
CHECK (valor_unitario >= 0);
GO

ALTER TABLE Item_Pedido
ADD CONSTRAINT CK_ItemPedido_Desconto
CHECK (desconto >= 0);
GO

/* Meta Comercial */

ALTER TABLE Meta_Comercial
ADD CONSTRAINT CK_MetaComercial_Ano
CHECK (ano >= 2020);
GO

ALTER TABLE Meta_Comercial
ADD CONSTRAINT CK_MetaComercial_Mes
CHECK (mes IN
('Janeiro',
'Fevereiro',
'Março',
'Abril',
'Maio',
'Junho',
'Julho',
'Agosto',
'Setembro',
'Outubro',
'Novembro',
'Dezembro'));
GO