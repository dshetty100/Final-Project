CREATE TABLE expeditions (
	
	expedition_id VARCHAR(9) NOT NULL,
	peak_id VARCHAR(4) NOT NULL,
	peak_name VARCHAR Not NULL,
	year_id VARCHAR NOT NULL,
	season VARCHAR NOT NULL,
	basecamp_date VARCHAR NOT NULL,
	highpoint_date VARCHAR NOT NULL,
	termination_date VARCHAR NOT NULL,
	termination_reason VARCHAR NOT NULL,
	highpoint_metres VARCHAR NOT NULL,
	members VARCHAR NOT NULL,
	member_deaths VARCHAR NOT NULL,
	hired_staff VARCHAR NOT NULL,
	hired_staff_deaths VARCHAR NOT NULL,
	oxygen_used BOOLEAN NOT NULL,
	trekking_agency VARCHAR NOT Null,
	PRIMARY KEY (expedition_id)
	
);

CREATE TABLE members (
	
	expedition_id VARCHAR(9) NOT NULL,
	member_id VARCHAR(12) NOT NULL,
	peak_id VARCHAR(4) NOT NULL,
	peak_name VARCHAR Not NULL,
	year_id VARCHAR NOT NULL,
	season VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	age VARCHAR NOT NULL,
	citizenship VARCHAR NOT NULL,
	expedition_role VARCHAR NOT NULL,
	hired BOOLEAN NOT NULL,
	highpoint_metres VARCHAR NOT NULL,
	success BOOLEAN NOT NULL,
	solo BOOLEAN NOT NULL,
	oxygen_used BOOLEAN NOT NULL,
	died BOOLEAN NOT NULL,
	death_cause VARCHAR NOT NULL,
	death_height VARCHAR NOT NULL,
	injured BOOLEAN NOT NULL,
	injury_type VARCHAR NOT NULL,
	injury_height_metres VARCHAR NOT NULL,
	FOREIGN KEY (expedition_id) REFERENCES expeditions(expedition_id),
	PRIMARY KEY (member_id)
	
);

	SELECT  ex.expedition_id, ex.peak_id, ex.peak_name, ex.year_id, ex.season, ex.basecamp_date, ex.highpoint_date, ex.termination_date, ex.termination_reason, ex.members, ex.member_deaths, ex.hired_staff, ex.hired_staff_deaths, ex.trekking_agency,
	pk.member_id, pk.sex, pk.age, pk.citizenship, pk.expedition_role, pk.hired, pk.highpoint_metres, pk.success, pk.solo, pk.oxygen_used, pk.died, pk.death_cause, pk.death_height, pk.injured, pk.injury_type, pk.injury_height_metres
	INTO himalayan_data
	FROM expeditions as ex
	LEFT OUTER JOIN members as pk
	USING (expedition_id);
	   
CREATE TABLE peaks (
    peak_id VARCHAR NOT NULL,
	peak_name VARCHAR NOT NULL,
	height_metres VARCHAR NOT NULL,
	climbing_status VARCHAR NOT NULL,
	first_ascent_year VARCHAR NOT NULL,
	first_ascent_expedition VARCHAR NOT NULL,
	first_ascent_expedition_id VARCHAR NOT NULL,
	PRIMARY KEY (peak_id)
);

	SELECT  h.expedition_id, h.peak_id, h.peak_name, h.year_id, h.season, h.basecamp_date, h.highpoint_date, h.termination_date, h.termination_reason, h.members, h.member_deaths, h.hired_staff, h.hired_staff_deaths, h.trekking_agency,
	h.member_id, h.sex, h.age, h.citizenship, h.expedition_role, h.hired, h.highpoint_metres, h.success, h.solo, h.oxygen_used, h.died, h.death_cause, h.death_height, h.injured, h.injury_type, h.injury_height_metres, pk.height_metres
	INTO final_joined_data
	FROM himalayan_data as h
	LEFT OUTER JOIN peaks as pk
	USING (peak_id);

SELECT * FROM final_joined_data