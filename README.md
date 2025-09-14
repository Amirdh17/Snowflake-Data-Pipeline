# Snowflake-Air-Quality-Index-Data-Pipeline
## End to End Data Engineering Project
### Overview
This project demonstrates a real-time data pipeline that ingests, processes, and visualizes Air Quality Index (AQI) data from data.gov.in using Snowflake as data warehouse. Python script utilizes snowpark to make connection with snowflake and make use of api key to call for the json data from source (data.gov.in) and ingest AQI json raw data into internal stage for further processing. In snowflake, we kept it like four layers Stage, Clean, Consumption, Publish. Raw data transfered to Stage layer, made the raw data flatten and goes to Consumption layer where dimension and fact tables are created. Streamlit is utilized to generate report using dimension and aggregated fact table. Overall, It is a end to end data engineering automated project where json data from source, passed through different layers and showed to the user by streamlit dashboard. Data flows automatically without human intervention but need to run the python script manually. But it can be automated by Github action or Control m job scheduler.  

#### 1. Data Ingestion (Snowpark + Python)
  * A Snowpark Python script calls the data.gov.in API to fetch real-time AQI data. 
  * The Python script ingests JSON data into Snowflake internal stage for further processing.

#### 2. Staging & Storage (Snowflake Stage Layer)
  * Raw JSON data is transferred to the Stage schema with metadata (file name, load timestamp, MD5 hash) via task mounted Copy command.
  * Metadata provides auditability of data loads.

#### 3. Data Cleaning & Transformation
  * Deduplication using window functions.
  * Flattening of JSON into structured records with pollutant readings and geolocation attributes.
  * Dynamic tables automatically keep clean data updated.

#### 4. Data Normalization (Clean Layer)
  * Pollutant values (PM2.5, PM10, SO2, NO2, NH3, CO, O3) transposed into wide-column format.
  * Missing/invalid data handled by replacement rules.
  * Created flattened AQI table to store pollutant values for each AQI station

#### 5. Consumption Layer & AQI Logic
  * Built wide table for AQI computation.
  * Implemented Python UDFs in Snowflake to: Identify the prominent pollutant and to apply the three-sub-index criteria for AQI calculation.

#### 6. Dimension and Fact Tables (Consumption Layer)
  * Created Date dimension, Location Dimension and Air_Quality Fact table.

#### 7. Aggregated Fact tables
  * Aggregated based on Hourly and daily by city level AQI Data.
  * Dynamic tables ensure near real-time refresh.

#### 8. Reporting & Visualization (Streamlit)
  * Created Streamlit dashboards connected to Snowflake.
  * Provides interactive exploration of AQI trends by city, state, and pollutant.

## Tech Stack
* Snowflake (Data Warehouse, Dynamic Tables, Internal Stages)
* Snowpark (Python API)
* SQL / DDL / DML
* Streamlit (Reporting & Visualization)
* data.gov.in API (Real-time AQI data source)
