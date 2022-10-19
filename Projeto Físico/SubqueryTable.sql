-- Projetar todos os mentorandos os quais trabalham nos mesmo setor que seu mentor
SELECT *
FROM MISSAO M
WHERE M.CODIGO IN(
    SELECT P.CODIGO_MISSAO
    FROM PARTICIPA P
    WHERE P.FUNCIONARIO IN (
        SELECT S.CPF
        FROM SETOR S))
