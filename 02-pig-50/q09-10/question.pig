-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
fs -rm -f -r data.csv
fs -put data.csv
u = LOAD 'data.csv' USING PigStorage(',')
    AS (key :      INT
,   name      :  CHARARRAY
,   last_n      :  CHARARRAY
,   date      :  CHARARRAY
,   color      :  CHARARRAY
,   value    :  INT);
f = FOREACH u GENERATE CONCAT(name,'@',last_n); 
DUMP f;
STORE f INTO 'output';
fs -copyToLocal output output;