import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

df = pd.DataFrame({
  "a": [1, 2, 3],
  "b": ['foo', 'bar', 'baz'],
  "c": [True, False, True]
})
df_arr = pa.Table.from_pandas(df)
pq.write_table(df_arr, '../data/parquet/test.parquet')
