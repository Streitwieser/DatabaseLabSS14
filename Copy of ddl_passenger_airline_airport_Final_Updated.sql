--Airline
drop table technicalissue_airplane;
drop table technical_issue;
drop table flightsegment_crew_airplane;
drop table flightsegment_airplanetype;
drop table emplonboard_admissiondoc;
drop table crew_employeeonboard;
drop table airlinecompany_personnel;
drop table empl_on_board;
drop table empl_off_board;
drop table personnel;
drop table admission_doc;
drop table address;
drop table crew;
drop table airplane_type;

--Passenger
drop table boarding_pass;
drop table indirect_flight_booking;
drop table direct_flight_booking;
drop table customer_carries_luggage;
drop table collect;
drop table flight_segment_by_airline;
drop table flight_consists_of_flight_segments;
drop table luggage;
drop table flight;
drop table flight_segment;
drop table checkin_counter;
drop table airplane_company;
drop table customer;
drop table airport;
drop table nation;
drop table airline;
drop table travel_agency;
drop table currency;

--Airport
drop table log;
drop table logistics_take_care;
drop table catering_coordinates_airplane;
drop table rented_by;
drop table logistics;
drop table tower_grants_clearance;
drop table area;
drop table parking_slot;
drop table tenant;
drop table catering;
drop table tower;
drop table flight_controller;
drop table runway;

DROP SEQUENCE boarding_pass_S ;
DROP SEQUENCE indirect_flight_booking_S ;
DROP SEQUENCE direct_flight_booking_S ;
DROP SEQUENCE luggage_S;
DROP SEQUENCE flight_S;
DROP SEQUENCE flight_segment_S;
DROP SEQUENCE checkin_counter_S ;
DROP SEQUENCE airplane_S;
DROP SEQUENCE customer_S ;
DROP SEQUENCE airport_S ;
DROP SEQUENCE nation_S ;
DROP SEQUENCE airline_S ;
DROP SEQUENCE travel_agency_S;
DROP SEQUENCE currency_S ;


--TABLES WITH NO DEPENDENCIES
CREATE TABLE currency
(
currency_key int NOT NULL PRIMARY KEY,
name varchar(255) not null,
abbreviation varchar(255)
)
;
CREATE TABLE travel_agency
(
travel_agency_key int NOT NULL PRIMARY KEY,
name varchar(255) not null,
address varchar(255)
)
;
CREATE TABLE address
(
  address_key serial NOT NULL,
  line1 character(30) NOT NULL,
  line2 character(30),
  city character(15) NOT NULL,
  postcode character(10) NOT NULL,
  CONSTRAINT address_pk PRIMARY KEY (address_key)
);



--TABLES WITH ONE DEPENDENCY
----CURRENCY----
CREATE TABLE nation
(
nation_key int NOT NULL PRIMARY KEY,
name varchar(50) not null,
abbreviation varchar(5),
currency_key int references currency(currency_key) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)
;

CREATE TABLE logistics
(
logistics_id int NOT NULL PRIMARY KEY,
logistics_name varchar(100) not null unique,
luggage_transport_facility boolean,
catering_facility boolean,
manage_runways_facility boolean,
allocate_parking_slots_facility boolean
);

----NATION----
CREATE TABLE airport
(
airport_key int NOT NULL PRIMARY KEY,
airport_name varchar(255) not null,
nation_key int  REFERENCES nation(nation_key) ON DELETE CASCADE,
logistics_factility int REFERENCES logistics(logistics_id) ON DELETE CASCADE,
airport_code varchar(3) unique not null,
address_key integer  REFERENCES address (address_key)
)
;
----NATION----
CREATE TABLE customer 
(
customer_key INT NOT NULL PRIMARY KEY,
last_name varchar(255) not null,
first_name varchar(255) not null,
Address varchar(255),
gender varchar(10),
nation_key int references nation(nation_key) ON DELETE CASCADE,
date_of_birth timestamp
)

;
----AIRPORT----
CREATE TABLE flight_segment
(
flight_segment_key int NOT NULL PRIMARY KEY,
arrival_airport varchar(50) NOT NULL,
departure_airport varchar(50) NOT NULL,
arrival_date timestamp WITH TIME ZONE not null,
arrival_time timestamp WITH TIME ZONE not null,
departure_date timestamp WITH TIME ZONE not null,
departure_time timestamp WITH TIME ZONE not null,
length integer not null,
can_be_booked_in_travelag character(3) not null,
CHECK (arrival_airport != departure_airport),
CHECK(arrival_date < departure_date)
)
;
CREATE TABLE flight
(
flight_key int NOT NULL PRIMARY KEY,
start_airport int REFERENCES airport(airport_key) ON DELETE CASCADE,
end_airport int REFERENCES airport(airport_key) ON DELETE CASCADE,
start_date timestamp not null,
end_date timestamp not null
CHECK (start_airport != end_airport),
CHECK(start_date < end_date)
)
;

----CUSTOMER----
CREATE TABLE luggage 
(
luggage_key int not null primary key,
customer_key  int references customer(customer_key) ON DELETE CASCADE,
luggage_weight_kgs numeric,
luggage_responsibility varchar(255) not null
)
;

--TABLES WITH TWO DEPENDENCIES
----FLIGHT & FLIGHT_SEGMENT----
CREATE TABLE flight_consists_of_flight_segments
(
flight_key  int   references flight(flight_key) ON DELETE CASCADE,
flight_segment_key int  references flight_segment(flight_segment_key) ON DELETE CASCADE,
PRIMARY KEY(flight_key, flight_segment_key)
)
;

----ADDRESS & NATION----
CREATE TABLE airline_company
(
airline_key int NOT NULL PRIMARY KEY,
name varchar(255) not null,
address_key integer not null,
abbreviation character(10) not null,
nation_key int not null,
CONSTRAINT address_fk FOREIGN KEY (address_key)
      REFERENCES address (address_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT nation_fk FOREIGN KEY (nation_key)
      REFERENCES nation (nation_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
;
----AIRLINE_COMPANY----
CREATE TABLE checkin_counter 
(
checkin_counter_key int NOT NULL PRIMARY KEY,
airline_key int references airline_company(airline_key) ON DELETE CASCADE,
counter_number int not null,
gate_number varchar(10)
)
;


----FLIGHT_SEGMENT & AIRLINE----
CREATE TABLE flight_segment_by_airline
(
airline_key int references airline_company(airline_key) ON DELETE CASCADE,
flight_segment_key int references flight_segment(flight_segment_key) ON DELETE CASCADE,
PRIMARY KEY(airline_key, flight_segment_key)
)
;

----CHECKIN_COUNTER & LUGGAGE----
CREATE TABLE collect
(
luggage_key int references luggage(luggage_key) ON DELETE CASCADE,
checkin_counter_key int references checkin_counter(checkin_counter_key) ON DELETE CASCADE,
collect_date timestamp,
flight_key  int references flight(flight_key) ON DELETE CASCADE,
PRIMARY KEY(luggage_key, checkin_counter_key)
)
;
----CUSTOMER & FLIGHT----
CREATE TABLE direct_flight_booking
(
booking_id int not null primary key,
customer_key int references customer(customer_key) ON DELETE CASCADE,
flight_key int references flight(flight_key) ON DELETE CASCADE,
date timestamp not null,
price numeric not null,
CHECK (price >= 0)
)
;
----CUSTOMER & LUGGAGE----
CREATE TABLE customer_carries_luggage
(
customer_key int references customer(customer_key) ON DELETE CASCADE,
luggage_key int references luggage(luggage_key) ON DELETE CASCADE,
date timestamp not null unique,
PRIMARY KEY(customer_key, luggage_key, date)
)
;

--TABLES WITH THREE DEPENDENCIES
----CUSTOMER & FLIGHT & TRAVEL_AGENCY----
CREATE TABLE indirect_flight_booking
(
booking_id int not null primary key,
travel_agency_key  int references travel_agency(travel_agency_key) ON DELETE CASCADE,
flight_key  int references flight(flight_key) ON DELETE CASCADE,
customer_key  int references customer(customer_key) ON DELETE CASCADE,
date timestamp not null,
price numeric not null,
CHECK (price >= 0)
)
;

--TABLES WITH FOUR DEPENDENCIES
----CURRENCY & FLIGHT_SEGMENT & CUSTOMER & LUGGAGE----
CREATE TABLE boarding_pass
(
boarding_pass_key int NOT NULL PRIMARY KEY,
price numeric not null,
currency_key int references currency(currency_key) ON DELETE CASCADE,
flight_segment_key int references flight_segment(flight_segment_key) ON DELETE CASCADE,
ordered_food varchar(255),
class_of_seat varchar(255),
customer_key int references customer(customer_key) ON DELETE CASCADE,
luggage_key int references luggage(luggage_key) ON DELETE CASCADE,
gate_number int not null,
seat_number int not null,
CHECK (price >= 0)
)
;

--creating sequences for easily filling primary keys
--HOW TO USE:
----SEQUENCE tablename_S is a sequence for table with tablename
----get the next value: SELECT nextval('tablename_S');
----for inserts: INSERT INTO tablename VALUES(nextval('tablename_S'), 'other');
CREATE SEQUENCE boarding_pass_S START 1;
CREATE SEQUENCE indirect_flight_booking_S START 1;
CREATE SEQUENCE direct_flight_booking_S START 1;
CREATE SEQUENCE luggage_S START 1;
CREATE SEQUENCE flight_S START 1;
CREATE SEQUENCE flight_segment_S START 1;
CREATE SEQUENCE checkin_counter_S START 1;
CREATE SEQUENCE airplane_S START 1;
CREATE SEQUENCE customer_S START 1;
CREATE SEQUENCE airport_S START 1;
CREATE SEQUENCE nation_S START 1;
CREATE SEQUENCE airline_S START 1;
CREATE SEQUENCE travel_agency_S START 1;
CREATE SEQUENCE currency_S START 1;



---------------------------------------------------------
---------------------------------------------------------
------------------AIRLINE--------------------------------
---------------------------------------------------------
---------------------------------------------------------



-- Table: admission_doc
CREATE TABLE admission_doc
(
  admission_doc_key serial NOT NULL PRIMARY KEY,
  doctype character(25) NOT NULL,
  description text
);

-- Table: personnel
CREATE TABLE personnel
(
  personnel_key serial NOT NULL,
  pfname character(20) NOT NULL,
  plname character(20) NOT NULL,
  gender character(6),
  nationality character(25) NOT NULL,
  birth_date date NOT NULL,
  phone character(15) NOT NULL,
  address_key integer NOT NULL,
  CONSTRAINT personnel_pk PRIMARY KEY (personnel_key),
  CONSTRAINT address_fk FOREIGN KEY (address_key)
      REFERENCES address (address_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
  );

-- Table: empl_off_board
CREATE TABLE empl_off_board
(
  allocated_airport character(10) NOT NULL,
  prof character(15) NOT NULL,
  personnel_key integer NOT NULL,
  CONSTRAINT emploff_key PRIMARY KEY (personnel_key),
  CONSTRAINT personnel_emploff_fk FOREIGN KEY (personnel_key)
      REFERENCES personnel (personnel_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: empl_on_board
CREATE TABLE empl_on_board
(
  personnel_key integer NOT NULL,
  prof character(15) NOT NULL,
  CONSTRAINT emplon_key PRIMARY KEY (personnel_key),
  CONSTRAINT personnel_emploff_fk FOREIGN KEY (personnel_key)
      REFERENCES personnel (personnel_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: airlinecompany_personnel
CREATE TABLE airlinecompany_personnel
(
  airline_key integer NOT NULL,
  personnel_key integer NOT NULL,
  salary integer NOT NULL,
  CONSTRAINT airc_personnel_pk PRIMARY KEY (airline_key, personnel_key),
  CONSTRAINT airc_fk FOREIGN KEY (airline_key)
      REFERENCES airline_company (airline_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT personnel_fk FOREIGN KEY (personnel_key)
      REFERENCES personnel (personnel_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: crew
CREATE TABLE crew
(
  crew_key serial NOT NULL,
  num_of_req_pilots integer NOT NULL,
  num_of_req_flight_att integer NOT NULL,
  CONSTRAINT crew_pk PRIMARY KEY (crew_key)
);

-- Table: airplane_type
CREATE TABLE airplane_type
(
  type_key serial NOT NULL,
  tname character varying(25) NOT NULL,
  nseats_bclass integer,
  nseats_fclass integer,
  nseats_eclass integer,
  tank_capacity numeric(10,2) NOT NULL,
  crew_key integer NOT NULL,
  admission_doc_key integer NOT NULL,
  CONSTRAINT airplane_type_pk PRIMARY KEY (type_key),
  CONSTRAINT airplane_type_fk1 FOREIGN KEY (crew_key)
      REFERENCES crew (crew_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT airplane_type_fk2 FOREIGN KEY (admission_doc_key)
      REFERENCES admission_doc (admission_doc_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


----AIRLINE & AIRPLANE_TYPE----
CREATE TABLE airplane
(
airplane_key int NOT NULL PRIMARY KEY,
purchase_year timestamp,
airline_key int references airline_company(airline_key)MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
manuf_year date NOT NULL,
type_key integer NOT NULL,
CONSTRAINT type_fk FOREIGN KEY (type_key)
      REFERENCES airplane_type (type_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
;

-- Table: crew_employeeonboard
CREATE TABLE crew_employeeonboard
(
  crew_key integer NOT NULL,
  personnel_key integer NOT NULL,
  CONSTRAINT empl_crew_pk PRIMARY KEY (personnel_key, crew_key),
  CONSTRAINT crew_fk FOREIGN KEY (crew_key)
      REFERENCES crew (crew_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empl_fk FOREIGN KEY (personnel_key)
      REFERENCES empl_on_board (personnel_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: emplonboard_admissiondoc
CREATE TABLE emplonboard_admissiondoc
(
  personnel_key integer NOT NULL,
  admission_doc_key integer NOT NULL,
  CONSTRAINT empl_admdoc_pk PRIMARY KEY (personnel_key, admission_doc_key),
  CONSTRAINT admdoc_fk FOREIGN KEY (admission_doc_key)
      REFERENCES admission_doc (admission_doc_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empl_admdoc_fk FOREIGN KEY (personnel_key)
      REFERENCES empl_on_board (personnel_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: flightsegment_airplanetype
CREATE TABLE flightsegment_airplanetype
(
  flight_segment_key integer NOT NULL,
  type_key integer NOT NULL,
  CONSTRAINT segment_type_pk PRIMARY KEY (flight_segment_key, type_key),
  CONSTRAINT segment_fk FOREIGN KEY (flight_segment_key)
      REFERENCES flight_segment (flight_segment_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT type_fk FOREIGN KEY (type_key)
      REFERENCES airplane_type (type_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: flightsegment_crew_airplane
CREATE TABLE flightsegment_crew_airplane
(
  flight_segment_key integer NOT NULL,
  crew_key integer NOT NULL,
  airplane_key int NOT NULL,
  flight_date date NOT NULL,
  place_of_work character(20) NOT NULL,
  workhours integer NOT NULL,
  CONSTRAINT segment_crew_airplane_pk PRIMARY KEY (flight_segment_key, crew_key, airplane_key),
  CONSTRAINT airplane_fk FOREIGN KEY (airplane_key)
      REFERENCES airplane (airplane_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT crew_fk FOREIGN KEY (crew_key)
      REFERENCES crew (crew_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT segm_fk FOREIGN KEY (flight_segment_key)
      REFERENCES flight_segment (flight_segment_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: technical_issue
CREATE TABLE technical_issue
(
  tissue_key serial NOT NULL,
  type character(25) NOT NULL,
  description text,
  CONSTRAINT tissue_pk PRIMARY KEY (tissue_key)
);

-- Table: technicalissue_airplane
CREATE TABLE technicalissue_airplane
(
  tissue_key integer NOT NULL,
  airplane_key int NOT NULL,
  tdate date NOT NULL,
  CONSTRAINT tissue_airplane_pk PRIMARY KEY (tissue_key, airplane_key),
  CONSTRAINT airpl_fk FOREIGN KEY (airplane_key)
      REFERENCES airplane (airplane_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tissue_fk FOREIGN KEY (tissue_key)
      REFERENCES technical_issue (tissue_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


---------------------------------------------------------
---------------------------------------------------------
------------------AIRPORT--------------------------------
---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE logistics_take_care
(
logistics_take_care_id varchar(10) NOT NULL PRIMARY KEY,
logistics_id  int references logistics(logistics_id) ON DELETE CASCADE,
airport_key  int references airport(airport_key) ON DELETE CASCADE,
date timestamp not null
)
;

CREATE TABLE area
(
area_id int NOT NULL PRIMARY KEY,
airport_id  int references airport(airport_key) ON DELETE CASCADE,
area_name varchar(100) not null,
area_number numeric not null unique,
area_assignment varchar(100) not null,
area_rent numeric,
location varchar(100),
square_meters numeric
);

CREATE TABLE tenant
(
tenant_id int NOT NULL PRIMARY KEY,
tenant_name varchar(100) not null,
tenant_address varchar(100) null,
tenant_bank_account INTEGER,
tenant_email VARCHAR(100)
);

CREATE TABLE rented_by
(
rented_by_id varchar(10) NOT NULL PRIMARY KEY,
area_id  int references area(area_id) ON DELETE CASCADE,
tenant_id  int references tenant(tenant_id) ON DELETE CASCADE,
rent_start_date timestamp not null,
rent_end_date timestamp not null,
CHECK (rent_end_date > current_date)
)
;

CREATE TABLE runway
(
runway_id int NOT NULL PRIMARY KEY,
airport_id  int references airport(airport_key) ON DELETE CASCADE,
runway_name varchar(100) not null unique
);

CREATE TABLE flight_controller
(
flight_controller_id int NOT NULL PRIMARY KEY,
runway_id  int references runway(runway_id) ON DELETE CASCADE,
airport_key  int references airport(airport_key) ON DELETE CASCADE
);


CREATE TABLE log
(
log_id int NOT NULL PRIMARY KEY,
runway_id  int references runway(runway_id) ON DELETE CASCADE,
flight_contoller_id  int references flight_controller(flight_controller_id) ON DELETE CASCADE,
flight_key  int references flight(flight_key) ON DELETE CASCADE,
start_airport int references airport(airport_key) ON DELETE CASCADE,
end_airport int references airport(airport_key) ON DELETE CASCADE,
state_date timestamp,
end_date timestamp,
managed_by int references airport(airport_key) ON DELETE CASCADE
);

CREATE TABLE catering
(
catering_id int NOT NULL PRIMARY KEY,
catering_type  varchar(100),
drinks_delivered varchar(100)
);

CREATE TABLE catering_coordinates_by_flight
(
catering_coordinates_flight_id int NOT NULL PRIMARY KEY,
flight_id  int references flight(flight_key) ON DELETE CASCADE,
catering_id  int references catering(catering_id) ON DELETE CASCADE,
flight_segment_id int references flight_segment(flight_segment_key) ON DELETE CASCADE,
responsible_airport int references airport(airport_key) ON DELETE CASCADE,
number_of_meals int,
journey_date timestamp
);


CREATE TABLE parking_slot
(
parking_slot_id int NOT NULL PRIMARY KEY,
parking_slot_name  varchar(100)
);

CREATE TABLE tower
(
tower_id int NOT NULL PRIMARY KEY,
tower_name  varchar(100)
);

CREATE TABLE tower_grants_clearance
(
tower_grants_clearance_id int NOT NULL PRIMARY KEY,
tower_grants_clearnace_airplane  int references airplane(airplane_key) ON DELETE CASCADE,
tower_id int references tower(tower_id) ON DELETE CASCADE,
tower_date timestamp
);
CREATE TABLE flight_assigned_runway_parking_slot
(
flight_assigned_parking_slot_id int NOT NULL PRIMARY KEY,
flight_key  int references flight(flight_key) ON DELETE CASCADE,
parking_slot_id int references parking_slot(parking_slot_id) ON DELETE CASCADE,
runway_id int references runway(runway_id)  ON DELETE CASCADE,
time_details timestamp
);
CREATE SEQUENCE logistics_S START 1;
CREATE SEQUENCE logistics_take_care_S START 1;
CREATE SEQUENCE area_S START 1;
CREATE SEQUENCE tenant_S START 1;
CREATE SEQUENCE rented_by_S START 1;
CREATE SEQUENCE runway_S START 1;
CREATE SEQUENCE flight_controller_S START 1;
CREATE SEQUENCE log_S START 1;
CREATE SEQUENCE catering_S START 1;
CREATE SEQUENCE catering_coordinates_by_flight_S START 1;
CREATE SEQUENCE parking_slot_S START 1;
CREATE SEQUENCE tower_S START 1;
CREATE SEQUENCE tower_grants_clearance_S START 1;
CREATE SEQUENCE flight_assigned_runway_parking_slot_S START 1;