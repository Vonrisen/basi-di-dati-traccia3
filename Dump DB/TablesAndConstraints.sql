CREATE SEQUENCE shop_sequence;
CREATE SEQUENCE meal_sequence;
CREATE SEQUENCE customerorder_sequence MAXVALUE 99999999999;
CREATE SEQUENCE letter START WITH 65 MINVALUE 65 MAXVALUE 90;

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
	working_hours CHAR(11) DEFAULT '00:00-24:00',
	closing_days VARCHAR(62) DEFAULT '',
	email VARCHAR(320) NOT NULL UNIQUE,
	password VARCHAR(32) NOT NULL,
        cellphone CHAR(10) NOT NULL UNIQUE
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
	customer_id CHAR(8),
	
	FOREIGN KEY(rider_cf) REFERENCES Rider(cf),
	FOREIGN KEY(shop_id) REFERENCES Shop(id),
	FOREIGN KEY(customer_id) REFERENCES Customer(id)
	
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


--Constraint email customer
ALTER TABLE Customer
ADD CONSTRAINT customer_email_check CHECK (email ~* '^[A-Za-z0-9._%-]+(@)[A-Za-z0-9.-]+[.][A-Za-z]+$'::text);

ALTER TABLE Customer
ADD CONSTRAINT customer_cf_check CHECK (cf ~* '^[a-zA-Z]{6}[0-9]{2}[abcdehlmprstABCDEHLMPRST]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$')

--Constraint closing_days shop
ALTER TABLE Shop 
ADD CONSTRAINT shop_closing_days_check CHECK (closing_days ~* '^((lunedì|martedì|mercoledì|giovedì|venerdì|sabato|domenica)(, (?!$)|$))*$');

--Constraint working_hours shop
ALTER TABLE Shop
ADD CONSTRAINT shop_working_hours_check CHECK (working_hours ~* '^([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})(-)([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})$');

--Constraint email shop
ALTER TABLE Shop
ADD CONSTRAINT shop_email_check CHECK (email ~* '^[A-Za-z0-9._%-]+(@foodoverflow.it)$');

--Constraint working_hours rider
ALTER TABLE Rider 
ADD CONSTRAINT rider_working_hours_check CHECK (working_hours ~* '^([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})(-)([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})$');

--Constraint codice fiscale rider
ALTER TABLE Rider
ADD CONSTRAINT rider_cf_check CHECK (cf ~* '^[a-zA-Z]{6}[0-9]{2}[abcdehlmprstABCDEHLMPRST]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$')

--Constraint cellphone customer
ALTER TABLE Customer
ADD CONSTRAINT customer_cellphone_check CHECK (cellphone ~ '^[0-9]{10}$');

--Constraint cellphone rider
ALTER TABLE Rider
ADD CONSTRAINT rider_cellphone_check CHECK (cellphone ~ '^[0-9]{10}$');

--Constraint home_phone
ALTER TABLE Shop
ADD CONSTRAINT shop_home_phone_check CHECK (home_phone ~ '^(004191|010|011|0121|0122|0123|0124|0125|0131|0141|0142|0143|0144|015|0161|0163|0165|0166|0171|0172|0173|0174|0175|0182|0183|0184|0185|0187|019|02|030|031|0321|0322|0323|0324|0331|0332|0341|0342|0343|
0344|0345|0346|035|0362|0363|0364|0365|0371|0372|0373|0374|0375|0376|0377|0381|0382|0383|0384|0385|0386|039|040|041|0421|0422|0423|0424|0425|0426|0427|0428|0429|0431|0432|0433|0434|0435|0436|0437|0438|
0439|0442|0444|0445|045|0461|0462|0463|0464|0465|0471|0472|0473|0474|0481|049|050|051|0521|0522|0523|0524|0525|0532|0533|0534|0535|0536|0541|0542|0543|0544|0545|0546|0547|0549|055 0564|0565|0566|0571|
0572|0573|0574|0575|0577|0578|0583|0584|0585|0586|0587|0588|059 06|0623|070 071|0721|0722|0731|0732|0733|0734|0735|0736|0737|0742|0743|0744|0746|075|0761|0763|0765|0766|0771|0773|0774|0775|0776|0781|
0782|0783|0784|0785|0789|079|080|081|0823|0824|0825|0827|0828|0831|0832|0833|0835|0836|085|0861|0862|0863|0864|0865|0871|0872|0873|0874|0875|0881|0882|0883|0884|0885|089|090|091|0921|0922|0923|
0924|0925|0931|0932|0933|0934|0935|0941|0942|095|0961|0962|0963|0964|0965|0966|0967|0968|0971|0972|0973|0974|0975|0976|0981|0982|0983|0984|0985|099)(-)[0-9]{7}$')

