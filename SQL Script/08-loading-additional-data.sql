-- Load additional json data of AQI index of 3 days

-- we can order the dynamic tables by make other DTs as downstream and agg_city_fact_day_level as target lag 30m

ALTER DYNAMIC TABLE dev_db.consumption_sch.agg_city_fact_hour_level 
SET TARGET_LAG = 'DOWNSTREAM';

ALTER DYNAMIC TABLE dev_db.consumption_sch.air_quality_fact 
SET TARGET_LAG = 'DOWNSTREAM';

ALTER DYNAMIC TABLE dev_db.consumption_sch.date_dim 
SET TARGET_LAG = 'DOWNSTREAM';

ALTER DYNAMIC TABLE dev_db.consumption_sch.location_dim 
SET TARGET_LAG = 'DOWNSTREAM';

ALTER DYNAMIC TABLE dev_db.clean_sch.clean_flatten_aqi_dt
SET TARGET_LAG = 'DOWNSTREAM';

ALTER DYNAMIC TABLE dev_db.clean_sch.clean_aqi_dt
SET TARGET_LAG = 'DOWNSTREAM';

ALTER TASK  dev_db.stage_sch.copy_air_quality_data 
SET SCHEDULE = '30 minutes';

ALTER DYNAMIC TABLE dev_db.consumption_sch.agg_city_fact_hour_level 
SET TARGET_LAG = 'DOWNSTREAM';

alter task dev_db.stage_sch.copy_air_quality_data resume;


ALTER DYNAMIC TABLE dev_db.consumption_sch.agg_city_fact_day_level resume;
ALTER DYNAMIC TABLE dev_db.consumption_sch.agg_city_fact_day_level resume;
ALTER DYNAMIC TABLE dev_db.consumption_sch.agg_city_fact_hour_level resume;
ALTER DYNAMIC TABLE dev_db.consumption_sch.air_quality_fact resume;
ALTER DYNAMIC TABLE dev_db.consumption_sch.date_dim resume;
ALTER DYNAMIC TABLE dev_db.consumption_sch.location_dim resume;
ALTER DYNAMIC TABLE dev_db.clean_sch.clean_flatten_aqi_dt resume;
ALTER DYNAMIC TABLE dev_db.clean_sch.clean_aqi_dt resume;
alter task dev_db.stage_sch.copy_air_quality_data suspend;