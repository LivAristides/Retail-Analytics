/*===========================================================
 Projeto : Retail Analytics
 Autor   : Lívia
 Script  : 01_create_database.sql
 Objetivo: Criação do banco de dados
===========================================================*/

-- Caso o banco já exista, remove-o
IF EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'RetailAnalytics'
)
BEGIN
    ALTER DATABASE RetailAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RetailAnalytics;
END
GO

-- Criação do banco
CREATE DATABASE RetailAnalytics;
GO

-- Seleciona o banco criado
USE RetailAnalytics;
GO

PRINT 'Banco RetailAnalytics criado com sucesso!';