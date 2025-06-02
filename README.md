 Hospital Resource Utilization Analysis

An end-to-end data analytics project focused on improving hospital operational efficiency using **SQL** for deep data exploration and **Power BI** for interactive visual storytelling.

# Project Objective

The goal of this project is to identify patterns, inefficiencies, and optimization opportunities in hospital resource management, including:
- Ward performance and utilization
- Doctor workload and availability
- Patient trends such as length of stay and wait times
- Bed availability and occupancy patterns


# Tools & Technologies Used

| Tool      | Purpose                                  |
|-----------|-------------------------------------------|
| SQL       | Data querying, transformation, and KPI derivation using subqueries, joins, CTEs, window functions |
| Power BI  | Visualizing KPIs, comparisons, and trends using cards, bar charts, line graphs, donut charts, matrix,combo line chart etc. |




# SQL Analysis Overview

Performed deep-dive analysis using SQL queries to derive key operational insights:

 A. **Ward Performance**
- 🕒 **General ward** had the **highest average waiting time**: `45.13 minutes`
- 🏥 **Surgery ward** had the **highest occupancy rate**: `52.08%`
- 🧒 **Pediatrics ward** had the **lowest occupancy**: `31.25%` — signaling underutilization

 B. **Doctor Workload**
- Tracked average daily availability of 83 doctors
- Identified **Doctor Amy Johnson (doctor_id1)** as the busiest with **38+ patients**

C. **Operational Trends**
- Peak wait times occurred on **Dec 4 and Dec 18**, indicating demand surges or staffing gaps

D. **Advanced Metrics**
- Ranked patients by **Length of Stay**
- Created **Running Totals** of admissions for cumulative trend analysis

SQL Techniques Used:  
> Joins, Aggregate Functions, Window Functions, CASE Statements, CTEs (Common Table Expressions)


Power BI Dashboard Highlights

Created an interactive dashboard to present findings visually and support real-time decision making.

Key Visualizations:
- **Cards**: Admissions per Doctor (135K), Total Admissions (14M), Available Beds (107), Avg. LOS (8), Total Patients (1K)
- **Line Chart**: Monthly Admissions Trend
- **Column Chart**: Admissions by Ward Type (Surgery leads with 3.2M)
- **Table**: Monthly Admissions per Doctor by Ward
- **Combo Chart**: Avg. LOS vs. Total Beds per Ward
- **Donut Chart**: Bed Occupancy Rate by Gender
- **Waterfall Chart**: Change in Avg. BMI by Diet
- **Funnel**: Patient conversion through treatment stages

 Insights Delivered:
- **Surgery ward** is highly active but efficient (LOS: 7.6 days)
- **ICU** shows short critical stays (LOS: 1.9 days) with high admission volume
- **Doctor overload** identified with 135K admissions per doctor (benchmark: 120K)
- Highlighted **bed shortages** in ICU & Surgery departments
- Gender-based analysis showed nearly equal occupancy

 Key Business Outcomes

- Identified **underused departments** for reallocation of resources  
- Flagged **doctor overutilization** to prevent burnout  
- Recommended **data-driven scheduling** to minimize patient wait times  
- Delivered actionable KPIs to optimize **bed capacity and patient throughput**





