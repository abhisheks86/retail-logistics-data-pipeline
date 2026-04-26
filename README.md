# 🚀 End-to-End Retail & Logistics Data Pipeline

## 📋 Executive Summary
Raw data is a liability until it is structured and pipelined. This project is a complete, end-to-end Data Engineering and Business Intelligence architecture. I ingested unstructured retail revenue and B2B EV fleet logistics data, built a custom ETL (Extract, Transform, Load) pipeline using Python, deployed an automated SQL database engine, and visualized the final business intelligence in a Power BI dashboard.

**Target Output:** To provide actionable insights regarding top-performing retail stores and transport fleet efficiency.

---

## 🛠️ Tech Stack & Architecture
* **Data Extraction & Cleaning:** Python (Pandas, NumPy)
* **Database Engine:** SQLite / MySQL (via Python DB connections)
* **Data Analytics:** Advanced SQL (CTEs, Window Functions like `DENSE_RANK()`)
* **Data Visualization:** Power BI

---

## ⚙️ The Pipeline Architecture

### Phase 1: Data Ingestion & Cleaning (`01_data_cleaning.ipynb`, `02_vehicle_cleaning.ipynb`)
* Handled messy, real-world CSV files containing retail metrics and transport vehicle logs.
* Normalized data types, standardized date formats, and engineered missing/null values to make the data production-ready.

### Phase 2: The SQL Engine (`03_sql_engine.ipynb`)
* Bypassed manual imports by writing a custom Python script that acts as a database engine.
* Automatically generates schema, creates tables, and pushes the cleaned Pandas DataFrames directly into a relational SQL database.

### Phase 3: Business Intelligence Extraction (`01_business_analysis.sql`)
* Deployed complex SQL logic instead of basic queries to extract true business value.
* Utilized **Common Table Expressions (CTEs)** and **Window Functions** to rank stores by revenue, analyze transport fleet utilization, and identify operational bottlenecks.

### Phase 4: Visualization (Power BI)
* Connected the structured database directly to Power BI.
* Built the **B2B EV Dashboard** to track fleet logistics, delivery efficiency, and core retail KPIs. *(See repository for visual PDF exports).*

---

## 📈 Key Business Insights Discovered
*(Note: Here is where you prove you understand the business, not just the code. Add 2-3 bullet points about what the data actually showed).*
* **Insight 1:** [e.g., The top 5% of retail stores accounted for X% of total revenue...]
* **Insight 2:** [e.g., The B2B EV fleet showed a drop in efficiency during X timeframe due to...]
* **Insight 3:** [e.g., By ranking transport vehicles using dense rank, we identified that...]

---

## 🗂️ How to Run This Project
1. Clone the repository to your local machine.
2. Ensure you have Python and Pandas installed (`pip install pandas`).
3. Run the cleaning scripts sequentially.
4. Execute `03_sql_engine.ipynb` to generate the local database.
5. Open the `.pbix` file in Power BI to view the interactive dashboard.
