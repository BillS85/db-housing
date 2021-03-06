-- Create the table with the records that have been identified as outliers
DROP TABLE IF EXISTS qc_outliers;
CREATE TABLE qc_outliers
(
	job_number text,
	address text,
	address_house text,
	address_street text,
	latitude text,
	longitude text,
	ycoord text,
	xcoord text,
	bin text,
	bbl text,
	boro text,
	block text,
	lot text,
	dob_type text,
	job_type text,
	job_description text,
	dcp_occ_category text,
	occ_init text,
	occ_prop text,
	dob_occ_init text,
	dob_occ_prop text,
	dcp_status text,
	dob_status text,
	status_date text,
	status_a text,
	status_a_year text,
	status_d text,
	status_p text,
	status_q text,
	status_q_year text,
	status_r text,
	status_x text,
	dob_bldg_type text,
	stories_init text,
	stories_prop text,
	zoningsft_init text,
	zoningsft_prop text,
	units_init text,
	units_prop text,
	units_net text,
	units_net_complete text,
	units_net_incomplete text,
	earliest_effectivedate text,
	latest_effectivedate text,
	latest_certtype text,
	latest_cofo text,
	u_2007_existtotal text,
	u_2008_existtotal text,
	u_2009_existtotal text,
	u_2010pre_existtotal text,
	u_2010post_existtotal text,
	u_2011_existtotal text,
	u_2012_existtotal text,
	u_2013_existtotal text,
	u_2014_existtotal text,
	u_2015_existtotal text,
	u_2016_existtotal text,
	u_2017_existtotal text,
	u_2018_existtotal text,
	unit_change_2007 text,
	unit_change_2008 text,
	unit_change_2009 text,
	unit_change_preapr2010 text,
	unit_change_postapr2010 text,
	unit_change_2011 text,
	unit_change_2012 text,
	unit_change_2013 text,
	unit_change_2014 text,
	unit_change_2015 text,
	unit_change_2016 text,
	unit_change_2017 text,
	unit_change_2018 text,
	u_2007_netcomplete text,
	u_2008_netcomplete text,
	u_2009_netcomplete text,
	u_2010pre_netcomplete text,
	u_2010post_netcomplete text,
	u_2011_netcomplete text,
	u_2012_netcomplete text,
	u_2013_netcomplete text,
	u_2014_netcomplete text,
	u_2015_netcomplete text,
	u_2016_netcomplete text,
	u_2017_netcomplete text,
	u_2018_netcomplete text,
	geo_cd text,
	geo_ntacode text,
	geo_ntaname text,
	geo_censusblock text,
	geo_csd text,
 	f_pfirms2015_100yr text,
 	x_dcpedited text,
 	x_mixeduse text,
	x_dup_flag text,
	x_dup_id text,
	x_dup_maxstatusdate text,
	x_dup_maxcofodate text,
	x_geomsource text,
	x_occsource text,
	x_inactive text,
	x_outlier text,
	x_withdrawal text,
	geom text
);

COPY qc_outliers FROM '/prod/db-housing/housing_build/output/qc_outliers.csv' DELIMITER ',' CSV HEADER;

-- Flag potential outliers in housing DB
UPDATE housing
SET x_outlier = TRUE
WHERE job_number IN
	(SELECT DISTINCT job_number
		FROM qc_outliers);

-- Remove the data table
DROP TABLE IF EXISTS qc_outliers;