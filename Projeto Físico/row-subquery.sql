-- Projetar todos os códigos de reserva das passagens que tiveram o mesmo local de destino em um mesmo ano que a passagem de código de reserva 14600.
SELECT P1.CODIGO_RESERVA
FROM PASSAGEM P1 
WHERE (P1.LOCAL_DESTINO, EXTRACT(YEAR FROM P1.DATA_DESTINO)) = (SELECT P2.LOCAL_DESTINO, EXTRACT(YEAR FROM P2.DATA_DESTINO)
                                                                FROM PASSAGEM P2
                                                                WHERE P2.CODIGO_RESERVA = 14600)
