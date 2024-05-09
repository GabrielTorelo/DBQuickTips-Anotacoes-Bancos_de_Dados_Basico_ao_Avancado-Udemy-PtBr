/* SELECIONA O BANCO DE DADOS 'pratica_1' */
USE pratica_1;

/* REALIZA CONSULTAS DE TODOS OS DADOS (NENHUM) DAS TABELAS
   'paciente',
   'produto',
   'professor',
   'tipo_professor' e
   'turma'
*/
SELECT * FROM paciente;
SELECT * FROM tipo_produto;
SELECT * FROM produto;
SELECT * FROM professor;
SELECT * FROM turma;

/* INSERE DADOS NA TABELA 'paciente' */
INSERT INTO paciente (nome, endereco, bairro, cidade, estado, cep, data_nasc)
	VALUES ('Jose Carlos', 'Av. de Teste', 'Centro', 'São Paulo', 'SP', '12345-000', '2000-03-24');

/* INSERE DADOS NA TABELA 'tipo_produto' */
INSERT INTO tipo_produto (descricao)
	VALUES ('Notebook');

/* INSERE DADOS NA TABELA 'produto' */
INSERT INTO produto (nome, preco, idTipo_produto)
	VALUES ('Dell i7 - 8th Gen', 3994.00, 1);

/* INSERE DADOS NA TABELA 'professor' */
INSERT INTO professor (nome, telefone)
	VALUES ('Carlos Eduardo', '+5543977449955');

/* INSERE DADOS NA TABELA 'turma' */
INSERT INTO turma (capacidade, idProfessor)
	VALUES (50, 1);

/* REALIZA AS CONSULTAS NOVAMENTE */
SELECT * FROM paciente;
SELECT * FROM tipo_produto;
SELECT * FROM produto;
SELECT * FROM professor;
SELECT * FROM turma;
