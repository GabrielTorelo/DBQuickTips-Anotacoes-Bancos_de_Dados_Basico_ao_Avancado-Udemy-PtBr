/* USA O BANCO DE DADOS CRIADO */
USE farmacia;

/* INSERI DADOS NA TABELA 'tipo_produto' */
INSERT INTO tipo_produto (nome)
	VALUES ('Remédio');
INSERT INTO tipo_produto (nome)
	VALUES ('Diverso');

/* INSERI DADOS NA TABELA 'fabricante' */
INSERT INTO fabricante (nome)
	VALUES ('Roche');
INSERT INTO fabricante (nome)
	VALUES ('Palmolive');

/* INSERI DADOS NA TABELA 'cliente' */
INSERT INTO cliente (nome, cpf, endereco, localidade, cep, telefone)
	VALUES ('Jose da Costa', '111.111.111-11', 'Rua das Ruas', 'Centro', '12345-678', '+5514977554862');
INSERT INTO cliente (nome, cpf, endereco, localidade, cep, telefone)
	VALUES ('Julio Marcos', '222.222.222-22', 'Av das Avenidas', 'Monte Alto', '54321-876', '+5511977448761');

/* INSERI DADOS NA TABELA 'medico' */
INSERT INTO medico (nome, crm)
	VALUES ('Jonas Carlos', 'CRM/SP 123456');
INSERT INTO medico (nome, crm)
	VALUES ('André Augusto', 'CRM/SP 654321');

/* INSERI DADOS NA TABELA 'produto' */
INSERT INTO produto (nome, designacao, composicao, preco_venda, idTipo_produto, idFabricante)
	VALUES ('Enspryng® (satralizumabe)', 'Tratamento de doenças neuromielite óptica.', 'Satralizumabe - 120mg', 1093.00, 1, 1);
INSERT INTO produto (nome, designacao, composicao, preco_venda, idTipo_produto, idFabricante)
	VALUES ('Sabonete', 'Higiene pessoal', 'Sabão', 6.70, 2, 2);
INSERT INTO produto (nome, designacao, composicao, preco_venda, idTipo_produto, idFabricante)
	VALUES ('TESTE', 'INSERIDO ERRADO', 'ERROR', 0.00, 2, 2);

/* INSERI DADOS NA TABELA 'receita_medica' */
INSERT INTO receita_medica (nome, idProduto, idMedico)
	VALUES ('Unimed', 1, 1);

/* INSERI DADOS NA TABELA 'pedido' */
INSERT INTO pedido (data, idCliente, idMedico)
	VALUES (CURDATE(), 1, 1);
INSERT INTO pedido (data, idCliente, idMedico)
	VALUES (CURDATE(), 2, NULL);
INSERT INTO pedido (data, idCliente, idMedico)
	VALUES (CURDATE(), 2, 1);

/* INSERI DADOS NA TABELA 'produto_pedido' */
INSERT INTO produto_pedido (quantidade, idPedido, idProduto)
	VALUES (1, 1, 1);
INSERT INTO produto_pedido (quantidade, idPedido, idProduto)
	VALUES (3, 2, 2);
INSERT INTO produto_pedido (quantidade, idPedido, idProduto)
	VALUES (1, 3, 1);

/* CONSULTA OS DADOS INSERIDOS */
SELECT * FROM tipo_produto;
SELECT * FROM fabricante;
SELECT * FROM cliente;
SELECT * FROM medico;
SELECT * FROM produto;
SELECT * FROM receita_medica;
SELECT * FROM pedido;
SELECT * FROM produto_pedido;

/* CONSULTA 'idPedido', 'nome do cliente' E 'data' DO PEDIDO */
SELECT p.idPedido AS 'ID', c.nome AS 'Cliente',
	DATE_FORMAT(p.data, '%d/%m/%Y') AS 'Data do Pedido'  
	FROM pedido AS p, cliente AS c
	WHERE p.idCliente = c.idCliente;

/* CONSULTA 'idPedido', 'nome do cliente', 'nome do médico' E 'data' DO PEDIDO */
SELECT p.idPedido AS 'ID', c.nome AS 'Cliente', m.nome AS 'Médico', p.data AS 'Data do pedido'  
	FROM pedido AS p, cliente AS c, medico AS m
	WHERE p.idCliente = c.idCliente AND p.idMedico = m.idMedico ORDER BY p.idPedido ASC;
    
/* CONSULTA 'idPedido', 'Nome do cliente', 'Nome do produto', 'preco unitário', 'quantidade' E 'total' DO PEDIDO */
SELECT 
	pedido.idPedido AS 'ID',
	c.nome AS 'Nome do cliente',
	p.nome AS 'Nome do produto',
    p.preco_venda AS 'Preço unitário',
    ped.quantidade AS 'Quantidade',
    (p.preco_venda * ped.quantidade) AS 'Total'
		FROM pedido, produto_pedido AS ped, produto AS p, cliente AS c
        WHERE pedido.idPedido = ped.idPedido AND p.idProduto = ped.idProduto AND c.idCliente = pedido.idCliente
			ORDER BY pedido.idPedido ASC;

/* CONSULTA 'idPedido', 'Nome do cliente', 'total' E 'data' DO PEDIDO */    
SELECT 
	pedido.idPedido AS 'ID',
	c.nome AS 'Nome do cliente',
	SUM(p.preco_venda * ped.quantidade) AS 'Total',
	pedido.data AS 'Data'
		FROM pedido
		INNER JOIN produto_pedido AS ped ON pedido.idPedido = ped.idPedido
		INNER JOIN produto AS p ON p.idProduto = ped.idProduto
		INNER JOIN cliente AS c ON c.idCliente = pedido.idCliente
			GROUP BY pedido.idPedido;

/* ATUALIZA A 'data' DO PEDIDO */
UPDATE pedido set data = DATE_SUB(CURDATE(), INTERVAL 1 DAY) WHERE idPedido = 1;

/* CONSULTA OS DADOS ALTERADOS */
SELECT * FROM pedido;

/* REMOVE PRODUTO */
DELETE FROM produto WHERE idProduto = 3;

/* CONSULTA SE OS DADOS FORAM REMOVIDOS */
SELECT * FROM produto;
