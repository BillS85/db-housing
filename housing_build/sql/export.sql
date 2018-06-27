-- create a tempory table from the housing table where development happened
-- with the desired fields in the desired order named approriatly
-- copy that table to the output folder and drop the table
CREATE TABLE housing_export AS 
	(SELECT job_number,job_type,occ_init,occ_prop,dcp_status,dob_status,status_date,status_a,status_d,status_p,status_q,status_r,status_x,stories_init,stories_prop,zoningsft_init,zoningsft_prop,units_init,units_prop,units_net,units_net_complete,units_net_incomplete,earliest_effectivedate,latest_effectivedate,latest_certtype,latest_cofo,unit_change_2007,unit_change_2008,unit_change_2009,unit_change_preapr2010,unit_change_postapr2010,unit_change_2011,unit_change_2012,unit_change_2013,unit_change_2014,unit_change_2015,unit_change_2016,unit_change_2017,geo_cd,geo_ntacode,geo_ntaname,geo_censusblock,geo_csd,pfirms2015_100yr,x_dup_flag,x_dup_id,x_inactive,x_outlier,address,latitude,longitude,ycoord,xcoord,bin,bbl,boro 
	FROM housing);

\copy (SELECT * FROM housing_export) TO '$REPOLOC/housing_build/output/hdb_housingpermits.csv' DELIMITER ',' CSV HEADER;

DROP TABLE housing_export;