--  projetar [destino], [funcionário] e [cliente] envolvidos numa passagem,
--  incluindo os clientes e funcionários que não compraram/venderam passagens.
SELECT P.LOCAL_DESTINO AS DESTINO, F.NOME AS FUNCIONÁRIO, C.NOME AS CLIENTE
FROM PASSAGEM P RIGHT OUTER JOIN CLIENTE C
ON C.CPF = P.CLIENTE
FULL OUTER JOIN FUNCIONARIO F
ON F.CPF = P.FUNCIONARIO;
