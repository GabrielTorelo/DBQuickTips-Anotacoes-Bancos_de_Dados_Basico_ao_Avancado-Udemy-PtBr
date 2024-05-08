CREATE DATABASE teste;

USE teste;

CREATE TABLE profissao(
  idProfissao INT NOT NULL AUTO_INCREMENT,
  cargo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE cliente(
  idCliente INT NOT NULL AUTO_INCREMENT,
  idProfissao INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  data_nasc DATE NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  PRIMARY KEY (idCliente),
  FOREIGN KEY (idProfissao) REFERENCES profissao(idProfissao)
);

CREATE TABLE consumidor(
  idConsumidor INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  cep VARCHAR(20) NOT NULL,
  pais VARCHAR(50) NOT NULL
);

CREATE TABLE categoria(
	idCategoria INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tipo(
	idTipo INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (idTipo)
);

CREATE TABLE fabricante(
	idFabricante INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (idFabricante)
);

CREATE TABLE produto(
	idProduto INT NOT NULL AUTO_INCREMENT,
  idFabricante INT NOT NULL,
  idTipo INT NOT NULL,
	idCategoria int NOT NULL,
	descricao VARCHAR(60) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
	PRIMARY KEY (idProduto),
	FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)
  FOREIGN KEY (idFabricante) REFERENCES fabricante(idFabricante),
	FOREIGN KEY (idTipo) REFERENCES tipo(idTipo)
);

INSERT INTO profissao (cargo) VALUES ('Programador');
INSERT INTO profissao (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissao (cargo) VALUES ('Suporte');
INSERT INTO profissao (cargo) VALUES ('Gerente');

INSERT INTO cliente (nome, data_nasc, telefone, idProfissao) VALUES ('Jose da Silva', '2000-03-24', '+5514912345678', 1);
INSERT INTO cliente (nome, data_nasc, telefone, idProfissao) VALUES ('Marcos da Silva', '2002-05-30', '+5514987654321', 2);
INSERT INTO cliente (nome, data_nasc, telefone, idProfissao) VALUES ('João da Silva', '2001-03-27', '+5514912348765', 3);
INSERT INTO cliente (nome, data_nasc, telefone, idProfissao) VALUES ('Carlos da Silva', '2003-05-12', '+5514911112222', 4);

INSERT INTO consumidor (nome, telefone, endereco, cidade, cep, pais) VALUES ('Jose Carlos', '+5514912245678', 'Rua das Ruas', 'Cidadão', '85222-000', 'Brasil');
INSERT INTO consumidor (nome, telefone, endereco, cidade, cep, pais) VALUES ('Marcos Vinicius', '+5514915245678', 'Rua de Novo', 'Cityzinha', '78632-000', 'Brasil');
INSERT INTO consumidor (nome, telefone, endereco, cidade, cep, pais) VALUES ('Pedro Luiz', '+5514919645678', 'Av. das Avenidas', 'Cityzona', '97611-123', 'Brasil');

INSERT INTO categoria (nome) VALUES ('Material Escolar');
INSERT INTO categoria (nome) VALUES ('Acessório Informática');

INSERT INTO tipo (nome) VALUES ('Escolar');
INSERT INTO tipo (nome) VALUES ('Informática');

INSERT INTO fabricante (nome) VALUES ('Sony');
INSERT INTO fabricante (nome) VALUES ('Bic');
INSERT INTO fabricante (nome) VALUES ('Tilibra');

INSERT INTO produto (descricao, preco, idCategoria, idTipo, idFabricante) VALUES ('Caderno', '5.45', 1, 1, 3);
INSERT INTO produto (descricao, preco, idCategoria, idTipo, idFabricante) VALUES ('Caneta', '1.20', 1, 1, 2);
INSERT INTO produto (descricao, preco, idCategoria, idTipo, idFabricante) VALUES ('Pendrive 32GB', '120.54', 2, 1, 1);
INSERT INTO produto (descricao, preco, idCategoria, idTipo, idFabricante) VALUES ('Mouse', '17.00', 2, 1, 1);
