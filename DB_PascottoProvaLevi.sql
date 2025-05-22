CREATE DATABASE Pascotto;

USE Pascotto;

CREATE TABLE Produtos(

idProduto INT AUTO_INCREMENT PRIMARY KEY,
nomeProduto VARCHAR(255) NOT NULL,
preco DOUBLE NOT NULL,
qtndEstoque INT NOT NULL,
idFornecedor INT

);

CREATE TABLE Fornecedores(

idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
nomeFornecedor VARCHAR(255) NOT NULL,
CNPJ VARCHAR(255) NOT NULL,
telefone VARCHAR(255) NOT NULL,
CPF VARCHAR(255) NOT NULL

);

CREATE TABLE Colaborador(

idColaborador INT AUTO_INCREMENT PRIMARY KEY,
nomeColaborador VARCHAR(255) NOT NULL,
cargo VARCHAR(255) NOT NULL,
salario DOUBLE NOT NULL

);

CREATE TABLE Pedidos(

idPedido INT AUTO_INCREMENT PRIMARY KEY,
dataPedido DATE NOT NULL,
qtnd INT NOT NULL,
idColaborador INT,
idPruduto INT

);

ALTER TABLE Produtos ADD CONSTRAINT fk_fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor);
ALTER TABLE Pedidos ADD CONSTRAINT fk_colaborador FOREIGN KEY (idColaborador) REFERENCES Colaborador(idColaborador);
ALTER TABLE Pedidos ADD CONSTRAINT fk_produto FOREIGN KEY (idPruduto) REFERENCES Produtos(idProduto);

ALTER TABLE Fornecedores ADD Email VARCHAR(255) UNIQUE NOT NULL;


CREATE TABLE Categorias(

idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nomeCategoria VARCHAR(255) NOT NULL

);

ALTER TABLE Produtos ADD idCategoria INT;
ALTER TABLE Produtos ADD CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria);

INSERT INTO Produtos (nomeProduto, preco, qtndEstoque) VALUES ('Gin', '10', '10');
INSERT INTO Produtos (nomeProduto, preco, qtndEstoque) VALUES ('Escova', '7', '10');

INSERT INTO Fornecedores (nomeFornecedor, CNPJ, telefone, CPF, Email) VALUES ('Claudio', '1234567891011', '551192134-4135', '555.444.333-22', 'claudiogin@gmail.com');
INSERT INTO Fornecedores (nomeFornecedor, CNPJ, telefone, CPF, Email) VALUES ('Javerso', '1110987654321', '551196721-6521', '666.777.888-99', 'javersoescova@gmail.com');

INSERT INTO Colaborador (nomeColaborador, cargo, salario) VALUES ('Levi', 'Estoquista', '1799.00');
INSERT INTO Colaborador (nomeColaborador, cargo, salario) VALUES ('Julia', 'Gerente', '1990.00');

INSERT INTO Pedidos (dataPedido, qtnd) VALUES ('2004-05-09', '1');
INSERT INTO Pedidos (dataPedido, qtnd) VALUES ('2006-07-21', '5');

ALTER TABLE Colaborador MODIFY salario DECIMAL NOT NULL;
ALTER TABLE Fornecedores DROP COLUMN CPF;

SELECT 

Produtos.nomeProduto, Fornecedores.nomeFornecedor

FROM

Produtos

INNER JOIN

Fornecedores

ON

Produtos.idProduto = Fornecedores.idFornecedor
