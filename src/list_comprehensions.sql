SET experimental_parallel_csv=true;

DROP TABLE IF EXISTS test;
CREATE TABLE test AS (
	SELECT
		*
	FROM
		'data/parquet/test.parquet'
);

FROM test LIMIT 2;

FROM test SELECT a;

DROP TABLE IF EXISTS obs;
CREATE TABLE obs(id INT, val1 INT, val2 INT);
INSERT INTO obs VALUES (1, 10, 100), (2, 20, NULL), (3, NULL, 300);
SELECT MIN(COLUMNS(*)), COUNT(*) from obs;

SELECT COLUMNS('val[0-9]+') from obs;

SELECT [_ + 1 for _ in [1, 2, 3]] AS l;
SELECT list_transform(
	list_filter(
		[0, 1, 2, 3, 4, 5], 
		_ -> _ % 2 = 0
	), 
	_ -> _ * _
);

SELECT list_transform(
	list_filter(
		[0, 1, 2, 3, 4, 5], 
		_ -> _ % 2 = 0
	), 
	_ -> _ ** 2
);

SELECT [_ * _ for _ in [0, 1, 2, 3, 4, 5] if _ % 2 = 0];
SELECT list_filter(
	list_filter(
		[2, 4, 3, 1, 20, 10, 3, 30], 
		_ -> _ % 2 == 0
	), 
	_ -> _ % 5 == 0
);

SELECT [_ for _ in [_ for _ in [2, 4, 3, 1, 20, 10, 3, 30] if _ % 2 == 0] if _ % 5 == 0];


SELECT list_filter(
	['apple', 'banana', 'cherry', 'kiwi', 'mango'], 
	_ -> contains(_, 'a')
);


SELECT [_ for _ in ['apple', 'banana', 'cherry', 'kiwi', 'mango'] if contains(_, 'a')];

SELECT [_ for _ in ['ab', 'cad', 'eda'] if _ LIKE 'a%'];
SELECT [x + 1 for x in [1, 2, 3] if x >= 2] AS l;
SELECT [x + 1 for x in [1, 2, 3]] AS l;

DROP TABLE IF EXISTS fruit_tbl;
CREATE TABLE fruit_tbl AS SELECT ['apple', 'banana', 'cherry', 'kiwi', 'mango'] fruits; 
SELECT [_ for _ in fruits if contains(_, 'a')] FROM fruit_tbl;

SELECT [len(_) for _ in ['goodbye', 'cruel', 'world']];

DROP TABLE IF EXISTS word_tbl;
CREATE TABLE word_tbl AS SELECT ['goodbye', 'cruel', 'world'] words;

SELECT [len(_) for _ in words] from word_tbl;

DROP TABLE IF EXISTS store_inventory;
CREATE TABLE store_inventory(store_id INTEGER, fruits VARCHAR[]);
INSERT INTO store_inventory VALUES (1, ['Apple', 'Banana', 'Mango']);
INSERT INTO store_inventory VALUES (2, ['Mango', 'Pineapple']);
SELECT 
	[
		concat(store_id, '-', fruit) for fruit in fruits 
		if lower(fruit) IN ('mango', 'banana')
	] AS filtered_fruit
FROM 
	store_inventory;

-- DROP TABLE IF EXISTS rand;

-- CREATE TABLE rand AS (
-- 	SELECT
-- 	    *
-- 	FROM
-- 		generate_series(5)
-- );

