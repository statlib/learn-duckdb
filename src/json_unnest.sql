DROP TABLE IF EXISTS example;
CREATE TABLE example (j JSON);
INSERT INTO example VALUES
  (' { "family": "anatidae", "species": [ "duck", "goose", "swan", null ] }');
SELECT json_extract(j, '$.family') FROM example;
SELECT j->'$.family' FROM example;
-- "anatidae"
SELECT j->'$.species[0]' FROM example;
-- "duck"
SELECT j->'$.species'->0 FROM example;
-- "duck"
SELECT j->'species'->>[0,1] FROM example;
-- ["duck", "goose"]
SELECT json_extract_string(j, '$.family') FROM example;
-- anatidae
SELECT j->>'$.family' FROM example;
-- anatidae
SELECT j->>'$.species[0]' FROM example;
-- duck
SELECT j->'species'->>0 FROM example;
-- duck
SELECT j->'species'->>[0,1] FROM example;
-- [duck, goose]

DROP TABLE IF EXISTS example;
CREATE TABLE example (j JSON);
INSERT INTO example VALUES
  ('{"family": "anatidae", "species": ["duck", "goose"], "coolness": 42.42}'),
  ('{"family": "canidae", "species": ["labrador", "bulldog"], "hair": true}');

SELECT
  JSON_STRUCTURE(JSON_EXTRACT(j, '$.species')),
  JSON_STRUCTURE(JSON_TRANSFORM(JSON_EXTRACT(j, '$.species'), '["VARCHAR"]'))
 FROM
  example;
  
SELECT
  JSON_GROUP_STRUCTURE(JSON_EXTRACT(j, '$.species')),
  JSON_GROUP_STRUCTURE(JSON_TRANSFORM(JSON_EXTRACT(j, '$.species'), '["VARCHAR"]'))
 FROM
  example;

 SELECT 
  UNNEST(JSON_EXTRACT(j, '$.species')) AS species 
 FROM
  example;
  
  
 SELECT 
  UNNEST(JSON_TRANSFORM(JSON_EXTRACT(j, '$.species'), '["VARCHAR"]')) AS species 
 FROM
  example;


SELECT 
  j -> 'family' as family, 
  unnest(json_transform(json_extract(j, '$.species'), '["VARCHAR"]')) AS species 
FROM
  example;
