# Learning_sql
A little about my roadmap:
Advanced SQL and Data Engineering Syllabus (PostgreSQL / Pagila)
Phase 0: Warm-up and Consolidation (Solid Foundation)
• 0.1 Integration of filtering and aggregation (JOIN, GROUP BY, HAVING, ORDER BY).
• 0.2 Applied conditional logic (CASE WHEN inside and outside aggregations).
• 0.3 Subqueries (in WHERE, in FROM, scalar, and correlated) vs. JOIN.
• 0.4 Modular architecture with CTEs (simple WITH, chained CTEs, and separation of concerns).
Sprint 3: In-Depth Window Functions (Reinforcement and Wrap-up)
• 3.1 Anatomy of a window (OVER, PARTITION BY, ORDER BY) and logical order of execution.
• 3.2 Ranking functions (ROW_NUMBER, RANK, DENSE_RANK) and tie-handling.
• 3.3 Filtering on windows (CTE + Window Function pattern).
• 3.4 Offset functions (LAG and LEAD, handling offsets and default values).
• 3.5 Window aggregations and running totals (SUM() OVER, COUNT() OVER, AVG() OVER).
• 3.6 Window frames (WINDOW FRAME: ROWS vs. RANGE, UNBOUNDED PRECEDING, CURRENT ROW, moving averages).
Sprint 4: Complex Query Architecture (Real-World Environment)
• 4.1 Granularity control and Fan-out prevention (avoiding record duplication when joining tables at different levels).
• 4.2 Advanced date and time manipulation (DATE_TRUNC, EXTRACT, AGE, INTERVAL arithmetic).
• 4.3 Defensive programming and null handling (COALESCE, NULLIF, division-by-zero prevention).
• 4.4 Data deduplication (standard Data Engineering patterns for cleaning duplicate records).
• 4.5 Cohort analysis and basic retention using CTE pipelines.
Sprint 5: Performance, Indexes, and Under the Hood
• 5.1 Logical order vs. physical order of execution in PostgreSQL.
• 5.2 Reading and interpreting execution plans (EXPLAIN and EXPLAIN ANALYZE).
• 5.3 Data access methods (Sequential Scan, Index Scan, Index Only Scan, Bitmap Heap Scan).
• 5.4 In-memory join algorithms (Nested Loop, Hash Join, Merge Join).
• 5.5 Index design and creation (B-Tree, composite indexes, when an index helps and when it hurts).
• 5.6 Optimization best practices (avoiding functions on indexed columns in the WHERE clause, SARGability).
Sprint 6: Database Objects, ACID, and Automation
• 6.1 Standard Views (VIEW) vs. Materialized Views (MATERIALIZED VIEW and refreshing them).
• 6.2 Transactions (BEGIN, COMMIT, ROLLBACK) and ACID properties.
• 6.3 Basic concurrency and isolation levels (Dirty Reads, Non-repeatable Reads, Phantom Reads).
• 6.4 SQL and PL/pgSQL Functions (CREATE FUNCTION).
• 6.5 Stored Procedures (STORED PROCEDURES) for task orchestration.
• 6.6 Triggers (TRIGGERS) and automated audit tables.
Sprint 7: Data Modeling Fundamentals for Data Engineering
• 7.1 Transactional systems (OLTP) vs. analytical systems (OLAP).
• 7.2 Dimensional modeling: Fact Tables and Dimension Tables.
• 7.3 Star Schema vs. Snowflake Schema.
• 7.4 Data loading patterns: Full Load vs. Incremental Load and basic historical change management (SCD Type 1 and Type 2).

Just learning sql 
