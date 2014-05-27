--Query1 What technical issues an airplane has occured and when they happened--
SELECT a.airplane_key, t.description, ta.tdate
FROM technicalissue_airplane as ta
LEFT JOIN technical_issue as t
ON ta.tissueid = t.tissueid
LEFT JOIN airplane as a
ON ta.airplane_key = a.airplane_key;

--Query2 How many employees are certified for Airplane type --
SELECT at.tname, count(empad.personnel_key) as num_of_certified_employees
FROM airplane_type as t
LEFT JOIN admission_doc       
ON at.admission_doc_key = ad.admission_doc_key
LEFT JOIN emplonboard_admissiondoc as empad  
ON empad.admission_doc_key = ad.admission_doc_key 
GROUP BY at.tname, at.typeid;

--Query3 What type flight segments are offered by an airline company and by which airplane type they are executed--
SELECT ac.name, f.arrival_airport, f.departure_airport, at.tname  
FROM flight_segment_by_airline as fsa
LEFT JOIN airline_company as ac
ON ac.airline_key = fsa.airline_key    
LEFT JOIN flight_segment as f
ON f.flight_segment_key = flight_segment_key 
LEFT JOIN flightsegment_airplanetype as fa
ON fa.flight_segment_key = f.flight_segment_key
LEFT JOIN airplane_type as at
ON at.typeid = fa.typeid;   

--Query4 For history data - which airplane, on which route, with what crew and when was flying--
SELECT a.airplane id, f.arrival_airport, f.departure_airport, 
c.num_of_req_pilots, c.num_of_req_flight_att, fca.date  
FROM flightsegment_crew_airplane as fca
LEFT JOIN flight_segment as f
ON f.flight_segment_key = fca.flight_segment_key
LEFT JOIN crew as c
ON c.crewid  = fca.crewid
LEFT JOIN airplane as a
ON a.airplane_key = fca.airplane_key;

--Query5 Adding a new flight segment--
INSERT INTO flight_segment 
VALUES ('Toronto', 'New York', '2014-05-30', '00:00:00+1000','2014-05-30','00:05:00+0600',5,'ABC');   

SQL statements :


--Query 6: Find the name and email of the tenant who is currently renting a specific area in the airport.--
SELECT t.tenant_name, t.tenant_email
FROM tenant t, area a, rent_by rb
WHERE t.tenant_id = a.tenant_id
AND rb.rent_end_date > current_date
AND area_id = 1;

--Query 7: What kind of logistics services are provided in a specific airport?--
SELECT l.luggage_transport_facility, l.catering_facility, l.manage_runways_facility, l.allocate_parking_slots_facility
FROM logistics l, airport a,logistics_take_care ltc
WHERE l.logistics_id = ltc.logistics_id
AND ltc.airport_key = a.airport_key
AND a.airport_key = 1;

--Query 8: List of all the tenants of all areas in all the airports within a specified time period.--

Select a.tenant_name from tenant as a , rented_by as b 
where a.tenant_id = b.tenant_id  and b.rent_start_date > '2011-05-16 15:36:38' and b.rent_end_date <'2013-05-16 15:36:38';

--Query 9 List all the log entries managed by Munich International airport--

select a.log_id from log as a , airport as b  
where a.managed_by = b.airport_key and b.airport_code = "MUC";

--Query 10 List the names of customers whose luggage weight more than 33  --

select a.last_name , a.first_name from customer as a , luggage as b 
where a.customer_key = b.customer_key and b.luggage_weight_kgs > 33     

--Query 11 get all the flight numbers with arrival/departure at an certain airport --
SELECT fl.flight_key
FROM flight fl, airport ai
WHERE (fl.start_airport = ai.airport_key OR
fl.end_airport = ai.airport_key) AND ai.iata_code = 'BER'

--Query 12 get the used currency at an airport --
SELECT a.name, c.name
FROM currency c, airport a, nation n
WHERE c.currency_key = n.currency_key 
AND n.nation_key = a.nation_key and a.iata_code='BER'

--Query 13 get the start and end airports of a person's flight segments--
SELECT c.first_name, c.last_name, fs.start_airport, fs.end_airport
FROM customer c, boarding_pass bp, flight_segment fs
WHERE fs.flight_segment_key = bp.flight_segment_key 
AND bp.customer_key = c.customer_key AND c.last_name = 'Mayer'

--Query 14 get the flight segments that a certain airplane flies--
SELECT ap.airplane_key, fs.flight_segment_key
FROM airplane ap, flight_segment fs, flight_segment_by_airline fsba, airline ai
WHERE fs_flight_segment_key = fsba.flight_segment_key 
AND fsba.airline_key = ai.airline_key AND ai.airline KEY = ap.airline_key AND ap.airplane_key = 1


--Query 15 get all flight a customer has booked --
SELECT f.start_airport, f.end_airport
FROM customer c, flight f, direct_flight_booking d, indirect_flight_booking i
WHERE c.customer_key = d.customer_key
AND c.customer_key = i.customer_key
AND f.flight_key = d.flight_key
AND f.flight_key = i.flight_key;   