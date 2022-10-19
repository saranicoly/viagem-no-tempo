--Projetar o código do setor e o nome dos funcionário que não realizaram nenhuma missão

 SELECT S.CODIGO, S.CPF
 FROM SETOR S
 WHERE S.CPF NOT IN
  (SELECT P.FUNCIONARIO
  FROM PARTICIPA P);