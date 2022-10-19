SELECT F.NOME
FROM FUNCIONARIO F
WHERE F.MENTOR IS NOT NULL AND F.CPF IN (
    SELECT T.CPF
    FROM TRABALHA T
    WHERE T.CODIGO IN (
        SELECT T.CODIGO
        FROM TRABALHA T
        WHERE T.CPF = F.MENTOR)
)

-- projetar os mentorandos de um funcionário que trabalham no mesmo setor que ele
