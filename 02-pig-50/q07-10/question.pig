-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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
f = FOREACH u GENERATE letra,SIZE(b1),SIZE(map_d); 
ordered =  ORDER f BY $0,$1,$2 ASC;
DUMP ordered;
STORE ordered INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;