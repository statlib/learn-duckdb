
PRAGMA enable_progress_bar;
PRAGMA enable_print_progress_bar;

DROP TABLE obs;
CREATE TABLE obs(id INT, val1 INT, val2 INT);
INSERT INTO obs VALUES (1, 10, 100), (2, 20, NULL), (3, NULL, 300);

COPY obs to 'obs.parquet'; 
SELECT * FROM 'obs.parquet';
