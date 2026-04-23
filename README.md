# 🚀 PySpark Performance Tuning & Optimization Project

## 📌 Overview
This project demonstrates how to optimize a PySpark ETL pipeline by identifying performance bottlenecks and applying systematic improvements.

Starting from an inefficient pipeline (47 seconds for just 75 records), I applied multiple optimization techniques to reduce runtime to **~18 seconds (61% improvement)** — using the same data and hardware.

---

## 🎯 Objectives
- Diagnose performance issues using Spark UI
- Optimize Spark transformations and actions
- Improve pipeline efficiency and scalability
- Apply real-world PySpark performance tuning techniques

---

## ⚠️ Initial Problems (Baseline)
The original pipeline had several inefficiencies:
- Multiple unnecessary `.count()` operations
- Too many partitions (200 for 75 records)
- No caching → repeated recomputation
- Late filtering → wasted computation
- Multiple aggregation scans
- Excessive small file generation

---

## ⚙️ Optimizations Applied

### 1. Removed Redundant Actions
- Eliminated unnecessary `.count()` calls
- Reduced repeated full data scans

### 2. Fixed Partitioning
- Used `coalesce(1)` before writing
- Reduced 200 partitions → 1 partition
- Eliminated memory warnings and overhead

### 3. Strategic Caching
- Cached reusable DataFrame (`clean_df`)
- Prevented recomputation across multiple operations

### 4. Filter Early (Predicate Pushdown)
- Moved filtering before expensive transformations
- Reduced unnecessary processing

### 5. Efficient Aggregations
- Combined multiple metrics into a **single `.agg()` call**
- Reduced multiple scans → single pass

---

## 📊 Performance Improvement

| Stage        | Runtime |
|-------------|--------|
| Baseline     | 47 sec |
| After fixes  | 18 sec |

✅ **~61% performance improvement**

---

## 🧠 Key Learnings

- Spark is lazy → actions trigger execution
- Partitioning directly impacts performance
- Caching prevents recomputation
- Filtering early saves compute time
- Aggregations should be combined into one pass
- Spark UI is essential for debugging performance

---

## 🛠️ Tech Stack
- PySpark
- Docker
- Parquet
- Spark UI

---

## ▶️ How to Run

```bash
git clone https://github.com/<your-username>/pyspark-optimization-project.git
cd pyspark-optimization-project

docker compose run --rm --service-ports lab
python main.py
🔍 Monitoring

Access Spark UI:

http://localhost:4040


🚀 Future Improvements

Enable Adaptive Query Execution (AQE)
Integrate with AWS S3 / Data Lake
Orchestrate using Apache Airflow
Scale to distributed cluster environment


💡 Conclusion

This project highlights how small code-level optimizations in PySpark can lead to significant performance improvements. These techniques scale effectively for large datasets in real-world data engineering pipelines.