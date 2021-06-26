SELECT numero, nome, ativo
FROM banco;

--create view

CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

--criando view 2
CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;

--inserindo atraves da view

INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco Carlos', TRUE);

--consultando através da view
SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos_2 WHERE banco_numero = 51;
SELECT numero, nome, ativo FROM banco WHERE numero=51;

UPDATE vw_bancos_2 SET banco_ativo = FALSE WHERE banco_numero = 51;

SELECT numero, nome, ativo FROM banco WHERE numero=51;

DELETE FROM vw_bancos_2 WHERE banco_numero = 51;

SELECT numero, nome, ativo FROM banco WHERE numero=51;

---view temporaria -- funciona somente nessa janela

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS (
	SELECT nome FROM agencia
);

SELECT nome FROM vw_agencia;

--with options
CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (51, 'Banco Carlos', TRUE);

CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'
) WITH LOCAL CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_com_a;

INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (333,'Alfa Omega',TRUE);
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (331,'Alfa Gama',FALSE);
