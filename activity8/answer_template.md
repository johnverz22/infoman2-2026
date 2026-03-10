# Activity 8 Answer Template

## Part 1: Star Schema Design

### 1. Fact Table Grain

<Write your grain statement here>

### 2. Fact Measures

<List measures here>

### 3. Dimension Tables and Attributes

- `dim_date`: <attributes>
- `dim_customer`: <attributes>
- `dim_product`: <attributes>
- `dim_branch`: <attributes>

### 4. Relationship Summary

<Describe FK links from fact to dimensions>

## Part 2: Warehouse DDL

```sql
-- Paste your complete DDL here
```

## Part 3: ETL Procedure

### 1. Procedure Code

```sql
-- Paste CREATE OR REPLACE PROCEDURE dw.run_sales_etl() here
```

### 2. Procedure Execution

```sql
CALL dw.run_sales_etl();
```

### 3. ETL Log Output

```sql
SELECT * FROM dw.etl_log ORDER BY run_ts DESC;
```

```txt
-- Paste output here
```

## Part 4: Analytical Queries

### Query 1: Monthly Revenue by Branch Region

```sql
-- SQL here
```

Interpretation:

<1-2 sentence interpretation>

### Query 2: Top 5 Products by Total Revenue

```sql
-- SQL here
```

Interpretation:

<1-2 sentence interpretation>

### Query 3: Customer Region Contribution to Sales

```sql
-- SQL here
```

Interpretation:

<1-2 sentence interpretation>
