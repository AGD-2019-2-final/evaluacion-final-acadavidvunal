-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
f = FOREACH u GENERATE FLATTEN(map_d); 
gr = GROUP f BY $0;
co = FOREACH gr GENERATE FLATTEN(group), COUNT($1);
DUMP co;
STORE co INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
