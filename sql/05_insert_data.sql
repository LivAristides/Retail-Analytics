/*===========================================================
 INSERT: Categoria
===========================================================*/

USE RetailAnalytics;
GO

IF NOT EXISTS (SELECT 1 FROM Categoria)
BEGIN

    INSERT INTO Categoria (nome_categoria)
    VALUES
    ('Smartphones'),
    ('Notebooks'),
    ('Tablets'),
    ('Monitores'),
    ('Televisores'),
    ('Consoles'),
    ('Periféricos'),
    ('Impressoras'),
    ('Armazenamento'),
    ('Redes'),
    ('Smart Home'),
    ('Áudio'),
    ('Câmeras'),
    ('Wearables'),
    ('Acessórios');

END;
GO



/*===========================================================
 INSERT: Cliente
===========================================================*/


USE RetailAnalytics;
GO


INSERT INTO Cliente
(
    nome,
    cpf,
    email,
    data_nascimento
)

VALUES

('Ana Beatriz Souza','58392718450','anabeatrizsouza1@email.com','1994-03-12'),
('Carlos Eduardo Lima','19483756102','carloseduardolima2@email.com','1988-07-25'),
('Mariana Oliveira Santos','73829104561','marianaoliveirasantos3@email.com','1996-11-08'),
('João Pedro Ferreira','92837465103','joaopedroferreira4@email.com','1990-05-21'),
('Fernanda Alves Costa','38475619204','fernandaalvescosta5@email.com','1998-01-17'),
('Lucas Henrique Martins','64738291055','lucashenriquemartins6@email.com','1987-09-30'),
('Juliana Ribeiro Silva','83920174656','julianaribeirosilva7@email.com','1993-04-15'),
('Rafael Gomes Pereira','47582930187','rafaelgomespereira8@email.com','1985-12-03'),
('Camila Rodrigues Almeida','91827364598','camilarodriguesalmeida9@email.com','1997-06-19'),
('Bruno Carvalho Mendes','56473829109','brunocarvalhomendes10@email.com','1991-10-27'),

('Larissa Monteiro Rocha','28374651910','larissamonteirorocha11@email.com','1995-02-11'),
('Gabriel Santos Oliveira','83746592021','gabrielsantosoliveira12@email.com','1989-08-14'),
('Patrícia Fernandes Lima','72638491032','patriciafernandeslima13@email.com','1992-12-20'),
('Mateus Barbosa Vieira','91827354643','mateusbarbosavieira14@email.com','1996-03-05'),
('Beatriz Martins Souza','56473829154','beatrizmartinssouza15@email.com','1999-07-09'),
('Felipe Almeida Costa','83746592065','felipealmeidacosta16@email.com','1986-11-22'),
('Amanda Ribeiro Santos','72638491076','amandaribeirosantos17@email.com','1994-09-18'),
('Thiago Pereira Gomes','91827354687','thiagopereiragomes18@email.com','1988-02-28'),
('Carolina Mendes Silva','56473829198','carolinamendessilva19@email.com','1997-05-16'),
('Rodrigo Ferreira Alves','83746592019','rodrigoferreiraalves20@email.com','1990-10-10'),

('Isabela Rocha Martins','72638491020','isabelarochamartins21@email.com','1995-06-25'),
('Gustavo Oliveira Lima','91827354631','gustavooliveiralima22@email.com','1987-03-14'),
('Marcos Vinícius Souza','56473829142','marcosviniciussouza23@email.com','1984-12-01'),
('Natália Carvalho Santos','83746592053','nataliacarvalhosantos24@email.com','1993-08-08'),
('Daniel Ribeiro Costa','72638491064','danielribeirocosta25@email.com','1989-04-19'),

('Letícia Fernandes Oliveira','91827354675','leticiafernandesoliveira26@email.com','1996-10-07'),
('Henrique Alves Pereira','56473829186','henriquealvespereira27@email.com','1985-05-30'),
('Vitória Martins Rodrigues','83746592097','vitoriamartinsrodrigues28@email.com','1998-09-12'),
('Leonardo Gomes Silva','72638491008','leonardogomessilva29@email.com','1991-01-26'),
('Aline Barbosa Costa','91827354619','alinebarbosacosta30@email.com','1994-07-31'),

('Pedro Henrique Almeida','56473829120','pedrohenriquealmeida31@email.com','1988-11-15'),
('Renata Souza Ferreira','83746592031','renatasouzaferreira32@email.com','1995-03-23'),
('Eduardo Lima Santos','72638491042','eduardolimasantos33@email.com','1986-06-18'),
('Bianca Oliveira Martins','91827354653','biancaoliveiramartins34@email.com','1997-12-09'),
('André Carvalho Ribeiro','56473829164','andrecarvalhoribeiro35@email.com','1990-02-04'),

('Sofia Mendes Alves','83746592075','sofiamendesalves36@email.com','1999-05-27'),
('Vinícius Rocha Pereira','72638491086','viniciusrochapereira37@email.com','1987-08-16'),
('Cláudia Fernandes Silva','91827354697','claudiafernandessilva38@email.com','1993-11-11'),
('Diego Santos Costa','56473829108','diegosantoscosta39@email.com','1991-04-06'),
('Manuela Ribeiro Lima','83746592019','manuelaribeirolima40@email.com','1998-10-22');

GO

/*===========================================================
 INSERT: Fornecedor
===========================================================*/


USE RetailAnalytics;
GO


INSERT INTO Fornecedor
(
    nome,
    cnpj,
    status
)

VALUES

('Tech Brasil Distribuidora','11222333000101','Ativo'),
('Global Components','22333444000102','Ativo'),
('Smart Devices Importadora','33444555000103','Ativo'),
('Digital Supply','44555666000104','Ativo'),
('Mega Hardware','55666777000105','Ativo'),
('InfoTech Solutions','66777888000106','Ativo'),
('Mobile Parts Brasil','77888999000107','Ativo'),
('Next Generation Tech','88999000000108','Ativo'),
('Connect Eletronicos','99000111000109','Ativo'),
('Prime Tecnologia','10111222000110','Ativo'),
('World Electronics','12131415000111','Ativo'),
('Alpha Distribuição','13141516000112','Ativo'),
('Beta Informática','14151617000113','Ativo'),
('Gamma Tech','15161718000114','Ativo'),
('Delta Eletronicos','16171819000115','Ativo'),
('Omega Importação','17181920000116','Ativo'),
('Nova Era Tecnologia','18192021000117','Ativo'),
('Future Devices','19202122000118','Ativo'),
('Vision Tech','20212223000119','Ativo'),
('Max Digital','21222324000120','Ativo');

GO


/*===========================================================
 INSERT: Loja
===========================================================*/


USE RetailAnalytics;
GO


INSERT INTO Loja
(
nome_loja,
tipo_loja,
cidade,
estado
)

VALUES

('SmartRetail São Paulo','Física','São Paulo','SP'),
('SmartRetail Rio','Física','Rio de Janeiro','RJ'),
('SmartRetail Belo Horizonte','Física','Belo Horizonte','MG'),
('SmartRetail Curitiba','Física','Curitiba','PR'),
('SmartRetail Recife','Física','Recife','PE'),
('SmartRetail Brasília','Física','Brasília','DF'),
('SmartRetail Online','E-commerce','São Paulo','SP'),
('SmartRetail Campinas','Física','Campinas','SP');

GO



/*===========================================================
 INSERT: Transportadora
===========================================================*/

USE RetailAnalytics;
GO


INSERT INTO Transportadora
(
nome,
prazo_medio_entrega
)

VALUES

('FastLog Transportes',2),
('Brasil Express',3),
('Mega Transportadora',5),
('Entrega Nacional',4),
('Smart Delivery',2);

GO



/*===========================================================
 INSERT: Funcionário
===========================================================*/

USE RetailAnalytics;
GO


INSERT INTO Funcionario
(
    id_loja,
    nome,
    cargo,
    salario,
    status
)

VALUES

(1,'Ana Paula Martins','Gerente de Loja',6500,'Ativo'),
(1,'Bruno Henrique Souza','Vendedor',2800,'Ativo'),
(1,'Carla Mendes Oliveira','Vendedor',2900,'Ativo'),
(1,'Diego Rodrigues Lima','Caixa',2400,'Ativo'),
(1,'Eduardo Santos Costa','Estoquista',2600,'Ativo'),

(2,'Fernanda Alves Ribeiro','Gerente de Loja',6800,'Ativo'),
(2,'Gabriel Oliveira Souza','Vendedor',3000,'Ativo'),
(2,'Helena Martins Silva','Vendedor',2850,'Ativo'),
(2,'Igor Pereira Costa','Caixa',2300,'Ativo'),
(2,'Juliana Carvalho Lima','Estoquista',2500,'Ativo'),

(3,'Lucas Ferreira Santos','Gerente de Loja',6700,'Ativo'),
(3,'Mariana Ribeiro Alves','Vendedor',2900,'Ativo'),
(3,'Nathan Gomes Oliveira','Vendedor',3000,'Ativo'),
(3,'Olívia Martins Costa','Caixa',2400,'Ativo'),
(3,'Pedro Henrique Silva','Estoquista',2550,'Ativo'),

(4,'Rafael Souza Lima','Gerente de Loja',6600,'Ativo'),
(4,'Sofia Almeida Costa','Vendedor',2800,'Ativo'),
(4,'Thiago Rodrigues Santos','Vendedor',3100,'Ativo'),
(4,'Vitória Fernandes Lima','Caixa',2350,'Ativo'),
(4,'William Carvalho Souza','Estoquista',2500,'Ativo'),

(5,'Amanda Oliveira Costa','Gerente de Loja',6400,'Ativo'),
(5,'Caio Martins Silva','Vendedor',2900,'Ativo'),
(5,'Daniel Alves Pereira','Vendedor',3000,'Ativo'),
(5,'Elisa Rodrigues Souza','Caixa',2300,'Ativo'),
(5,'Felipe Gomes Lima','Estoquista',2600,'Ativo'),

(6,'Gustavo Santos Oliveira','Gerente de Loja',6700,'Ativo'),
(6,'Hugo Carvalho Mendes','Vendedor',2850,'Ativo'),
(6,'Isabela Ribeiro Costa','Vendedor',2950,'Ativo'),
(6,'João Victor Alves','Caixa',2400,'Ativo'),
(6,'Karen Martins Silva','Estoquista',2550,'Ativo'),

(7,'Leonardo Souza Pereira','Gerente de Loja',6500,'Ativo'),
(7,'Marina Costa Oliveira','Vendedor',3000,'Ativo'),
(7,'Nicolas Fernandes Lima','Vendedor',2900,'Ativo'),
(7,'Paula Ribeiro Santos','Caixa',2350,'Ativo'),
(7,'Ricardo Almeida Costa','Estoquista',2500,'Ativo'),

(8,'Samuel Rodrigues Silva','Gerente E-commerce',7000,'Ativo'),
(8,'Tatiane Oliveira Lima','Analista de Vendas',3500,'Ativo'),
(8,'Victor Hugo Martins','Analista de Atendimento',3200,'Ativo'),
(8,'Yasmin Ferreira Costa','Assistente Comercial',2700,'Ativo'),
(8,'Zeca Pereira Alves','Supervisor Online',4500,'Ativo');

GO


/*===========================================================
 INSERT: Produto
===========================================================*/

USE RetailAnalytics;
GO


DECLARE @contador INT = 1;

DECLARE @categoria INT;
DECLARE @fornecedor INT;
DECLARE @preco DECIMAL(10,2);
DECLARE @custo DECIMAL(10,2);


WHILE @contador <= 300

BEGIN


    SET @categoria =
        ABS(CHECKSUM(NEWID())) % 15 + 1;


    SET @fornecedor =
        ABS(CHECKSUM(NEWID())) % 20 + 1;


    SET @custo =
        CAST(
            (RAND(CHECKSUM(NEWID())) * 3000) + 50
            AS DECIMAL(10,2)
        );


    SET @preco =
        CAST(
            @custo * 
            (1.15 + RAND(CHECKSUM(NEWID())) * 0.80)
            AS DECIMAL(10,2)
        );


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

        @categoria,

        @fornecedor,


        CASE @categoria

            WHEN 1 THEN CONCAT('Smartphone Modelo ',@contador)

            WHEN 2 THEN CONCAT('Notebook Performance ',@contador)

            WHEN 3 THEN CONCAT('Tablet Pro ',@contador)

            WHEN 4 THEN CONCAT('Monitor Ultra ',@contador)

            WHEN 5 THEN CONCAT('Smart TV ',@contador)

            WHEN 6 THEN CONCAT('Console Gamer ',@contador)

            WHEN 7 THEN CONCAT('Periférico Gamer ',@contador)

            WHEN 8 THEN CONCAT('Impressora Laser ',@contador)

            WHEN 9 THEN CONCAT('SSD Armazenamento ',@contador)

            WHEN 10 THEN CONCAT('Roteador WiFi ',@contador)

            WHEN 11 THEN CONCAT('Dispositivo Smart Home ',@contador)

            WHEN 12 THEN CONCAT('Equipamento Áudio ',@contador)

            WHEN 13 THEN CONCAT('Câmera Digital ',@contador)

            WHEN 14 THEN CONCAT('Wearable Inteligente ',@contador)

            WHEN 15 THEN CONCAT('Acessório Tecnologia ',@contador)

        END,


        CONCAT(
            'Produto tecnológico SmartRetail número ',
            @contador
        ),


        @preco,


        @custo,


        CASE
            WHEN @contador % 10 = 0 
            THEN 'Inativo'
            ELSE 'Ativo'
        END

    );


    SET @contador = @contador + 1;


END;


GO


/*===========================================================
 INSERT: Endereço
===========================================================*/


USE RetailAnalytics;
GO


DECLARE @contador INT = 1;


WHILE @contador <= 100

BEGIN


    INSERT INTO Endereco
    (
        id_cliente,
        logradouro,
        numero,
        cidade,
        cep
    )

    VALUES
    (

        @contador,


        CASE 
            WHEN @contador % 10 = 0 THEN 'Avenida Paulista'
            WHEN @contador % 9 = 0 THEN 'Rua das Flores'
            WHEN @contador % 8 = 0 THEN 'Rua Tecnologia'
            WHEN @contador % 7 = 0 THEN 'Avenida Brasil'
            WHEN @contador % 6 = 0 THEN 'Rua dos Eletrônicos'
            WHEN @contador % 5 = 0 THEN 'Rua das Palmeiras'
            WHEN @contador % 4 = 0 THEN 'Avenida Central'
            WHEN @contador % 3 = 0 THEN 'Rua São Paulo'
            WHEN @contador % 2 = 0 THEN 'Rua das Acácias'
            ELSE 'Rua do Comércio'
        END,


        CAST(
            ABS(CHECKSUM(NEWID())) % 9999 + 1
            AS VARCHAR(10)
        ),


        CASE 
            WHEN @contador % 5 = 0 THEN 'São Paulo'
            WHEN @contador % 4 = 0 THEN 'Rio de Janeiro'
            WHEN @contador % 3 = 0 THEN 'Belo Horizonte'
            WHEN @contador % 2 = 0 THEN 'Curitiba'
            ELSE 'Campinas'
        END,


        RIGHT(
            CONCAT(
                '00000000',
                ABS(CHECKSUM(NEWID()))
            ),
            8
        )

    );


    SET @contador = @contador + 1;


END;


GO


/*===========================================================
 INSERT: Estoque
===========================================================*/


USE RetailAnalytics;
GO


DECLARE @contador INT = 1;


WHILE @contador <= 500

BEGIN


    INSERT INTO Estoque
    (
        id_loja,
        id_produto,
        quantidade
    )

    VALUES
    (

        ABS(CHECKSUM(NEWID())) % 8 + 1,


        ABS(CHECKSUM(NEWID())) % 300 + 1,


        ABS(CHECKSUM(NEWID())) % 200

    );


    SET @contador = @contador + 1;


END;


GO


/*===========================================================
 INSERT: Pedidos
===========================================================*/

USE RetailAnalytics;
GO


DECLARE @contador INT = 1;


WHILE @contador <= 5000

BEGIN


    INSERT INTO Pedido
    (
        id_cliente,
        id_funcionario,
        id_loja,
        id_transportadora,
        data_pedido,
        status,
        valor_total
    )

    VALUES
    (

        -- Cliente
        ABS(CHECKSUM(NEWID())) % 100 + 1,


        -- Funcionário
        ABS(CHECKSUM(NEWID())) % 40 + 1,


        -- Loja
        ABS(CHECKSUM(NEWID())) % 8 + 1,


        -- Transportadora
        ABS(CHECKSUM(NEWID())) % 5 + 1,


        -- Datas entre 2022 e 2026
        DATEADD(
            DAY,
            -(ABS(CHECKSUM(NEWID())) % 1500),
            GETDATE()
        ),


        CASE
            WHEN @contador % 20 = 0 
                THEN 'Cancelado'

            WHEN @contador % 5 = 0
                THEN 'Enviado'

            WHEN @contador % 3 = 0
                THEN 'Pago'

            WHEN @contador % 2 = 0
                THEN 'Entregue'

            ELSE 'Pendente'

        END,


        CAST(
            (RAND(CHECKSUM(NEWID())) * 4500) + 100
            AS DECIMAL(10,2)
        )

    );


    SET @contador = @contador + 1;


END;


GO


/*===========================================================
 INSERT: Item_Pedidos
===========================================================*/

USE RetailAnalytics;
GO


DECLARE @contador INT = 1;

DECLARE @produto INT;

DECLARE @preco DECIMAL(10,2);


WHILE @contador <= 15000

BEGIN


    SET @produto =
        ABS(CHECKSUM(NEWID())) % 300 + 1;



    SELECT 
        @preco = preco_venda
    FROM Produto
    WHERE id_produto = @produto;



    INSERT INTO Item_Pedido
    (
        id_pedido,
        id_produto,
        quantidade,
        valor_unitario,
        desconto
    )

    VALUES
    (

        ABS(CHECKSUM(NEWID())) % 5000 + 1,


        @produto,


        ABS(CHECKSUM(NEWID())) % 5 + 1,


        @preco,


        CASE

            WHEN @contador % 10 = 0
            THEN CAST(
                    @preco * 0.10
                    AS DECIMAL(10,2)
                 )

            WHEN @contador % 7 = 0
            THEN CAST(
                    @preco * 0.05
                    AS DECIMAL(10,2)
                 )

            ELSE 0

        END

    );


    SET @contador = @contador + 1;


END;


GO


/*===========================================================
 INSERT: Pagamentos
===========================================================*/

USE RetailAnalytics;
GO


DECLARE @contador INT = 1;

DECLARE @valor DECIMAL(10,2);


WHILE @contador <= 5000

BEGIN


    SELECT 
        @valor = valor_total
    FROM Pedido
    WHERE id_pedido = @contador;



    INSERT INTO Pagamento
    (
        id_pedido,
        forma_pagamento,
        valor_pago,
        data_pagamento,
        parcelas
    )

    VALUES
    (

        @contador,


        CASE

            WHEN @contador % 5 = 0 
                THEN 'Cartão Crédito'

            WHEN @contador % 4 = 0
                THEN 'PIX'

            WHEN @contador % 3 = 0
                THEN 'Boleto'

            WHEN @contador % 2 = 0
                THEN 'Cartão Débito'

            ELSE 'Carteira Digital'

        END,


        @valor,


        DATEADD(
            DAY,
            ABS(CHECKSUM(NEWID())) % 5,
            (
                SELECT data_pedido
                FROM Pedido
                WHERE id_pedido = @contador
            )
        ),


        CASE

            WHEN @contador % 5 = 0
                THEN 12

            WHEN @contador % 4 = 0
                THEN 1

            WHEN @contador % 3 = 0
                THEN 6

            WHEN @contador % 2 = 0
                THEN 3

            ELSE 1

        END

    );


    SET @contador = @contador + 1;


END;


GO