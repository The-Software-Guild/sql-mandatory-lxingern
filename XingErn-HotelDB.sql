DROP DATABASE IF EXISTS hotel_reservations;
CREATE DATABASE hotel_reservations;
USE hotel_reservations;

CREATE TABLE room_types (
	id TINYINT PRIMARY KEY,
    type_name VARCHAR(25) NOT NULL,
    standard_occupancy TINYINT NOT NULL,
    max_occupancy TINYINT NOT NULL,
    price_per_night DECIMAL(6,2)  NOT NULL,
    price_per_extra_pax DECIMAL(6,2) 
);

CREATE TABLE guests (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    state CHAR(2),
    zip VARCHAR(5),
    phone CHAR(14) NOT NULL
);

CREATE TABLE rooms (
	room_no SMALLINT PRIMARY KEY,
    type_id TINYINT NOT NULL,
    has_microwave TINYINT NOT NULL,
    has_jacuzzi TINYINT NOT NULL,
    has_refrigerator TINYINT NOT NULL,
    has_oven TINYINT NOT NULL,
    ada_accessible TINYINT NOT NULL,
    FOREIGN KEY (type_id)
		REFERENCES room_types(id)
);

CREATE TABLE reservations (
	id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_no SMALLINT NOT NULL,
    no_of_adults TINYINT NOT NULL,
    no_of_children TINYINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (guest_id)
		REFERENCES guests(id),
	FOREIGN KEY (room_no)
		REFERENCES rooms(room_no)
);
