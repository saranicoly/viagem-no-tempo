-- Projetor o código de reserva das  passagens vendidas pelos funcionários que tem mesmo mentor de Isaac Erick da Rocha

SELECT P.CODIGO_RESERVA
FROM PASSAGEM P
WHERE P.FUNCIONARIO IN 
    (SELECT F.CPF
    FROM FUNCIONARIO F
    WHERE MENTOR = 
        (SELECT F.MENTOR
        FROM FUNCIONARIO F
        WHERE NOME = 'Isaac Erick da Rocha'));