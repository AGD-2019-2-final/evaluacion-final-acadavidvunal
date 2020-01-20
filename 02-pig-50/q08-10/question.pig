-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra :      CHARARRAY
,   b1      :  BAG{t:TUPLE(p:CHARARRAY)}
,   map_d    :  MAP[]);
f = FOREACH u GENERATE FLATTEN(b1),FLATTEN(map_d); 
val = FOREACH f GENERATE TOTUPLE($0,$1);
gr = GROUP val BY $0;
co = FOREACH gr GENERATE group, COUNT($1);
DUMP co;
STORE co INTO 'output' USING PigStorage('\t');
fs -copyToLocal output output;