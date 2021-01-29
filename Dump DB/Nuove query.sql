CREATE SEQUENCE shop_sequence;
CREATE SEQUENCE meal_sequence;
CREATE SEQUENCE customerorder_sequence MAXVALUE 99999999999;
CREATE SEQUENCE letter START WITH 65 MINVALUE 65 MAXVALUE 90;

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

-- Creazione tabella "Shop"

 CREATE TABLE shop (
	
	id CHAR(3) PRIMARY KEY DEFAULT to_char(nextval('shop_sequence'),'000FM'),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL UNIQUE,
	working_hours CHAR(11) DEFAULT '00:00-24:00',
	closing_days VARCHAR(62),
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
	deliveries_number SMALLINT NOT NULL DEFAULT 0,
	
	shop_id CHAR(3),
	FOREIGN KEY (shop_id) REFERENCES shop(id) ON DELETE CASCADE
	--on delete set null
);

-- Creazione tabella "Meal"

CREATE TABLE meal ( 

	id CHAR (4) PRIMARY KEY DEFAULT to_char(nextval('meal_sequence'),'0000FM'),
	category VARCHAR(32) NOT NULL,
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
	FOREIGN KEY (meal_id) REFERENCES Meal(id)
	
);

-- Creazione tabella "MealComposition"

CREATE TABLE mealcomposition ( 

	meal_id CHAR(4), 
	allergen_name VARCHAR(32), 

	PRIMARY KEY(meal_id,allergen_name), 
	FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE CASCADE,
	FOREIGN KEY (allergen_name) REFERENCES Allergen(name) ON DELETE CASCADE
	
);

-- Creazione tabella "Supply"

CREATE TABLE Supply (

	shop_id char(3),
	meal_id char(4),
	PRIMARY KEY (shop_id,meal_id),
	FOREIGN KEY (shop_id) REFERENCES Shop(id) ON DELETE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE CASCADE

);




--Constraint address
ALTER TABLE Customer
ADD CONSTRAINT customer_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ ''A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[A-Za-z]+(, )[A-Z]{2}$' );

ALTER TABLE CustomerOrder
ADD CONSTRAINT customer_order_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ ''A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[A-Za-z]+(, )[A-Z]{2}$' );

ALTER TABLE Rider
ADD CONSTRAINT rider_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ ''A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[A-Za-z]+(, )[A-Z]{2}$' );

ALTER TABLE Shop
ADD CONSTRAINT shop_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ ''A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[A-Za-z]+(, )[A-Z]{2}$' );


--Constraint Email
ALTER TABLE Customer
ADD CONSTRAINT customer_email_check CHECK (email::text ~* '^[A-Za-z0-9._%-]+(@)[A-Za-z0-9.-]+[.][A-Za-z]+$'::text)