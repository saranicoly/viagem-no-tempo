/*
Descrição da consulta

Projetar o Local de Destino e a Data de Destino de uma Passagem juntamente com o nome do Cliente que adquiriu 
essa Passagem e o nome do Funcionário que realizou a venda da mesma. Essa Passagem precisa necessariamente já 
ter sido utilizada em uma Viagem, o Funcionário que vendeu a Passagem não pode ser gerente de um Setor que s-
eja da categoria 'VIAGEM' e o Cliente que detém essa Passagem não pode ter realizado a compra de mais do que 
2 passagens. Isso deve ser exibido em uma ordem decrescente de acordo com a Data de Destino da Passagem.
*/

SELECT P.LOCAL_DESTINO AS "LOCAL DE DESTINO", P.DATA_DESTINO AS "DATA", C.NOME AS "CLIENTE", F.NOME AS "FUNCIONÁRIO"
FROM PASSAGEM P INNER JOIN CLIENTE C ON (P.CLIENTE = C.CPF)
     INNER JOIN FUNCIONARIO F ON (P.FUNCIONARIO = F.CPF)
WHERE P.CODIGO_RESERVA IN (SELECT CODIGO_PASSAGEM
                           FROM VIAGEM)
      AND P.FUNCIONARIO NOT IN (SELECT CPF
                                FROM SETOR S
                                WHERE S.CATEGORIA LIKE 'VIAGEM')
      AND P.CLIENTE IN (SELECT CLIENTE
            			FROM PASSAGEM
            			GROUP BY CLIENTE
            			HAVING COUNT(CODIGO_RESERVA) < 3)
ORDER BY P.DATA_DESTINO DESC