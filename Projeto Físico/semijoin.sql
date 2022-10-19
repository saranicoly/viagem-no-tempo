SELECT F.NOME
FROM FUNCIONARIO F
WHERE F.MENTOR IS NOT NULL AND F.CPF IN (
    SELECT T1.CPF
    FROM TRABALHA T1
    WHERE T1.CODIGO IN (
        SELECT T2.CODIGO
        FROM TRABALHA T2
        WHERE T2.CPF = F.MENTOR)
)
)

-- projetar os mentorandos de um funcionário que trabalham no mesmo setor que ele
