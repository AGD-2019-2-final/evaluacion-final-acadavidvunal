-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT);
ordered_data = ORDER u BY valor ASC;
val = FOREACH ordered_data GENERATE valor;
limit_data = LIMIT val 5; 
DUMP limit_data;
STORE limit_data INTO 'output';
fs -copyToLocal output output;
