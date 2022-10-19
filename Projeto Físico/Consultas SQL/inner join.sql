/* 
Projetar o [Local de Destino] e a [Data de Destino] de uma Passagem juntamente com o [Nome do Cliente] que 
adquiriu essa passagem e o [Nome do Funcionário] que realizou a venda da mesma. Essa Passagem precisa 
necessariamente já ter sido utilizada para uma Viagem, o Funcionário que vendeu a Passagem não pode ser 
gerente de um Setor que seja da categoria Viagem e o Cliente que detém essa Passagem não pode ter realizado a compra de 
mais do que 3 passagens. Isso deve ser exibido em uma ordem decrescente de acordo com a [Data de Destino] da Passagem.
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