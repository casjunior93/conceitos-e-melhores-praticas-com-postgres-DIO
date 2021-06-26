SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome FROM cliente;
SELECT banco_numero, agencia_numero, numero, digito, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor FROM cliente_transacoes;

SELECT count(1) FROM banco;
SELECT count(1) FROM agencia;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;



--Quantos bancos possuem agencia
SELECT count(distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

--left join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

--right join
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;

--full join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

--teste full join
CREATE TABLE IF NOT EXISTS testeA (id SERIAL PRIMARY KEY, valor VARCHAR(10));
CREATE TABLE IF NOT EXISTS testeB (id SERIAL PRIMARY KEY, valor VARCHAR(10));

--cross join
INSERT INTO testeA (valor) VALUES ('teste1');
INSERT INTO testeA (valor) VALUES ('teste2');
INSERT INTO testeA (valor) VALUES ('teste3');
INSERT INTO testeA (valor) VALUES ('teste4');

SELECT valor FROM testeA;

INSERT INTO testeB (valor) VALUES ('testea');
INSERT INTO testeB (valor) VALUES ('testeb');
INSERT INTO testeB (valor) VALUES ('testec');
INSERT INTO testeB (valor) VALUES ('tested');

SELECT valor FROM testeB;

SELECT testeA.valor, testeB.valor
FROM testeA
CROSS jOIN testeB;

--excluindo as tabelas do cross join
DROP TABLE IF EXISTS testeA;
DROP TABLE IF EXISTS testeB;

--relacionamentos em todas as tabelas
SELECT banco.nome,
agencia.nome,
conta_corrente.numero,
conta_corrente.digito,
cliente.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	--ON conta_corrente.banco_numero = agencia.banco_numero
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero;