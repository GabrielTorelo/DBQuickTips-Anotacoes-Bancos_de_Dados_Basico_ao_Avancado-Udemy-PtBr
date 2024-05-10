/* CRIA UM NOVO BANCO DE DADOS (pratica_4) */
CREATE DATABASE pratica_4;

/* USA O BANCO DE DADOS CRIADO */
USE pratica_4;

/* CRIA A TABELA 'tipo' */
CREATE TABLE tipo(
	idTipo INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (idTipo)
);

/* CRIA A TABELA 'produto' */
CREATE TABLE produto(
	idProduto INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
    updatedAt VARCHAR(10) NULL,
	idTipo INT NOT NULL,
	PRIMARY KEY (idProduto),
	FOREIGN KEY (idTipo) REFERENCES tipo(idTipo)
);

/* INSERI DADOS NA TABELA 'tipo' */
INSERT INTO tipo (nome)
	VALUES ('Informática');
INSERT INTO tipo (nome)
	VALUES ('Escritório');
INSERT INTO tipo (nome)
	VALUES ('Móveis');

/* INSERI DADOS NA TABELA 'produto' */
INSERT INTO produto (nome, preco, idTipo)
	VALUES ('Teclado Logitech', 67.30, 1);
INSERT INTO produto (nome, preco, idTipo)
	VALUES ('Impressora Multifuncional', 469.25, 2);
INSERT INTO produto (nome, preco, idTipo)
	VALUES ('Caneta Invictus Iron', 129.25, 2);
    
/* CONSULTA OS DADOS INSERIDOS */
SELECT * FROM tipo;
SELECT * FROM produto;

/* FILTRA PRODUTOS COM 'idTipo' IGUAL A 2 */
SELECT * FROM produto WHERE idTipo = 2;

/* FILTRA PRODUTOS COM 'idTipo' IGUAL A 2 E 'preco' MAIOR QUE R$ 200,00 */
SELECT * FROM produto WHERE idTipo = 2 AND preco > 200;

/* CONSULTA 'idProduto', 'nome', 'preco' E 'tipo' DO PRODUTO */
SELECT prod.idProduto AS 'ID', prod.nome AS 'Nome', prod.preco AS 'Preço', t.nome AS 'Tipo do Produto' 
   FROM produto AS prod, tipo AS t
   WHERE prod.idTipo = t.idTipo;

/* CONSULTA 'nome' E 'tipo' DO PRODUTO */
SELECT prod.nome AS 'Nome', t.nome AS 'Tipo do Produto' 
	FROM produto AS prod INNER JOIN tipo AS t
	ON prod.idTipo = t.idTipo;

/* CONSULTA TODOS OS DADOS DAS TABELAS 'produto' E 'tipo' (caso não exista um número de registros equivalente o valor NULL é retornado) */
SELECT * FROM produto AS prod
	LEFT OUTER JOIN tipo AS t
	ON prod.idTipo = t.idTipo;

/* CONSULTA TODOS OS DADOS DAS TABELAS 'produto' E 'tipo' (caso não exista um número de registros equivalente o valor NULL é retornado) */
SELECT * FROM produto AS prod
	RIGHT OUTER JOIN tipo AS t
	ON prod.idTipo = t.idTipo;

/* CONSULTA CADA PRODUTO E ADICIONA TODOS OS TIPOS PARA TODOS OS PRODUTOS */
SELECT prod.idProduto AS 'ID', prod.nome AS 'Nome', prod.preco AS 'Preço', t.nome AS 'Tipo do Produto' 
	FROM produto AS prod
	CROSS JOIN tipo AS t;

/* CONSULTA NA TABELA DE PRODUTOS OS IDS DIFERENTES, PORÉM, COM O TIPO IGUAL A 2 */
SELECT prod1.nome AS "Produto 1", prod2.nome AS "Produto 2", prod1.nome
	FROM produto AS prod1
	INNER JOIN produto AS prod2
	ON prod1.idProduto <> prod2.idProduto
	AND prod1.idTipo = 2;

/* CONSULTA O PRODUTO COM MAIOR VALOR */
SELECT MAX(preco) FROM produto;

/* CONSULTA O PRODUTO COM MENOR VALOR */
SELECT MIN(preco) FROM produto;

/* CONSULTA A SOMA DE TODOS OS PRODUTOS */
SELECT SUM(preco) FROM produto;

/* CONSULTA O VALOR MÉDIO DOS PRODUTOS */
SELECT AVG(preco) FROM produto;

/* CALCULA A MÉDIA ARITMÉTICA DOS PRODUTOS E ARREDONDA O VALOR COM DUAS CASAS DECIMAIS */
SELECT ROUND(AVG(preco), 2) FROM produto;

/* CALCULA A QUANTIDADE DE PRODUTOS CADASTRADOS */
SELECT COUNT(preco) AS Quantidade FROM produto;

/* CONSULTA O VALOR MÉDIO DOS PRODUTOS EM CADA TIPO */
SELECT idTipo, AVG(preco) FROM produto GROUP BY idTipo;

/* CONSULTA O MAIOR PREÇO DE VENDA EM CADA TIPO DE PRODUTOS, SENDO O PREÇO MAIOR QUE R$ 100,00 */
SELECT idTipo, MAX(preco) FROM produto GROUP BY idTipo HAVING MAX(preco) > 100;

/* ORDENA OS PREÇOS DOS PRODUTOS DO MAIS BARATO PARA O MAIS CARO */
SELECT nome, preco FROM produto ORDER BY preco ASC;

/* ORDENA OS PREÇOS DOS PRODUTOS DO MAIS CARO PARA O MAIS BARATO */
SELECT nome, preco FROM produto ORDER BY preco DESC;

/* ATUALIZA O CAMPO 'updatedAt' DA TABELA 'PRODUTO' JÁ NO FORMATO BRASILEIRO (DD/MM/YYYY) */
UPDATE produto set updatedAt = DATE_FORMAT(CURDATE(), '%d/%m/%Y') WHERE idProduto = 1;

/* CONSULTA OS DADOS ALTERADOS */
SELECT * FROM produto;
