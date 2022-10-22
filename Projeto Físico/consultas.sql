-- Projetar a quantidade de passagens num determinado ano quando houvesse mais do que duas passagens
SELECT LOCAL_DESTINO, COUNT(*)
FROM PASSAGEM
WHERE extract(year from DATA_DESTINO)=1856
GROUP BY LOCAL_DESTINO
HAVING COUNT(*)>=2;