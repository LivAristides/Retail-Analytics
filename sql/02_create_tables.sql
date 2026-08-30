/*===========================================================
 TABELA: CLIENTE
===========================================================*/

CREATE TABLE Cliente (

    id_cliente INT IDENTITY(1,1) PRIMARY KEY,

    nome VARCHAR(150) NOT NULL,

    cpf CHAR(11) NOT NULL,

    email VARCHAR(150) NOT NULL,

    data_nascimento DATE NOT NULL

);
GO

/*===========================================================
 TABELA: Categoria
===========================================================*/

CREATE TABLE Categoria (

    id_categoria INT IDENTITY(1,1),

    nome_categoria VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Categoria
        PRIMARY KEY (id_categoria)

);
GO

/*===========================================================
 TABELA: Fornecedor
===========================================================*/

CREATE TABLE Fornecedor (

    id_fornecedor INT IDENTITY(1,1),

    nome VARCHAR(150) NOT NULL,

    cnpj CHAR(14) NOT NULL,

    status VARCHAR(20) NOT NULL,

    CONSTRAINT PK_Fornecedor
        PRIMARY KEY (id_fornecedor)

);
GO

/*===========================================================
 TABELA: Loja
===========================================================*/

CREATE TABLE Loja (

    id_loja INT IDENTITY(1,1),

    nome_loja VARCHAR(150) NOT NULL,

    tipo_loja VARCHAR(30) NOT NULL,

    cidade VARCHAR(100) NOT NULL,

    estado CHAR(2) NOT NULL,

    CONSTRAINT PK_Loja
        PRIMARY KEY (id_loja)

);
GO

/*===========================================================
 TABELA: Transportadora
===========================================================*/

CREATE TABLE Transportadora (

    id_transportadora INT IDENTITY(1,1),

    nome VARCHAR(150) NOT NULL,

    prazo_medio_entrega INT NOT NULL,

    CONSTRAINT PK_Transportadora
        PRIMARY KEY (id_transportadora)

);
GO

/*===========================================================
 TABELA: Funcionário
===========================================================*/

CREATE TABLE Funcionario (

    id_funcionario INT IDENTITY(1,1),

	id_loja INT NOT NULL,

    nome VARCHAR(150) NOT NULL,

    cargo VARCHAR(100) NOT NULL,

	salario DECIMAL(10,2) NOT NULL,

	status VARCHAR(10) NOT NULL,

    CONSTRAINT PK_Funcionario
        PRIMARY KEY (id_funcionario)

);
GO

/*===========================================================
 TABELA: Produto
===========================================================*/

CREATE TABLE Produto (

    id_produto INT IDENTITY(1,1),

	id_categoria INT NOT NULL,

	id_fornecedor INT NOT NULL,

    nome VARCHAR(150) NOT NULL,

    descricao VARCHAR(200) NOT NULL,

	preco_venda DECIMAL(10,2) NOT NULL,

	custo DECIMAL(10,2) NOT NULL,

	status VARCHAR(10) NOT NULL,

    CONSTRAINT PK_Produto
        PRIMARY KEY (id_produto)

);
GO

/*===========================================================
 TABELA: Pedido
===========================================================*/

CREATE TABLE Pedido (

    id_pedido INT IDENTITY(1,1),

    id_cliente INT NOT NULL,

	id_funcionario INT NOT NULL,

	id_loja INT NOT NULL,

	id_transportadora INT NOT NULL,

    data_pedido DATE NOT NULL,

	status VARCHAR(10) NOT NULL,

	valor_total DECIMAL(10,2) NOT NULL,

    CONSTRAINT PK_Pedido
        PRIMARY KEY (id_pedido)

);
GO

/*===========================================================
 TABELA: Endereço
===========================================================*/

CREATE TABLE Endereco (

    id_endereco INT IDENTITY(1,1),

	id_cliente INT NOT NULL,

    logradouro VARCHAR(150) NOT NULL,

	numero VARCHAR(10) NOT NULL,

	cidade VARCHAR(50) NOT NULL,

	cep CHAR(8) NOT NULL,

    CONSTRAINT PK_Endereco
        PRIMARY KEY (id_endereco)

);
GO

/*===========================================================
 TABELA: Pagamento
===========================================================*/

CREATE TABLE Pagamento (

    id_pagamento INT IDENTITY(1,1),

	id_pedido INT NOT NULL,

	forma_pagamento VARCHAR(30) NOT NULL,

	valor_pago DECIMAL(10,2) NOT NULL,

    data_pagamento DATE NOT NULL,

	parcelas INT NOT NULL,

    CONSTRAINT PK_Pagamento
        PRIMARY KEY (id_pagamento)

);
GO

/*===========================================================
 TABELA: Estoque
===========================================================*/

CREATE TABLE Estoque (

    id_estoque INT IDENTITY(1,1),

	id_loja INT NOT NULL,

	id_produto INT NOT NULL,

	quantidade INT NOT NULL,

    CONSTRAINT PK_Estoque
        PRIMARY KEY (id_estoque)

);
GO

/*===========================================================
 TABELA: Meta Comercial
===========================================================*/

CREATE TABLE Meta_Comercial (

    id_meta_comercial INT IDENTITY(1,1),

	id_funcionario INT NOT NULL,

	mes TINYINT NOT NULL,

	ano INT NOT NULL,

	valor_meta DECIMAL(10,2) NOT NULL,

    CONSTRAINT PK_Meta_Comercial
        PRIMARY KEY (id_meta_comercial)

);
GO

/*===========================================================
 TABELA: Item Pedido
===========================================================*/

CREATE TABLE Item_Pedido (

    id_item_pedido INT IDENTITY(1,1),

	id_pedido INT NOT NULL,

	id_produto INT NOT NULL,

    quantidade INT NOT NULL,

	valor_unitario DECIMAL(10,2) NOT NULL,

	desconto DECIMAL(10,2) NOT NULL,

    CONSTRAINT PK_Item_Pedido
        PRIMARY KEY (id_item_pedido)

);
GO