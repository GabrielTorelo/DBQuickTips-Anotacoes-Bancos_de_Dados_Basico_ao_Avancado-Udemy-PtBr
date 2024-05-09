/* CRIA UM NOVO BANCO DE DADOS (pratica_3) */
CREATE DATABASE pratica_3;

/* USA O BANCO DE DADOS CRIADO */
USE pratica_3;

/* CRIA A TABELA 'categoria' */
CREATE TABLE categoria(
	idCategoria INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	qualidade INT NOT NULL,
	PRIMARY KEY (idCategoria)
);

/* CRIA A TABELA 'tipo' */
CREATE TABLE tipo(
	idTipo INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (idTipo)
);

/* CRIA A TABELA 'fabricante' */
CREATE TABLE fabricante(
	idFabricante INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	cnpj VARCHAR(18) NOT NULL,
	PRIMARY KEY (idFabricante)
);

/* CRIA A TABELA 'produto' */
CREATE TABLE produto(
	idProduto INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
  idFabricante INT NOT NULL,
	idTipo INT NOT NULL,
	idCategoria int NOT NULL,
	PRIMARY KEY (idProduto),
	FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria),
	FOREIGN KEY (idFabricante) REFERENCES fabricante(idFabricante),
	FOREIGN KEY (idTipo) REFERENCES tipo(idTipo)
);

/* INSERI DADOS NA TABELA 'categoria' */
INSERT INTO categoria (nome, qualidade)
	VALUES ('PC', 8);

/* INSERI DADOS NA TABELA 'tipo' */
INSERT INTO tipo (nome)
	VALUES ('Informática');

/* INSERI DADOS NA TABELA 'fabricante' */
INSERT INTO fabricante (nome, cnpj)
	VALUES ('Multilaser', '59.717.553/0001-02');

/* INSERI DADOS NA TABELA 'produto' */
INSERT INTO produto (nome, preco, idCategoria, idTipo, idFabricante)
	VALUES ('Pendrive 64GB', 68.54, 1, 1, 1);
INSERT INTO produto (nome, preco, idCategoria, idTipo, idFabricante)
	VALUES ('Mouse', 29.50, 1, 1, 1);
    
/* CONSULTA OS DADOS INSERIDOS */
SELECT * FROM categoria;
SELECT * FROM tipo;
SELECT * FROM fabricante;
SELECT * FROM produto;

/* CONSULTA 'idProduto', 'nome', 'preco' E 'tipo' DO PRODUTO */
SELECT prod.idProduto AS idProduto, prod.nome AS nome, prod.preco AS preco, t.nome AS tipo 
   FROM produto AS prod, tipo AS t
   WHERE prod.idTipo = t.idTipo;
   
/* ATUALIZA 'nome' E 'preco' DO PRODUTO */
UPDATE produto set nome = 'Pendrive 128GB', preco = 108.54 WHERE idProduto = 1;

/* VERIFICA OS DADOS ATUALIZADOS */
SELECT * FROM produto;

/* REMOVE 'produto' COM 'idProduto' IGUAL A 2 */
DELETE FROM produto WHERE idProduto = 2;

/* VERIFICA OS DADOS ATUALIZADOS */
SELECT * FROM produto;

/* ADICIONA UM NOVO CAMPO NA TABELA 'produto' */
ALTER TABLE produto ADD data_venc DATE;

/* ATUALIZA 'data_venc' DO PRODUTO */
UPDATE produto set data_venc = '2024-06-01' WHERE idProduto = 1;

/* VERIFICA OS DADOS ATUALIZADOS */
SELECT * FROM produto;

/* CRIA TRANSAÇÃO PARA INSERIR 2 DADOS NA TABELA 'tipo' */
START TRANSACTION;
   INSERT INTO tipo (nome)
	   VALUES ('Acessorio');
   INSERT INTO tipo (nome)
	   VALUES ('Equipamento');
COMMIT;

/* VERIFICA OS DADOS ATUALIZADOS */
SELECT * FROM tipo;
