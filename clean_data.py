import polars as pl 

df = pl.read_csv(
    source="data/raw/SIdataset.csv", 
    null_values=["NA", "N/A", "NULL", "null", ""],
    ignore_errors=True
)

df = df.rename(lambda col: col.lower())

df.write_csv("data/processed/supplimental_instruction.csv")
df.write_parquet("data/processed/supplimental_instruction.parquet")