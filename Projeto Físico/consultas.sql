-- (Consulta com group by e having): Projetar a quantidade de passagens num determinado ano quando houvesse mais do que duas passagens.
SELECT LOCAL_DESTINO, COUNT(*)
FROM PASSAGEM
WHERE extract(year from DATA_DESTINO)=1856
GROUP BY LOCAL_DESTINO
HAVING COUNT(*)>=2;

/*
(Consulta com inner join): Projetar o Local de Destino e a Data de Destino de uma Passagem juntamente com o nome do Cliente que adquiriu 
essa Passagem e o nome do Funcionário que realizou a venda da mesma. Essa Passagem precisa necessariamente já 
ter sido utilizada em uma Viagem. Isso deve ser exibido em uma ordem decrescente de acordo com a Data de 
Destino da Passagem.
*/
SELECT P.LOCAL_DESTINO AS "LOCAL DE DESTINO", P.DATA_DESTINO AS "DATA", C.NOME AS "CLIENTE", F.NOME AS "FUNCIONÁRIO"
FROM PASSAGEM P INNER JOIN CLIENTE C ON (P.CLIENTE = C.CPF)
     INNER JOIN FUNCIONARIO F ON (P.FUNCIONARIO = F.CPF)
WHERE P.CODIGO_RESERVA IN (SELECT CODIGO_PASSAGEM
                           FROM VIAGEM)
ORDER BY P.DATA_DESTINO DESC;

/* (Consulta com outer join): Projetar [destino],  nome do [funcionário] e nome do [cliente] envolvidos numa passagem,
incluindo os clientes e funcionários que não compraram/venderam passagens.*/
SELECT P.LOCAL_DESTINO AS DESTINO, F.NOME AS FUNCIONÁRIO, C.NOME AS CLIENTE
FROM PASSAGEM P RIGHT OUTER JOIN CLIENTE C
ON C.CPF = P.CLIENTE
FULL OUTER JOIN FUNCIONARIO F
ON F.CPF = P.FUNCIONARIO;

-- (Consulta com semi join): Projetar os mentorandos de um funcionário que trabalham no mesmo setor que ele.
SELECT F.NOME
FROM FUNCIONARIO F
WHERE F.MENTOR IS NOT NULL AND F.CPF IN (
    SELECT T1.CPF
    FROM TRABALHA T1
    WHERE T1.CODIGO IN (
        SELECT T2.CODIGO
        FROM TRABALHA T2
        WHERE T2.CPF = F.MENTOR));

-- (Consulta com anti join): Projetar o código do setor e o cpf dos funcionário que não realizaram nenhuma missão com NOT IN.
SELECT S.CODIGO, S.CPF
FROM SETOR S
WHERE S.CPF NOT IN 
	(SELECT P.FUNCIONARIO
	FROM PARTICIPA P);

-- (Consulta com anti join): Projetar o código do setor e o cpf dos funcionário que não realizaram nenhuma missão com NOT EXISTS
SELECT S.CODIGO, S.CPF
FROM SETOR S
WHERE NOT EXISTS
	(SELECT P.FUNCIONARIO
	FROM PARTICIPA P
	WHERE P.FUNCIONARIO = S.CPF);
	
-- (Subconsulta escalar): Projetor o código de reserva das  passagens vendidas pelos funcionários que tem mesmo mentor de Isaac Erick da Rocha.
SELECT P.CODIGO_RESERVA
FROM PASSAGEM P
WHERE P.FUNCIONARIO IN 
    (SELECT F.CPF
    FROM FUNCIONARIO F
    WHERE MENTOR = 
        (SELECT F.MENTOR
        FROM FUNCIONARIO F
        WHERE NOME = 'Isaac Erick da Rocha'));
        
-- (Subconsulta linha): Projetar todos os códigos de reserva das passagens que tiveram o mesmo local de destino em um mesmo ano que a passagem de código de reserva 14600.
SELECT P1.CODIGO_RESERVA
FROM PASSAGEM P1 
WHERE (P1.LOCAL_DESTINO, EXTRACT(YEAR FROM P1.DATA_DESTINO)) = 
	(SELECT P2.LOCAL_DESTINO, EXTRACT(YEAR FROM P2.DATA_DESTINO)
	FROM PASSAGEM P2
	WHERE P2.CODIGO_RESERVA = 14600);
	
-- (Subconsulta tabela): Projetar todas as dados das missões que o funcionário que gerencia um setor participou.
SELECT *
FROM MISSAO M
WHERE M.CODIGO IN(
    SELECT P.CODIGO_MISSAO
    FROM PARTICIPA P
    WHERE P.FUNCIONARIO IN (
        SELECT S.CPF
        FROM SETOR S));
        
-- (Consulta com operação de conjunto): Projetar o nome de todas as pessoas que são apenas funcionários ou clientes.
SELECT C.NOME 
FROM CLIENTE C
WHERE C.NOME NOT IN (SELECT NOME FROM FUNCIONARIO)
UNION 
SELECT F.NOME 
FROM FUNCIONARIO F
WHERE F.NOME NOT IN (SELECT NOME FROM CLIENTE);
        
        
