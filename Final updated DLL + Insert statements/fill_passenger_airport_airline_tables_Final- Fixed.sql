INSERT INTO currency VALUES (1, 'Euro', 'Euro');
INSERT INTO currency VALUES (2, 'Dollar', '$');
INSERT INTO currency VALUES (3, 'Pound Sterling', 'Pound');
INSERT INTO currency VALUES (4, 'Yen', 'Yen');
INSERT INTO currency VALUES (5, 'Swiss Franc', 'CHF');
COMMIT;

INSERT INTO travel_agency VALUES (1, 'Alltours', 'Am Innenhafen 8-10, 47059 Duisburg');
INSERT INTO travel_agency VALUES (2, 'Neckermann Reisen', 'Thomas-Cook-Platz 1, 61440 Oberursel');
INSERT INTO travel_agency VALUES (3, 'TUI Reisecenter', 'Karl-Wiechert-Allee 23, 30625 Hannover');
INSERT INTO travel_agency VALUES (4, 'DER Tour', 'Emil-von-Behring-Strasse 6, 60439 Frankfurt');
INSERT INTO travel_agency VALUES (5, 'ab-in-den-urlaub', 'Barfussgaesschen 11, 04109 Leipzig');
COMMIT;

INSERT INTO address (line1, line2, city, postcode) VALUES ('Pazmaniteng 24-9', '', 'Vienna', 'A-1012');
INSERT INTO address (line1, line2, city, postcode) VALUES ('Escuela Rural 45', 'fl. 7', 'San Clemente', 'X5187XAB');
INSERT INTO address (line1, line2, city, postcode) VALUES ('Weihburggasse 26', '', 'Vienna', 'A-1010');
INSERT INTO address (line1, line2, city, postcode) VALUES ('Rue du Cornet 6', '', 'Verviers', 'B-4800');
INSERT INTO address (line1, line2, city, postcode) VALUES ('Albertinkatu 36', 'fl. 3', 'Helsinki', '00180');
COMMIT;

INSERT INTO catering VALUES (1, 'Breakfast', 'Apple Juice');
INSERT INTO catering VALUES (2, 'Lunch', 'Orange Juice');
INSERT INTO catering VALUES (3, 'Dinner', 'Coke');
INSERT INTO catering VALUES (4, 'Snack', 'Beer');
INSERT INTO catering VALUES (5, 'Brunch', 'Wine');
COMMIT;

INSERT INTO tower VALUES (1, 'E6');
INSERT INTO tower VALUES (2, 'W9');
INSERT INTO tower VALUES (3, 'S2');
INSERT INTO tower VALUES (4, 'N6');
INSERT INTO tower VALUES (5, 'W5');
COMMIT;

INSERT INTO tenant VALUES (1, 'Miroslav Klose', 'Rotelstrasse 30, 74166 Neckarsulm', 25446756,'Miroslav_Klose@gmx.de');
INSERT INTO tenant VALUES (2, 'Manuel Neuer', 'Margot-Kalinke-Strasse 4, 80939 Muenchen', 45667878, 'Manuel_Neuer@gmx.de');
INSERT INTO tenant VALUES (3, 'Bastian Schweinsteiger', 'Breslauer Strasse 35, 52068 Aachen',89076544,'Bastian_Schweinsteiger@gmx.de');
INSERT INTO tenant VALUES (4, 'Philipp Lahm', 'Messering 10, 15234 Frankfurt / Oder',243587546,'Philipp_Lahm@gmx.de');
INSERT INTO tenant VALUES (5, 'Marcel Schmelzer', 'Stubbenweg 27, 26125 Oldenburg',045643731,'Marcel_Schmelzer@gmx.de');
COMMIT;

INSERT INTO nation VALUES (1, 'Germany', 'DE', 1);
INSERT INTO nation VALUES (2, 'USA', 'US', 2);
INSERT INTO nation VALUES (3, 'Great Britain', 'GB', 3);
INSERT INTO nation VALUES (4, 'Japan', 'JP', 4);
INSERT INTO nation VALUES (5, 'Switzerland', 'CH', 5);
COMMIT;

INSERT INTO logistics VALUES (1, 'Schenker AG', TRUE,TRUE,FALSE,TRUE);
INSERT INTO logistics VALUES (2, 'DHL Supply Chain', FALSE,TRUE,TRUE,TRUE);
INSERT INTO logistics VALUES (3, 'DB Schenker', TRUE,TRUE,FALSE,TRUE);
INSERT INTO logistics VALUES (4, 'Rhenus', TRUE,TRUE,TRUE,TRUE);
INSERT INTO logistics VALUES (5, 'Dachser', TRUE,FALSE,TRUE,TRUE);
COMMIT;

INSERT INTO airport VALUES (1, 'Flughafen Berlin Brandenburg', 1, 1,'BER',1);
INSERT INTO airport VALUES (2, 'John F. Kennedy International Airport', 2, 2,'JFK',2);
INSERT INTO airport VALUES (3, 'London Heathrow Airport', 3, 3,'LHR',3);
INSERT INTO airport VALUES (4, 'Tokio-Narita Airport', 4,4, 'NRT',4);
INSERT INTO airport VALUES (5, 'Flughafen Bern-Belp', 5,5, 'BRN',5);
COMMIT;

INSERT INTO customer VALUES (1, 'Mayer', 'Stefan', 'Rosenheimerstrasse 5, 81667 Muenchen', 'm', 1, '1985-01-12');
INSERT INTO customer VALUES (2, 'John', 'Smith', 'Park Street 771, 10001 New York', 'm', 2, '1990-09-25');
INSERT INTO customer VALUES (3, 'Michael', 'Williams', 'Royal Treasure 2, SW1A 2HQ', 'm', 3, '1954-11-01');
INSERT INTO customer VALUES (4, 'Yui', 'Ishiguro', 'Higashi-Shiokoji 721-1, Shimogyo-ku, Kyoto, Kyoto 600-8216', 'f', 4, '1999-03-18');
INSERT INTO customer VALUES (5, 'Mia', 'Mueller', 'Alpenstrasse 23, 3006 Bern', 'f', 5, '2001-07-16');
COMMIT;

INSERT INTO flight_segment VALUES (1, 1, 3, '2014-05-30 10:23:54+02', '2014-05-30 10:23:54+02','2014-06-30 10:23:54+02','2014-06-30 10:23:54+02',5,'ABC');
INSERT INTO flight_segment VALUES (2, 2, 5, '2014-05-30 10:23:54+02', '2014-05-30 10:23:54+02','2014-06-30 10:23:54+02','2014-06-30 10:23:54+02',8,'UWH');
INSERT INTO flight_segment VALUES (3, 3, 4, '2014-05-30 10:23:54+02', '2014-05-30 10:23:54+02','2014-06-30 10:23:54+02','2014-06-30 10:23:54+02',2,'FSQ');
INSERT INTO flight_segment VALUES (4, 5, 1, '2014-05-30 10:23:54+02', '2014-05-30 10:23:54+02','2014-06-30 10:23:54+02','2014-06-30 10:23:54+02',4,'KFW');
INSERT INTO flight_segment VALUES (5, 4, 2, '2014-05-30 10:23:54+02', '2014-05-30 10:23:54+02','2014-06-30 10:23:54+02','2014-06-30 10:23:54+02',12,'GWX');
COMMIT;

INSERT INTO flight VALUES (1, 1, 1, 1, 2, '2014-05-30 10:23:54', '2014-05-30 10:24:54');
INSERT INTO flight VALUES (2, 2, 2, 2, 3, '2014-06-11 10:23:54', '2014-06-12 10:24:54');
INSERT INTO flight VALUES (3, 3, 3, 3, 5, '2014-06-20 10:23:54', '2014-06-22 10:24:54');
INSERT INTO flight VALUES (4, 4, 4, 4, 5, '2014-06-21 10:23:54', '2014-06-22 10:24:54');
INSERT INTO flight VALUES (5, 5, 5, 5, 3, '2014-08-01 10:23:54', '2014-08-02 10:24:54');
COMMIT;

INSERT INTO luggage VALUES (1, 1,23.2,'1');
INSERT INTO luggage VALUES (2, 2,12.5,'2');
INSERT INTO luggage VALUES (3, 3,23.9,'3');
INSERT INTO luggage VALUES (4, 4,7.8,'4');
INSERT INTO luggage VALUES (5, 5,35.3,'5');
COMMIT;

INSERT INTO flight_consists_of_flight_segments VALUES (1, 1);
INSERT INTO flight_consists_of_flight_segments VALUES (2, 2);
INSERT INTO flight_consists_of_flight_segments VALUES (3, 3);
INSERT INTO flight_consists_of_flight_segments VALUES (4, 4);
INSERT INTO flight_consists_of_flight_segments VALUES (5, 5);
COMMIT;

INSERT INTO airline_company VALUES (1, 'Lufthansa', 1, 'LH',1);
INSERT INTO airline_company  VALUES (2, 'Air Berlin', 2, 'AB',2);
INSERT INTO airline_company  VALUES (3, 'Germanwings', 3, '4U',3);
INSERT INTO airline_company  VALUES (4, 'Condor', 4, 'DE',4);
INSERT INTO airline_company  VALUES (5, 'TUIfly', 5, 'X3',5);
COMMIT;

INSERT INTO checkin_counter VALUES (1, 1, 1,'A32');
INSERT INTO checkin_counter VALUES (2, 2, 2,'B24');
INSERT INTO checkin_counter VALUES (3, 3, 3,'A45');
INSERT INTO checkin_counter VALUES (4, 4, 4,'D42');
INSERT INTO checkin_counter VALUES (5, 5, 5,'F14');
COMMIT;

INSERT INTO flight_segment_by_airline VALUES (1, 1);
INSERT INTO flight_segment_by_airline VALUES (2, 2);
INSERT INTO flight_segment_by_airline VALUES (3, 3);
INSERT INTO flight_segment_by_airline VALUES (4, 4);
INSERT INTO flight_segment_by_airline VALUES (5, 5);
COMMIT;

INSERT INTO collect_luggage VALUES (1, 1, '2014-05-30');
INSERT INTO collect_luggage VALUES (2, 2, '2014-06-11');
INSERT INTO collect_luggage VALUES (3, 3, '2014-06-20');
INSERT INTO collect_luggage VALUES (4, 4, '2014-06-21');
INSERT INTO collect_luggage VALUES (5, 5, '2014-07-28');
COMMIT;

INSERT INTO direct_flight_booking VALUES (1, 1, 1, '2014-01-01', 150);
INSERT INTO direct_flight_booking VALUES (2, 2, 2, '2013-12-24', 40);
INSERT INTO direct_flight_booking VALUES (3, 3, 3, '2014-05-15', 100);
INSERT INTO direct_flight_booking VALUES (4, 4, 4, '2014-02-27', 200);
INSERT INTO direct_flight_booking VALUES (5, 5, 5, '2014-04-23', 170);
COMMIT;

INSERT INTO customer_carries_luggage VALUES (1, 1, '2014-05-30');
INSERT INTO customer_carries_luggage VALUES (2, 2, '2014-06-11');
INSERT INTO customer_carries_luggage VALUES (3, 3, '2014-06-20');
INSERT INTO customer_carries_luggage VALUES (4, 4, '2014-06-21');
INSERT INTO customer_carries_luggage VALUES (5, 5, '2014-07-28');
COMMIT;

INSERT INTO indirect_flight_booking VALUES (1, 1, 1, 1, '2014-01-10', 123);
INSERT INTO indirect_flight_booking VALUES (2, 2, 2, 2, '2014-03-25', 220);
INSERT INTO indirect_flight_booking VALUES (3, 3, 2, 1, '2013-12-22', 25);
INSERT INTO indirect_flight_booking VALUES (4, 3, 2, 1, '2014-04-20', 300);
INSERT INTO indirect_flight_booking VALUES (5, 4, 3, 2, '2014-05-11', 100);
COMMIT;

INSERT INTO boarding_pass VALUES (1, 100, 1, 1, 'normal', 'business', 1, 1, 5, 100);
INSERT INTO boarding_pass VALUES (2, 75, 2, 3, 'vegetarian', 'economic', 2, 2, 1, 22);
INSERT INTO boarding_pass VALUES  (3, 50, 3, 4, 'normal', 'first class', 3, 3, 2, 50);
INSERT INTO boarding_pass VALUES  (4, 122, 4, 5, 'normal', 'economic', 4, 4, 3, 10);
INSERT INTO boarding_pass VALUES  (5, 200, 5, 2, 'vegetarian', 'economic', 5, 5, 1, 25);
COMMIT;

INSERT INTO admission_doc (doctype, description) VALUES ('Certificate_Big_Two_Floor', 'This is a certificate for Class A pilot');
INSERT INTO admission_doc (doctype, description) VALUES ('Certificate_Small_Aircraf', 'This is a certificate for Class B pilot');
INSERT INTO admission_doc (doctype, description) VALUES ('Certificate_Small_Jet', 'Class B2');
INSERT INTO admission_doc (doctype, description) VALUES ('Certificate_Medium_Airpla', 'Class A2');
INSERT INTO admission_doc (doctype, description) VALUES ('Certificate_Big_Jet', '');
COMMIT;

INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF1', 'TestL1', 'm', 'German', '1965-05-09', '788464-6464', 1);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF2', 'TestL2', 'f', 'Dutch', '1970-03-09', '747747-323', 2);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF3', 'TestL3', 'm', 'German', '1970-03-11', '123-4444', 3);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF4', 'TestL4', 'f', 'American', '1975-05-13', '02777-556', 4);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF5', 'TestL5', 'm', 'German', '1975-03-10', '8852-5881', 5);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF6', 'TestL6', 'm', 'German', '1988-03-09', '5688-5881', 5);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF7', 'TestL7', 'f', 'German', '1979-03-20', '5677-5881', 5);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF8', 'TestL8', 'm', 'German', '1976-03-09', '8025-58811', 5);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF9', 'TestL9', 'm', 'American', '1970-03-17', '118852-5881', 5);
INSERT INTO personnel (pfname, plname, gender, nationality, birth_date, phone, address_key) VALUES ('TestF10','TestL10', 'f', 'German', '1970-03-10', '855552-5881', 5);
COMMIT;

INSERT INTO empl_off_board VALUES ('Security', 1, 1);
INSERT INTO empl_off_board VALUES ('Maintanance', 3, 2);
INSERT INTO empl_off_board VALUES ('Security', 5, 2);
INSERT INTO empl_off_board VALUES ('Maintanance', 7, 3);
INSERT INTO empl_off_board VALUES ('Check in', 9, 3);
COMMIT;

INSERT INTO empl_on_board VALUES (2, 'Pilot');
INSERT INTO empl_on_board VALUES (4, 'Flight_Attendan');
INSERT INTO empl_on_board VALUES (6, 'Pilot');
INSERT INTO empl_on_board VALUES (8, 'Pilot');
INSERT INTO empl_on_board VALUES (10, 'Flight_Attendan');
COMMIT;

INSERT INTO airlinecompany_personnel VALUES (1, 1, 2000);
INSERT INTO airlinecompany_personnel VALUES (2, 2, 2500);
INSERT INTO airlinecompany_personnel VALUES (3, 3, 5000);
INSERT INTO airlinecompany_personnel VALUES (4, 4, 4000);
INSERT INTO airlinecompany_personnel VALUES (5, 5, 5000);
COMMIT;

INSERT INTO crew (num_of_req_pilots, num_of_req_flight_att) VALUES (2, 3);
INSERT INTO crew (num_of_req_pilots, num_of_req_flight_att) VALUES (2, 3);
INSERT INTO crew (num_of_req_pilots, num_of_req_flight_att) VALUES (3, 3);
INSERT INTO crew (num_of_req_pilots, num_of_req_flight_att) VALUES (4, 6);
INSERT INTO crew (num_of_req_pilots, num_of_req_flight_att) VALUES (3, 5);
COMMIT;

INSERT INTO airplane_type (tname, nseats_bclass, nseats_fclass, nseats_eclass, tank_capacity, crew_key, admission_doc_key) VALUES ('Airbus 647', 20, 30, 100, 1000, 1, 1);
INSERT INTO airplane_type (tname, nseats_bclass, nseats_fclass, nseats_eclass, tank_capacity, crew_key, admission_doc_key) VALUES ('Airbus 300', 25, 20, 800, 8000, 2, 2);
INSERT INTO airplane_type (tname, nseats_bclass, nseats_fclass, nseats_eclass, tank_capacity, crew_key, admission_doc_key) VALUES ('Airbus 205', 20, 50, 100, 1500, 3, 3);
INSERT INTO airplane_type (tname, nseats_bclass, nseats_fclass, nseats_eclass, tank_capacity, crew_key, admission_doc_key) VALUES ('Boeing 701', 90, 50, 200, 2000, 4, 4);
INSERT INTO airplane_type (tname, nseats_bclass, nseats_fclass, nseats_eclass, tank_capacity, crew_key, admission_doc_key) VALUES ('Boeing 650', 70, 30, 150, 2500, 5, 5);
COMMIT;

INSERT INTO airplane VALUES (1, '2005-08-01', 1, '2005-08-01', 1);
INSERT INTO airplane VALUES (2, '1999-04-27', 2, '2003-08-01', 1);
INSERT INTO airplane VALUES (3, '2014-07-11', 3, '2006-04-01', 1);
INSERT INTO airplane VALUES (4, '2008-08-16', 4, '2004-02-01', 2);
INSERT INTO airplane VALUES (5, '2001-04-23', 5, '2007-08-01', 2);
COMMIT;

INSERT INTO crew_employeeonboard VALUES (1, 2);
INSERT INTO crew_employeeonboard VALUES (2, 4);
INSERT INTO crew_employeeonboard VALUES (3, 6);
INSERT INTO crew_employeeonboard VALUES (4, 8);
INSERT INTO crew_employeeonboard VALUES (5, 10);
COMMIT;

INSERT INTO emplonboard_admissiondoc VALUES (2, 1);
INSERT INTO emplonboard_admissiondoc VALUES (4, 2);
INSERT INTO emplonboard_admissiondoc VALUES (6, 3);
INSERT INTO emplonboard_admissiondoc VALUES (8, 4);
INSERT INTO emplonboard_admissiondoc VALUES (10, 5);
COMMIT;

INSERT INTO flightsegment_airplanetype VALUES (1, 1);
INSERT INTO flightsegment_airplanetype VALUES (2, 2);
INSERT INTO flightsegment_airplanetype VALUES (3, 3);
INSERT INTO flightsegment_airplanetype VALUES (4, 4);
INSERT INTO flightsegment_airplanetype VALUES (5, 5);
COMMIT;

INSERT INTO flightsegment_crew_airplane VALUES (1, 1, 1, '2014-08-09', 'Toronto', 12);
INSERT INTO flightsegment_crew_airplane VALUES (2, 2, 2, '2014-08-09', 'Amsterdam',5);
INSERT INTO flightsegment_crew_airplane VALUES (3, 3, 3, '2014-08-09', 'Madrid', 5);
INSERT INTO flightsegment_crew_airplane VALUES (4, 4, 4, '2014-08-09', 'Berlin', 10);
INSERT INTO flightsegment_crew_airplane VALUES (5, 5, 5, '2014-08-09', 'London', 8);
COMMIT;

INSERT INTO technical_issue (type, description) VALUES ('Wing', 'Wing issue');
INSERT INTO technical_issue (type, description) VALUES ('Turbine Engine', 'Turbine engine issue');
INSERT INTO technical_issue (type, description) VALUES ('Fuselage', 'Fuselage issue');
INSERT INTO technical_issue (type, description) VALUES ('Spoiler', 'Spoiler issue');
INSERT INTO technical_issue (type, description) VALUES ('Rudder', 'Rudder issue');
COMMIT;

INSERT INTO technicalissue_airplane VALUES (1, 1, '2014-06-20');
INSERT INTO technicalissue_airplane VALUES (2, 2, '2013-12-23');
INSERT INTO technicalissue_airplane VALUES (3, 3, '2012-11-20');
INSERT INTO technicalissue_airplane VALUES (4, 4, '2011-03-20');
INSERT INTO technicalissue_airplane VALUES (5, 5, '2014-05-09');
COMMIT;

INSERT INTO logistics_take_care VALUES (1, 1,'2014-05-30');
INSERT INTO logistics_take_care VALUES (2, 2,'2014-03-11');
INSERT INTO logistics_take_care VALUES (3, 3,'2014-04-25');
INSERT INTO logistics_take_care VALUES (4, 4,'2014-01-10');
INSERT INTO logistics_take_care VALUES (5, 5,'2014-05-21');
COMMIT;

INSERT INTO area VALUES (1, 1, 1, 'Flower&More',1,'Flower Shop',10000,'Opposite to Gate 23',100);
INSERT INTO area VALUES (2, 2, 2, 'KFC',2,'Fast Food Shop',90000,'East Entrance',300);
INSERT INTO area VALUES (3, 3, 3, 'DM',3, 'Personal Care Store',85000,'West Entrance',500);
INSERT INTO area VALUES (4, 4, 4,'Lidl',4,'Supermarket',100000,'Opposite to Gate 3',500);
INSERT INTO area VALUES (5, 5, 5,'Apple',5, 'Electronics Store',70000,'Next to Customer Service',300);
COMMIT;



/*
INSERT INTO rented_by VALUES (1, 1, 1, '2011-03-30','2014-05-30');
INSERT INTO rented_by VALUES (2, 2, 2, '2010-01-30','2017-05-30');
INSERT INTO rented_by VALUES (3, 3, 3, '2013-12-30','2014-12-30');
INSERT INTO rented_by VALUES (4, 4, 4, '2014-10-30','2015-03-30');
INSERT INTO rented_by VALUES (5, 5, 5, '2012-09-30','2016-10-30');
COMMIT;
*/
INSERT INTO runway VALUES (1, 1, 'NS15');
INSERT INTO runway VALUES (2, 2, 'SE83');
INSERT INTO runway VALUES (3, 3, 'NW10');
INSERT INTO runway VALUES (4, 4, 'SE47');
INSERT INTO runway VALUES (5, 5, 'NS63');
COMMIT;

INSERT INTO flight_controller VALUES (1, 1,1);
INSERT INTO flight_controller VALUES (2, 2,2);
INSERT INTO flight_controller VALUES (3, 3,3);
INSERT INTO flight_controller VALUES (4, 4,4);
INSERT INTO flight_controller VALUES (5, 5,5);
COMMIT;

INSERT INTO logs VALUES (1, 1, 1, 1,2,3,'2014-05-30', '2014-05-30',1);
INSERT INTO logs VALUES (2, 2, 2, 2,3,5,'2014-06-11', '2014-06-12',2);
INSERT INTO logs VALUES (3, 3, 3, 3,2,5,'2014-06-21', '2014-06-22',3);
INSERT INTO logs VALUES (4, 4, 4, 4,3,2,'2014-06-20', '2014-06-22',4);
INSERT INTO logs VALUES (5, 5, 5, 5,5,3,'2014-08-01', '2014-08-02',5);
COMMIT;



/*
INSERT INTO catering_coordinates_by_flight VALUES (1, 1, 1, 1, 3, 10,'2014-05-30');
INSERT INTO catering_coordinates_by_flight VALUES (2, 2, 2, 2, 2, 2, '2014-06-12');
INSERT INTO catering_coordinates_by_flight VALUES (3, 3, 3, 3, 1, 3, '2014-06-22');
INSERT INTO catering_coordinates_by_flight VALUES (4, 4, 4, 4, 2, 7, '2014-06-22');
INSERT INTO catering_coordinates_by_flight VALUES (5, 5, 5, 5, 1, 1, '2014-08-02');
COMMIT;
*/
INSERT INTO parking_slot VALUES (1, 'E1', 1);
INSERT INTO parking_slot VALUES (2, 'W1', 2);
INSERT INTO parking_slot VALUES (3, 'S4', 3);
INSERT INTO parking_slot VALUES (4, 'W7', 4);
INSERT INTO parking_slot VALUES (5, 'N3', 5);
COMMIT;



/*
INSERT INTO tower_grants_clearance VALUES (1, 1, 1,'2014-05-30');
INSERT INTO tower_grants_clearance VALUES (2, 2, 2,'2014-06-12');
INSERT INTO tower_grants_clearance VALUES (3, 3, 3,'2014-06-22');
INSERT INTO tower_grants_clearance VALUES (4, 4, 4,'2014-06-22');
INSERT INTO tower_grants_clearance VALUES (5, 5, 5,'2014-08-02');
COMMIT;
*/
/*
INSERT INTO flight_assigned_runway_parking_slot VALUES(1,1,1,1,'2014-05-30');
INSERT INTO flight_assigned_runway_parking_slot VALUES(2,2,2,2,'2014-06-12');
INSERT INTO flight_assigned_runway_parking_slot VALUES(3,3,3,3,'2014-06-22');
INSERT INTO flight_assigned_runway_parking_slot VALUES(4,4,4,4,'2014-06-22');
INSERT INTO flight_assigned_runway_parking_slot VALUES(5,5,5,5,'2014-08-02');
COMMIT;
*/