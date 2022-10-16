-- quantidade de clientes que compraram passagem para cada destino num determinado ano
SELECT LOCAL_DESTINO, extract(year from DATA_DESTINO), COUNT(*) FROM PASSAGEM
-- em todos os anos
GROUP BY LOCAL_DESTINO, extract(year from DATA_DESTINO)
-- em determinado ano
HAVING extract(year from DATA_DESTINO)=1856;