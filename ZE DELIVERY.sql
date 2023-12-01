	CREATE TABLE [VENDEDOR]
(
    [COD_VENDEDOR] INTEGER NOT NULL,
    [COD_USUARIO] INTEGER NOT NULL,
    [COD_LOJA] INTEGER NOT NULL,
    [NOME] NVARCHAR(160) NOT NULL,
    [CPF] NVARCHAR(160) NOT NULL,
    [TELEFONE] NVARCHAR(160) NOT NULL,
    [ENDERECO] NVARCHAR(160) NOT NULL,
    [ADMIN] BOOLEAN NOT NULL,
    CONSTRAINT [PK_VENDEDOR] PRIMARY KEY ([COD_VENDEDOR]),
    CONSTRAINT [FK_COD_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES LOJA([COD_LOJA]),
    CONSTRAINT [FK_COD_USUARIO] FOREIGN KEY ([COD_USUARIO]) REFERENCES USUARIO([COD_USUARIO])
);
CREATE UNIQUE INDEX [IPK_VENDEDOR] ON [VENDEDOR]([COD_VENDEDOR]);


CREATE TABLE [CLIENTE]
(
    [COD_CLIENTE] INTEGER NOT NULL,
    [COD_USUARIO] INTEGER NOT NULL,
    [NOME] NVARCHAR(160) NOT NULL,
    [TELEFONE] NVARCHAR(160) NOT NULL,
    [ENDERECO] NVARCHAR(160) NOT NULL,
    [CPF] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_CLIENTE] PRIMARY KEY ([COD_CLIENTE]),
    CONSTRAINT [FK_COD_USUARIO] FOREIGN KEY ([COD_USUARIO]) REFERENCES [USUARIO]([COD_USUARIO])
);

CREATE UNIQUE INDEX [IPK_CLIENTE] ON [CLIENTE]([COD_CLIENTE]);


CREATE TABLE [FORNECEDOR]
(
    [COD_FORNECEDOR] INTEGER  NOT NULL,
    [NOME] NVARCHAR(160)  NOT NULL,
    [EMAIL] NVARCHAR(160) NOT NULL,
    [CNPJ] NVARCHAR (160) NOT NULL,
    [TELEFONE] NVARCHAR(160)  NOT NULL,
    [ENDERECO] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_FORNECEDOR] PRIMARY KEY ([COD_FORNECEDOR])
    
);
CREATE UNIQUE INDEX [IPK_FORNECEDOR] ON [FORNECEDOR]([COD_FORNECEDOR]);

CREATE TABLE [USUARIO]
(
    [COD_USUARIO] INTEGER  NOT NULL,
    [LOGIN] NVARCHAR(160)  NOT NULL,
    [SENHA] NVARCHAR(160) NOT NULL,
    [EMAIL] NVARCHAR (160) NOT NULL,
    CONSTRAINT [PK_USUARIO] PRIMARY KEY ([COD_USUARIO])
);
CREATE UNIQUE INDEX [IPK_USUARIO] ON [USUARIO]([COD_USUARIO]);

CREATE TABLE [PRODUTO]
(
    [COD_PRODUTO] INTEGER NOT NULL,
    [FORNECEDOR] INTEGER NOT NULL,
    [NOME] NVARCHAR(160) NOT NULL,
    [VLR_PRODUTO] FLOAT(15,2) NOT NULL,
    CONSTRAINT [PK_PRODUTO] PRIMARY KEY ([COD_PRODUTO]),
    CONSTRAINT [FK_FORNECEDOR] FOREIGN KEY ([FORNECEDOR]) REFERENCES [FORNECEDOR]([COD_FORNECEDOR])
);

CREATE UNIQUE INDEX [IPK_PRODUTO] ON [PRODUTO]([COD_PRODUTO]);


CREATE TABLE [PEDIDO]
(
    [COD_PEDIDO] INTEGER  NOT NULL,
    [COD_CLIENTE] INTEGER NOT NULL,
    [COD_LOJA] INTEGER  NOT NULL,
    [COD_VENDEDOR] INTEGER NOT NULL,
    [STATUS] NVARCHAR (160)  NOT NULL,
    [TEMPO_ESPERA] TIME  NOT NULL,
    [VLR_PEDIDO] FLOAT (15,2)  NOT NULL,
    [DATA] TIME NOT NULL,
    CONSTRAINT [PK_COD_PEDIDO] PRIMARY KEY ([COD_PEDIDO]),
    CONSTRAINT [FK_COD_CLIENTE] FOREIGN KEY ([COD_CLIENTE]) REFERENCES COD_CLIENTE([COD_CLIENTE]),
    CONSTRAINT [FK_COD_VENDEDOR] FOREIGN KEY (COD_VENDEDOR) REFERENCES VENDEDOR(COD_VENDEDOR),
    CONSTRAINT [FK_COD_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES LOJA(COD_LOJA)
);
CREATE UNIQUE INDEX [IPK_PEDIDO] ON [PEDIDO]([COD_PEDIDO]);

CREATE TABLE [LOJA]
(
    [COD_LOJA] INTEGER  NOT NULL,
    [NOME] NVARCHAR(160)  NOT NULL,
    [ENDEREÇO] NVARCHAR(160) NOT NULL,
    [TELEFONE] NVARCHAR (160) NOT NULL,
    CONSTRAINT [PK_COD_LOJA] PRIMARY KEY ([COD_LOJA]);  
   
 CREATE UNIQUE INDEX [IPK_LOJA] ON [LOJA]([COD_LOJA]);

CREATE TABLE [ITEM_PEDIDO]
(
    [COD_ITEM_PEDIDO] INTEGER  NOT NULL,
    [COD_PRODUTO] INTEGER  NOT NULL,
    [COD_PEDIDO] INTEGER  NOT NULL,
    CONSTRAINT [PK_ITEM_PEDIDO] PRIMARY KEY ([COD_ITEM_PEDIDO]),
    CONSTRAINT [FK_COD_PEDIDO] FOREIGN KEY ([COD_PEDIDO]) REFERENCES PEDIDO([COD_PEDIDO]),
    CONSTRAINT [FK_PRODUTO] FOREIGN KEY ([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO])
  
);

CREATE UNIQUE INDEX [IPK_ITEM_PEDIDO] ON [ITEM_PEDIDO]([COD_ITEM_PEDIDO]);


CREATE TABLE [ESTOQUE]
(
    [COD_ESTOQUE] INTEGER  NOT NULL,
    [COD_PRODUTO] INTEGER  NOT NULL,
    [COD_LOJA] INTEGER  NOT NULL,
    [QTD_PRODUTO] INTEGER  NOT NULL,
    CONSTRAINT [PK_COD_ESTOQUE] PRIMARY KEY ([COD_ESTOQUE]),
    CONSTRAINT [FK_COD_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES PEDIDO([COD_LOJA]),
    CONSTRAINT [FK_PRODUTO] FOREIGN KEY ([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO])
  
);
CREATE UNIQUE INDEX [IPK_ESTOQUE] ON [ESTOQUE]([COD_ESTOQUE]);

CREATE TABLE [RELATORIO]
(
    [COD_RELATORIO] INTEGER  NOT NULL,
    [COD_LOJA] NVARCHAR(160)  NOT NULL,
    [VLR_TOTAL] DOUBLE  NOT NULL,
    [DATA_INICIO] DATETIME  NOT NULL,
    [DATA_FIM] DATETIME  NOT NULL,
    CONSTRAINT [PK_COD_RELATORIO] PRIMARY KEY ([COD_RELATORIO]),
    CONSTRAINT [FK_COD_LOJA_RELATORIO] FOREIGN KEY ([COD_LOJA]) REFERENCES LOJA([COD_LOJA])

);
CREATE UNIQUE INDEX [IPK_RELATORIO] ON [RELATORIO]([COD_RELATORIO]);

-- INSERIDO UM REGISTRO NA TABELA VENDEDOR
INSERT INTO VENDEDOR (COD_VENDEDOR, COD_USUARIO, COD_LOJA, NOME, CPF, TELEFONE, ENDERECO, ADMIN)
VALUES (3,2,1, 'JENNIFER', '156.346.654-60', '31994533390', 'R. LK 161',1);
SELECT * FROM VENDEDOR;

--INSERIDO UM REGISTRO NA TABELA CLIENTE
INSERT INTO CLIENTE (COD_CLIENTE,COD_USUARIO, NOME, TELEFONE, ENDERECO,CPF)
VALUES (4,3,'ANDRE', '31998755541', 'R.LK 123''854.458.754-85',1);


-- INSERIDO UM REGISTRO NA TABELA FORNECEDOR
INSERT INTO FORNECEDOR (COD_FORNECEDOR,NOME,CNPJ,EMAIL,ENDERECO,TELEFONE)
VALUES (1,'RUAN','19.447.297/0001-66','ruan2323jh@gmail.com','R. INDUSTRIAL 23','(21)99876-7647');

--INSERIDO UM REGISTRO NA TABELA USUARIO
INSERT INTO USUARIO (COD_USUARIO,LOGIN,SENHA,EMAIL)
VALUES (2, 'LEKINHO','Gabiru123','lekinhovidaloka@hotmail.com');

-- INSERINDO UM REGISTRO NA TABELA PRODUTO 
INSERT INTO PRODUTO (COD_PRODUTO,FORNECEDOR,NOME,VLR_PRODUTO)
VALUES (2,'STELLA','STELLA','8,00');

--INSERIDO UM  REGISTRO NA TABELA PEDIDO
INSERT INTO PEDIDO (COD_PEDIDO, COD_CLIENTE,COD_LOJA,COD_VENDEDOR,STATUS,TEMPO_ESPERA,VLR_PEDIDO,DATA)
VALUES (1,2,1,3,'SAINDO','30','59.00', '2023-12-10');


--INSERIDO UM REGISTRO NA TABELA LOJA
INSERT INTO LOJA (COD_LOJA,NOME,ENDEREÇO,TELEFONE)
VALUES (5,'BAR DO ZE','R. CRISTIANO 121','(21)9 9957-2121');


--INSERIDO UM REGISTRO NA TABELA ITEM_PEDIDO
INSERT INTO ITEM_PEDIDO (COD_ITEM_PEDIDO,COD_PRODUTO,COD_PEDIDO)
VALUES (3,1,1);


--INSERIDO UM REGISTRO NA TABELA ESTOQUE
INSERT INTO ESTOQUE (COD_ESTOQUE,COD_PRODUTO,COD_LOJA,QTD_PRODUTO)
VALUES (33,1,5,1000);


--INSERIDO UM REGISTRO NA TABELA RELATORIO
INSERT INTO RELATORIO (COD_RELATORIO,COD_LOJA,VLR_TOTAL,DATA_INICIO,DATA_FIM)
VALUES (19,5,100.00,'2023-05-12 08:00','2023-06-15 15:00')


-- SELECT DE UMA INFORMAÇÃO DE CADA TABELA ----- UPDATE DE UMA INFORMAÇÃO DE CADA TABELA --------  DELETE DE UMA INFORMAÇÃO DE CADA TABELA--------

SELECT * FROM VENDEDOR WHERE COD_VENDEDOR LIKE '%3';
UPDATE VENDEDOR SET NOME = 'FLAVIA' WHERE COD_VENDEDOR  = 3;
DELETE FROM VENDEDOR WHERE COD_VENDEDOR = 2;

SELECT * FROM CLIENTE WHERE COD_CLIENTE LIKE '%4';
UPDATE CLIENTE SET NOME = 'LUCIO' WHERE COD_CLIENTE  = 4;
DELETE FROM CLIENTE WHERE COD_CLIENTE  = 3;

SELECT * FROM FORNECEDOR WHERE COD_FORNECEDOR LIKE '%1';
UPDATE FORNECEDOR SET EMAIL = 'Ruanfornecedor@gmail.com' where COD_FORNECEDOR = 1;
DELETE FROM FORNECEDOR WHERE COD_FORNECEDOR = 1;

SELECT * FROM USUARIO WHERE COD_USUARIO LIKE '%2';
UPDATE USUARIO SET SENHA = 'VIDALOKA22' WHERE COD_USUARIO  = 2;
DELETE FROM USUARIO  WHERE COD_USUARIO = 2;

SELECT * FROM PRODUTO WHERE COD_PRODUTO LIKE '%2';
UPDATE PRODUTO SET FORNECEDOR = 'AMBEV' WHERE COD_PRODUTO  = 2;
DELETE FROM PRODUTO WHERE COD_PRODUTO = 2;

SELECT * FROM PEDIDO WHERE COD_PEDIDO LIKE '%1';
UPDATE PEDIDO SET STATUS  = 'ENTREGUE' WHERE COD_PEDIDO  = 1;
DELETE FROM PEDIDO  WHERE COD_PEDIDO = 1;

SELECT * FROM LOJA WHERE COD_LOJA LIKE '%5';		
UPDATE LOJA SET NOME  = 'BAR DO GU' WHERE COD_LOJA  = 5; 
DELETE FROM LOJA  WHERE COD_LOJA = 5;


SELECT * FROM ITEM_PEDIDO WHERE COD_ITEM_PEDIDO LIKE '%3';
UPDATE ITEM_PEDIDO SET COD_PRODUTO  = '2' WHERE COD_ITEM_PEDIDO  = 3;
DELETE FROM ITEM_PEDIDO  WHERE COD_ITEM PEDIDO = 3;

SELECT * FROM ESTOQUE WHERE COD_ESTOQUE LIKE '%33';
UPDATE ESTOQUE SET QTD_PRODUTO  = '5,000' WHERE COD_ESTOQUE  = 33;
DELETE FROM ESTOQUE WHERE COD_ESTOQUE = 33;

SELECT * FROM RELATORIO WHERE COD_RELATORIO LIKE '%19';
UPDATE RELATORIO SET VLR_TOTAL = '200,000,00' WHERE COD_RELATORIO  = 19;
DELETE FROM RELATORIO  WHERE COD_RELATORIO = 19;

-- SELECT COM JOIN 
-- Selecionando informações de um pedido com detalhes do cliente, vendedor e produto:

SELECT 
    PEDIDO.COD_PEDIDO,
    PEDIDO.STATUS,
    CLIENTE.NOME AS NOME_CLIENTE,
    VENDEDOR.NOME AS NOME_VENDEDOR,
    PRODUTO.NOME AS NOME_PRODUTO
FROM PEDIDO
INNER JOIN CLIENTE ON PEDIDO.COD_CLIENTE = CLIENTE.COD_CLIENTE
INNER JOIN VENDEDOR ON PEDIDO.COD_VENDEDOR = VENDEDOR.COD_VENDEDOR
INNER JOIN ITEM_PEDIDO ON PEDIDO.COD_PEDIDO = ITEM_PEDIDO.COD_PEDIDO
INNER JOIN PRODUTO ON ITEM_PEDIDO.COD_PRODUTO = PRODUTO.COD_PRODUTO;

-- Selecionando informações de estoque com detalhes do produto e da loja:

SELECT 
    ESTOQUE.COD_ESTOQUE,
    PRODUTO.NOME AS NOME_PRODUTO,
    LOJA.NOME AS NOME_LOJA,
    ESTOQUE.QTD_PRODUTO
FROM ESTOQUE
INNER JOIN PRODUTO ON ESTOQUE.COD_PRODUTO = PRODUTO.COD_PRODUTO
INNER JOIN LOJA ON ESTOQUE.COD_LOJA = LOJA.COD_LOJA;

-- Selecionando informações de relatórios com detalhes da loja:

SELECT 
    RELATORIO.COD_RELATORIO,
    LOJA.NOME AS NOME_LOJA,
    RELATORIO.VLR_TOTAL,
    RELATORIO.DATA_INICIO,
    RELATORIO.DATA_FIM
FROM RELATORIO
INNER JOIN LOJA ON RELATORIO.COD_LOJA = LOJA.COD_LOJA;

-- Selecionando informações de itens de pedido com detalhes do pedido, produto e cliente:
SELECT
    ITEM_PEDIDO.COD_ITEM_PEDIDO,
    PEDIDO.COD_PEDIDO,
    PEDIDO.STATUS,
    CLIENTE.NOME AS NOME_CLIENTE,
    PRODUTO.NOME AS NOME_PRODUTO,
    ITEM_PEDIDO.COD_PRODUTO
FROM ITEM_PEDIDO
INNER JOIN PEDIDO ON ITEM_PEDIDO.COD_PEDIDO = PEDIDO.COD_PEDIDO
INNER JOIN CLIENTE ON PEDIDO.COD_CLIENTE = CLIENTE.COD_CLIENTE
INNER JOIN PRODUTO ON ITEM_PEDIDO.COD_PRODUTO = PRODUTO.COD_PRODUTO;









