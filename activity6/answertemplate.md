

## Query Analysis and Optimization



### Scenario 1: The Slow Author Profile Page

**Before Query Plan and Execution times**
```txt
PASTE TERMINAL RESULT

```


**Query:**
```sql
--- Provide the query
```

**Analysis Questions:**
*   What is the primary node causing the slowness in the initial execution plan?
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   How can you optimize both the `WHERE` clause filtering and the `ORDER BY` operation with a single change?
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   Implement your fix and record the new plan. How much faster is the query now?
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_


### Scenario 2: The Unsearchable Blog

**Before Query Plan and Execution times**
```txt
PASTE TERMINAL RESULT

```


**Query:**
```sql
--- Provide the query
```

**Analysis Questions:**
*   First, try adding a standard B-Tree index on the `title` column. Run `EXPLAIN ANALYZE` again. Did the planner use your index? Why or why not?
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   The business team agrees that searching by a *prefix* is acceptable for the first version. Rewrite the query to use a prefix search (e.g., `database%`).
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   Does the index work for the prefix-style query? Explain the difference in the execution plan.
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

### Scenario 3: The Monthly Performance Report

**Before Query Plan and Execution times**
```txt
PASTE TERMINAL RESULT

```


**Query:**
```sql
--- Provide the query
```

**Analysis Questions:**
*   This query is not S-ARGable. What does that mean in the context of this query? Why can't the query planner use a simple index on the `date` column effectively?
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   Rewrite the query to use a direct date range comparison, making it S-ARGable.
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   Create an appropriate index to support your rewritten query.
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
*   Compare the performance of the original query and your optimized version.
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

---

## Submission and Rubric (20 Points Total)

Please submit the following:

1.  Your final `schema_postgres.sql` file.
2.  A separate SQL file named `indexes.sql` containing all the `CREATE INDEX` statements you used to optimize the queries.
3.  A Markdown document containing your analysis for each of the four scenarios. This document must include:
    *   The "before" and "after" execution plans from `EXPLAIN ANALYZE`.
    *   The provided queries for each scenario with EXPLAIN ANALYZE
    *   Your answers to the analysis questions for each scenario.


