-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
-- copia los archivos del sistema local al HDFS
fs -rm -f -r output
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        fecha:DATETIME,
        valor:INT);
gr = GROUP u BY letra;
f = FOREACH gr GENERATE FLATTEN(group) as (letra), COUNT($1);
DUMP f;
STORE f INTO 'output';
fs -copyToLocal output output;