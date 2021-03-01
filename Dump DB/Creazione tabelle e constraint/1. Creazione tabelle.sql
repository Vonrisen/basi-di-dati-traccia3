-- Creazione sequenze

CREATE SEQUENCE shop_sequence;
CREATE SEQUENCE meal_sequence;
CREATE SEQUENCE customer_order_sequence;
CREATE SEQUENCE customer_sequence;

-- Creazione tabella "Customer"

CREATE TABLE customer (

    id CHAR(8) PRIMARY KEY DEFAULT to_char(nextval('customer_sequence'),'00000000FM'),
	cf CHAR(16),
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

-- Creazione tabella "Shop"

 CREATE TABLE shop (
	
	id CHAR(3) PRIMARY KEY DEFAULT to_char(nextval('shop_sequence'),'000FM'),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL UNIQUE,
	working_hours CHAR(11) NOT NULL DEFAULT '00:00-24:00',
	closing_days VARCHAR(62),
	password VARCHAR(32) NOT NULL,
	email VARCHAR(320) NOT NULL UNIQUE,
   	home_phone VARCHAR(12) NOT NULL UNIQUE
	
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
	working_hours CHAR(11) NOT NULL DEFAULT '00:00-24:00', 
	deliveries_number SMALLINT NOT NULL DEFAULT 0,
	
	shop_id CHAR(3),
	FOREIGN KEY (shop_id) REFERENCES shop(id) ON DELETE CASCADE

);

-- Creazione tabella "Meal"

CREATE TABLE meal ( 

	id CHAR (4) PRIMARY KEY DEFAULT to_char(nextval('meal_sequence'),'0000FM'),
	category VARCHAR(32) NOT NULL,
	name VARCHAR (50) NOT NULL UNIQUE, 
	price REAL NOT NULL, 
	ingredients VARCHAR(255)
	
);

-- Creazione tabella "CustomerOrder"

CREATE TABLE customerorder (

	id CHAR(12) PRIMARY KEY DEFAULT to_char(nextval('customer_order_sequence'),'000000000000FM'),
	date TIMESTAMP NOT NULL DEFAULT current_timestamp,
	delivery_time TIME,
	address VARCHAR(255) NOT NULL,
	status VARCHAR(20) NOT NULL DEFAULT 'In attesa',
	payment VARCHAR(32) NOT NULL,
	note VARCHAR(255),
	
	rider_cf CHAR(16),
	shop_id CHAR(3),
	customer_id CHAR(8),
	
	FOREIGN KEY(rider_cf) REFERENCES Rider(cf) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(shop_id) REFERENCES Shop(id) ON DELETE SET NULL, 
	FOREIGN KEY(customer_id) REFERENCES Customer(id) ON DELETE SET NULL
	
);

-- Creazione tabella "Allergen"

CREATE TABLE allergen (

	name VARCHAR(32) PRIMARY KEY

);

-- Creazione tabella "OrderComposition"

CREATE TABLE ordercomposition (

	order_id CHAR(12),
	meal_id CHAR(4),
	quantity SMALLINT NOT NULL,

	PRIMARY KEY(order_id, meal_id),
	FOREIGN KEY (order_id) REFERENCES CustomerOrder(id) ON DELETE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE SET NULL
	
);

-- Creazione tabella "MealComposition"

CREATE TABLE mealcomposition ( 

	meal_id CHAR(4), 
	allergen_name VARCHAR(32), 

	PRIMARY KEY(meal_id,allergen_name), 
	FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE CASCADE,
	FOREIGN KEY (allergen_name) REFERENCES Allergen(name) ON DELETE CASCADE ON UPDATE CASCADE
	
);

-- Creazione tabella "Supply"

CREATE TABLE Supply (

	shop_id char(3),
	meal_id char(4),
	PRIMARY KEY (shop_id,meal_id),
	FOREIGN KEY (shop_id) REFERENCES Shop(id) ON DELETE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE CASCADE

);