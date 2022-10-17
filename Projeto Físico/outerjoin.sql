--projetar [nome] e [cpf do mentor] dos funcionários que possuem mentor, mas não fizeram nenhuma viagem
SELECT F.NOME AS FUNCIONÁRIO, F.MENTOR AS CPF_MENTOR
FROM FUNCIONARIO F LEFT OUTER JOIN VIAGEM V
ON F.CPF = V.FUNCIONARIO
WHERE V.FUNCIONARIO IS NULL AND F.MENTOR IS NOT NULL;

--projetar [destino], [funcionário] e [cliente] envolvidos numa viagem, incluindo os clientes e funcionários não envolvidos em viagem alguma
SELECT P.LOCAL_DESTINO AS DESTINO, F.NOME AS FUNCIONÁRIO, C.NOME AS CLIENTE
FROM VIAGEM V INNER JOIN PASSAGEM P
ON V.CODIGO_PASSAGEM = P.CODIGO_RESERVA
RIGHT OUTER JOIN CLIENTE C
ON C.CPF = P.CLIENTE
FULL OUTER JOIN FUNCIONARIO F
ON F.CPF = V.FUNCIONARIO;
