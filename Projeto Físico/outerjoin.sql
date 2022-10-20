--  projetar [nome] e [cpf do mentor] dos funcionários que possuem mentor, mas não fizeram nenhuma viagem
SELECT F.NOME AS FUNCIONÁRIO, F.MENTOR AS CPF_MENTOR
FROM FUNCIONARIO F LEFT OUTER JOIN VIAGEM V
ON F.CPF = V.FUNCIONARIO
WHERE V.FUNCIONARIO IS NULL AND F.MENTOR IS NOT NULL;

--  projetar destino, funcionário (nome) e cliente (nome) envolvidos numa passagem,
--  incluindo os clientes e funcionários que não compraram/venderam passagens.
SELECT P.LOCAL_DESTINO AS DESTINO, F.NOME AS FUNCIONÁRIO, C.NOME AS CLIENTE
FROM PASSAGEM P RIGHT OUTER JOIN CLIENTE C
ON C.CPF = P.CLIENTE
FULL OUTER JOIN FUNCIONARIO F
ON F.CPF = P.FUNCIONARIO;
