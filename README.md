# 🏥 Medical Healthcare Analytics: Heart Disease Risk Factor Study

## 📌 Project Overview
This project provides a comprehensive analysis of heart disease risk factors. I implemented a dual-tool workflow using **SQL** for robust data engineering and **Python** for high-level statistical analysis and outlier management.

## 🛠️ Technical Stack
* **SQL (MySQL):** Data validation, biological error filtering, and production-ready View creation.
* **Python (Pandas, NumPy):** Statistical profiling and distribution normalization.
* **Visualization (Seaborn, Matplotlib):** Heatmaps, Boxplots, and Histograms for clinical insights.

## 🚀 Key Analytical Steps

### **Phase 1: Data Engineering (SQL)**
* Identified 170+ records with impossible biological values (BP or Cholesterol = 0).
* Built a `cleaned_patients_data` View to serve as a reliable data source for Python analysis.

### **Phase 2: Statistical Cleaning (Python)**
* **Skewness Assessment:** Detected high positive skewness in Cholesterol data.
* **Outlier Management:** Applied the **IQR (Interquartile Range) Method** to remove extreme statistical noise, significantly improving the reliability of the Mean.
* **Correlation Mapping:** Used a Heatmap to identify `ST Slope` and `Chest Pain Type` as primary predictors for heart disease.

## 📂 Project Structure
* `SQL_Scripts/`: Contains `heart_analysis_queries.sql`.
* `Data/`: Contains raw and cleaned CSV files.
* `Notebooks/`: Contains the full `Medical_Analysis.ipynb` with step-by-step code.


