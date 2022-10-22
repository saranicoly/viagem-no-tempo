--Projetar o código do setor e o cpf dos funcionário que não realizaram nenhuma missão com NOT IN

 SELECT S.CODIGO, S.CPF
 FROM SETOR S
 WHERE S.CPF NOT IN
  (SELECT P.FUNCIONARIO
  FROM PARTICIPA P);

--Projetar o código do setor e o cpf dos funcionário que não realizaram nenhuma missão com NOT EXISTS

SELECT S.CODIGO, S.CPF
FROM SETOR S
WHERE NOT EXISTS
 ( SELECT P.FUNCIONARIO
    FROM PARTICIPA P
    WHERE P.FUNCIONARIO = S.CPF);