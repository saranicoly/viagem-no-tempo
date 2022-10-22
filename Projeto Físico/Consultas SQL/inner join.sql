/*
Descrição da consulta

Projetar o Local de Destino e a Data de Destino de uma Passagem juntamente com o nome do Cliente que adquiriu 
essa Passagem e o nome do Funcionário que realizou a venda da mesma. Essa Passagem precisa necessariamente já 
ter sido utilizada em uma Viagem. Isso deve ser exibido em uma ordem decrescente de acordo com a Data de 
Destino da Passagem.
*/

SELECT P.LOCAL_DESTINO AS "LOCAL DE DESTINO", P.DATA_DESTINO AS "DATA", C.NOME AS "CLIENTE", F.NOME AS "FUNCIONÁRIO"
FROM PASSAGEM P INNER JOIN CLIENTE C ON (P.CLIENTE = C.CPF)
     INNER JOIN FUNCIONARIO F ON (P.FUNCIONARIO = F.CPF)
WHERE P.CODIGO_RESERVA IN (SELECT CODIGO_PASSAGEM
                           FROM VIAGEM)
ORDER BY P.DATA_DESTINO DESC