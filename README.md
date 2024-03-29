# learn-`duckdb`
Repo to experiment with [`duckdb`](https://github.com/duckdb/duckdb)

## Building from source
```
# https://duckdb.org/dev/building.html
# https://duckdb.org/docs/archive/0.9.1/installation/
sudo apt-get update
sudo apt-get install -y git g++ cmake ninja-build

git clone https://github.com/duckdb/duckdb.git
cd duckdb
export BUILD_PYTHON=1 make debug
make -j8
```

## Libraries
* https://sourcegraph.com/search?q=context:global+duckdb+file:requirements.txt&patternType=standard&sm=1&groupBy=repo

### Database
* LanceDB
* Velox

### Dashboard
* Rill
* Metabase
* Superset

### Orchestration
* Dagster
* DBT
* Kedro
* Prefect

### Other
* DBeaver
* DLT
* Evidence
* Hex
* Motherduck
* Vaex
* Data Fusion

## Links
### duckdb
* [:computer: duckdb-python.py](https://github.com/duckdb/duckdb/blob/master/examples/python/duckdb-python.py)
* [:computer: data-parquet-testing](https://github.com/duckdb/duckdb/blob/master/data/parquet-testing)
* [:computer: parquet-tests](https://github.com/duckdb/duckdb/tree/master/test/parquet)
* [:computer: json-sql-tests](
https://github.com/duckdb/duckdb/tree/master/test/sql/json)
* [:computer: json-ext-tests](https://github.com/duckdb/duckdb/blob/master/tools/pythonpkg/tests/extensions/json/test_read_json.py)
* [:scroll: JSON functions](https://duckdb.org/docs/extensions/json)
* [:scroll: Lightweight Compression in DuckDB](https://duckdb.org/2022/10/28/lightweight-compression.html)
* [:scroll: Announcing DuckDB 0.6.0](https://duckdb.org/2022/11/14/announcing-duckdb-060.html)
  * `UNION` type
  * `FROM`-first syntax
  * `COLUMNS` expression
  * List comprehension
* [:scroll: Modern Data Stack in a Box](https://duckdb.org/2022/10/12/modern-data-stack-in-a-box.html)
  * DuckDB + Meltano + dbt + Superset
* [:scroll: Friendlier SQL](https://duckdb.org/2022/05/04/friendlier-sql.html)
  * `SELECT * EXCLUDE` 
  * `SELECT * REPLACE`
  * `GROUP BY ALL`
  * `ORDER BY ALL`
  * Column Aliases in `WHERE` / `GROUP BY` / `HAVING`
  * List Slicing
  * String Slicing
  * Simple List and Struct Creation
  * Struct Dot Notation
