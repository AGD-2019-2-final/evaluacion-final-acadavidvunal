--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
fs -rm -f -r truck_event_text_partition.csv
fs -put truck_event_text_partition.csv
u = LOAD 'truck_event_text_partition.csv' USING PigStorage(',')
    AS (driverId :      INT
,   truckId      :  INT
,   eventTime    :  chararray
,   eventType  :    chararray
,   longitude  :    DOUBLE
,  latitude    :   DOUBLE
,   eventKey     :  chararray
,   correlationId:  chararray
,  driverName    : chararray
,   routeId       : LONG
,   routeName     : chararray
,   eventDate     : chararray);
limit_data = LIMIT u 10;
ordered_data = ORDER limit_data BY driverId,truckId,eventTime ASC;
f = FOREACH ordered_data GENERATE driverId,truckId,eventTime; 
DUMP f;
STORE f INTO 'output' USING PigStorage (',');
fs -copyToLocal output output;
