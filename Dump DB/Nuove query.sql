CREATE SEQUENCE shop_sequence;
CREATE SEQUENCE meal_sequence;
CREATE SEQUENCE customerorder_sequence;

-- Creazione tabella "Customer"

CREATE TABLE customer (

	cf CHAR(16) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	birth_place VARCHAR(64) NOT NULL,
	gender CHAR(1) NOT NULL,
	cellphone CHAR(10) NOT NULL UNIQUE,
	
	email VARCHAR(320) NOT NULL UNIQUE,
	password VARCHAR(32) NOT NULL
	
);

-- Creazione tabella "Rider"

CREATE TABLE rider (

	cf CHAR(16) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	birth_place VARCHAR(64) NOT NULL,
	gender CHAR(1) NOT NULL,
	cellphone CHAR(10) NOT NULL UNIQUE,
	
	vehicle VARCHAR(18) NOT NULL, 
	working_hours CHAR(11) NOT NULL, 
	deliveries_number SMALLINT NOT NULL DEFAULT 0
	
	shop_id CHAR(3),
	FOREIGN KEY (shop_id) REFERENCES shop(id) ON DELETE CASCADE
	
);

-- Creazione tabella "Shop"

 CREATE TABLE shop (
	 
	id CHAR(3) PRIMARY KEY DEFAULT to_char(nextval('shop_sequence'),'000FM'),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL UNIQUE,
	working_hours CHAR(11) DEFAULT '00:00-24:00',
	closing_days VARCHAR(62),
	password VARCHAR(32) NOT NULL

);

-- Creazione tabella "Meal"

CREATE TABLE meal ( 

    id CHAR (6) PRIMARY KEY, 
	name VARCHAR (50) NOT NULL UNIQUE, 
	price REAL NOT NULL, 
	ingredients VARCHAR(255) NOT NULL
	
);

-- Creazione tabella "CustomerOrder"

CREATE TABLE customerorder (

	id CHAR(12) PRIMARY KEY DEFAULT to_char(nextval('customerorder_sequence'),'000000000000FM'),
	date TIMESTAMP NOT NULL DEFAULT current_timestamp,
	delivery_time TIME,
	address VARCHAR(255) NOT NULL,
	status VARCHAR(20) NOT NULL DEFAULT 'In attesa',
	payment VARCHAR(12) NOT NULL,
	note VARCHAR(255),
	
	rider_cf CHAR(16),
	shop_id CHAR(3),
	customer_cf CHAR(16),
	
	FOREIGN KEY(rider_cf) REFERENCES Rider(cf),
	FOREIGN KEY(shop_id) REFERENCES Shop(id),
	FOREIGN KEY(customer_cf) REFERENCES Customer(cf)
	
);

-- Creazione tabella "OrderComposition"

CREATE TABLE ordercomposition (

	order_id CHAR(12),
	meal_id CHAR(6),
	quantity SMALLINT NOT NULL,

	PRIMARY KEY(order_id, meal_id),
	FOREIGN KEY (order_id) REFERENCES CustomerOrder(id) ON DELETE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(id)
	
);

-- Creazione tabella "MealComposition"

CREATE TABLE mealcomposition ( 

	meal_id CHAR(6), 
	allergen_name VARCHAR(32), 

	PRIMARY KEY(meal_id,allergen_name), 
	FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE CASCADE,
	FOREIGN KEY (allergen_name) REFERENCES Allergen(name) ON DELETE CASCADE
	
);

-- Creazione tabella "Allergen"

CREATE TABLE allergen (

	name VARCHAR(32) PRIMARY KEY

);

