-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname, color 
--    FROM 
--        u
--    WHERE color IN ('blue','black');
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
fs -rm -f -r data.csv
fs -put data.csv
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
selected = filter u by color == 'blue' OR color == 'black';
f = FOREACH selected GENERATE firstname, color;
DUMP f;
STORE f INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
