-- TABELLA NEGOZIO
CREATE SEQUENCE Shop_sequence;

 CREATE TABLE Shop(
	 
	shop_id CHAR(4) PRIMARY KEY DEFAULT to_char(nextval('Shop_sequence'),'0000FM'),
	shop_name VARCHAR(32) NOT NULL,
	address VARCHAR(255) NOT NULL UNIQUE,
	working_hours CHAR(11),
	closing_days VARCHAR(56),
	password VARCHAR(32) NOT NULL,
 )

-- TABELLA RIDER

CREATE TABLE Rider( 

	cf CHAR(16) PRIMARY KEY, 
	rider_name VARCHAR(32) NOT NULL, 
	surname VARCHAR(32) NOT NULL, 
	address VARCHAR(255) NOT NULL, 
	birth_date DATE NOT NULL, 
	birth_place VARCHAR(25) NOT NULL, 
	gender CHAR(1) NOT NULL, 
	cellphone CHAR(10) NOT NULL UNIQUE,  
	vehicle VARCHAR(20) NOT NULL, 
	working_time CHAR(11) NOT NULL, 
	deliveries_number SMALLINT NOT NULL DEFAULT 0
	
) 

-- TABELLA CONTRATTO

CREATE TABLE Contract(

	rider_cf CHAR(16),
	shop_id CHAR(4),
	
	PRIMARY KEY (rider_cf,shop_id),
	FOREIGN KEY (rider_cf) REFERENCES Rider(cf) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (shop_id) REFERENCES Shop(shop_id) ON DELETE CASCADE ON UPDATE CASCADE
	
)

-- TABELLA UTENTE
CREATE SEQUENCE Customer_sequence;

CREATE TABLE Customer( 
    
	customer_id CHAR(7) PRIMARY KEY DEFAULT to_char(nextval('Customer_sequence'),'0000000FM'),
	customer_name VARCHAR(32) NOT NULL, 
	surname VARCHAR(32) NOT NULL, 
	address VARCHAR(255) NOT NULL, 
	birth_date DATE NOT NULL, 
	birth_place VARCHAR(25) NOT NULL, 
	gender CHAR(1) NOT NULL, 
	cellphone CHAR(10) NOT NULL UNIQUE,  
	email VARCHAR(320) NOT NULL UNIQUE, 
	password VARCHAR(32) NOT NULL,
	cf CHAR(16) NOT NULL UNIQUE
	
)

--TABELLA CART

CREATE SEQUENCE Cart_sequence; 


CREATE TABLE Cart( 

	cart_id CHAR(8) PRIMARY KEY DEFAULT to_char(nextval('Cart_sequence'),'00000000FM'), 
	complete CHAR(1) NOT NULL DEFAULT 'n', 
	customer_id CHAR(7), 
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE 
)

-- TABELLA ALIMENTO
CREATE SEQUENCE Meal_sequence;
CREATE TABLE Meal( 

    meal_id CHAR (6) PRIMARY KEY, 
	meal_name VARCHAR (32) NOT NULL UNIQUE, 
	price REAL NOT NULL, 
	description VARCHAR(255) 
) 


-- TABELLA COMPCARRELLO
CREATE TABLE CartComposition(

	cart_id CHAR(12),
	meal_id CHAR(6),
	quantity SMALLINT NOT NULL,
	
	PRIMARY KEY(cart_id, meal_id),
	FOREIGN KEY (cart_id) REFERENCES Cart(cart_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(meal_id) ON DELETE CASCADE ON UPDATE CASCADE
)

-- TABELLA COMPALIMENTO
CREATE TYPE AllergenType AS ENUM ('Cereali e derivati', 'Crostacei', 'Uova', 'Pesce', 'Arachidi', 'Soia', 'Latte', 'Frutta a guscio', 'Sedano', 'Senape', 'Sesamo', 'Anidride solforosa e solfiti', 'Lupini', 'Molluschi');
CREATE TABLE MealComposition( 

	meal_id CHAR(6), 
	allergen AllergenType, 

	PRIMARY KEY(meal_id,allergen), 
	FOREIGN KEY (meal_id) REFERENCES Meal(meal_id) ON DELETE CASCADE ON UPDATE CASCADE 
) 

-- TABELLA ORDINE

CREATE TABLE CustomerOrder(

	order_id CHAR(8) PRIMARY KEY,
	order_date TIMESTAMP NOT NULL DEFAULT current_timestamp,
	delivery_time TIME,
	address VARCHAR(255) NOT NULL,
	status VARCHAR(20) NOT NULL DEFAULT 'In attesa',
	payment VARCHAR(20),
	note VARCHAR(255),
	rider_cf CHAR(5),
	shop_id CHAR(4),
	customer_id CHAR(6),
	
	FOREIGN KEY(rider_cf) REFERENCES Rider(cf),
	FOREIGN KEY(shop_id) REFERENCES Shop(shop_id),
	FOREIGN KEY(customer_id ) REFERENCES Customer(customer_id)
)

-- TABELLA SCORTA

CREATE TABLE Supply(

	shop_id CHAR(4),
	meal_id CHAR(6),
	quantity SMALLINT NOT NULL,

	PRIMARY KEY(shop_id, meal_id),
	FOREIGN KEY (shop_id) REFERENCES Shop(shop_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(meal_id) ON DELETE CASCADE ON UPDATE CASCADE
)

-- TABELLA COMPORDINE

CREATE TABLE OrderComposition(

	order_id CHAR(12),
	meal_id CHAR(6),
	quantity SMALLINT NOT NULL,

	PRIMARY KEY(order_id, meal_id),
	FOREIGN KEY (order_id) REFERENCES CustomerOrder(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (meal_id) REFERENCES Meal(meal_id) ON UPDATE CASCADE
)




--TRIGGER E FUNCTION PER CREARE UN ORDINE


CREATE TRIGGER createOrder
AFTER UPDATE ON Cart
FOR EACH ROW
WHEN (OLD.complete='n' AND NEW.complete='s')
EXECUTE PROCEDURE createOrder();

--Creazione ordine
CREATE OR REPLACE FUNCTION createOrder() RETURNS trigger AS $createOrder$
DECLARE
/* Inizializzare indirizzo, note, codice_fiscale, cod_negozio*/
BEGIN
INSERT INTO Order (order_id,user_id, order_date,address ,note , cf, shop_id, status)
VALUES(NEW.cart_id,NEW.user_id,DEFAULT,address ,note ,cf, shop_id, DEFAULT);
INSERT INTO OrderComposition (SELECT * FROM CartComposition WHERE cart_id=NEW.cart_id);
UPDATE Supply AS S
SET quantity = S.quantity - OC.quantity
FROM OrderComposition AS OC
WHERE S.meal_id = OC.meal_id AND OC.order_id=NEW.cart_id AND S.shop_id = shop_id;
DELETE FROM Cart WHERE cart_id=NEW.cart_id;
RETURN NEW;
END;
$crea_ordine$ LANGUAGE plpgsql;

--Inserisce un alimento nella tabella Meal
CREATE OR REPLACE PROCEDURE insertFood(meal_name varchar, prefix varchar, price real, description varchar) LANGUAGE PLPGSQL AS $$
declare
suffix CHAR(4)=to_char(nextval('Meal_sequence'),'0000FM');
begin
INSERT INTO Meal VALUES (prefix||suffix, meal_name, price, description);
end;
$$;
 
--Inserisce un allergene ad un alimento
CREATE OR REPLACE PROCEDURE insertAllergen(meal_id varchar, allergen AllergenType ) LANGUAGE PLPGSQL AS $$
begin
INSERT INTO MealComposition VALUES(meal_id,allergen);
end;
$$;
 
--Inserisce un rider
CREATE OR REPLACE PROCEDURE insertRider(cf varchar, rider_name varchar, surname varchar, address varchar, birth_date varchar, birth_place varchar, gender char, cellphone  varchar, vehicle varchar, working_time varchar, shop_id varchar) 
LANGUAGE PLPGSQL AS $$
BEGIN
INSERT INTO Rider VALUES (cf, rider_name, surname, address, TO_DATE(birth_date,'dd-mm-yyyy'), birth_place, gender, cellphone, vehicle, working_time, DEFAULT);
INSERT INTO Contract VALUES (cf, shop_id);
END;
$$;

--Eliminazione di un rider
CREATE OR REPLACE PROCEDURE deleteRider(codice_fiscale varchar) 
LANGUAGE PLPGSQL AS $$
BEGIN
DELETE FROM Rider WHERE cf = codice_fiscale;
END;
$$;

--Aggiornamento rider
CREATE OR REPLACE PROCEDURE updateRider(codice_fiscale varchar, residenza varchar, cellulare varchar, veicolo varchar, workingtime varchar)
AS $$
BEGIN
IF workingtime=''THEN workingtime=null; END IF;
UPDATE Rider SET address=residenza, cellphone=cellulare, vehicle=veicolo, working_time=workingtime WHERE cf=codice_fiscale;
END;
$$
LANGUAGE PLPGSQL;

--Inserisce un negozio
CREATE OR REPLACE PROCEDURE insertShop(shop_name varchar, address varchar, working_hours varchar, closing_days varchar, pwd varchar) LANGUAGE PLPGSQL AS $$
BEGIN
INSERT INTO Shop VALUES(DEFAULT, shop_name, address, working_hours, closing_days, pwd);
END;
$$;

--Update Shop
CREATE OR REPLACE PROCEDURE updateShop(shop_id varchar, shop_name varchar, address varchar, working_hours varchar, closing_days varchar, pwd varchar)
AS $$
BEGIN
IF working_hours=''THEN working_hours=null; END IF;
IF closing_days=''THEN closing_days=null; END IF;
IF pwd=''THEN pwd=null; END IF;
UPDATE Shop SET shop_id=shop_id,shop_name=shop_name,working_hours=working_hours,closing_days=closing_days,shop_password=pwd WHERE shop_id=shop_id;
END;
$$
LANGUAGE PLPGSQL;

--Eliminazione di un negozio
CREATE OR REPLACE PROCEDURE deleteShop(cod_shop varchar) LANGUAGE PLPGSQL AS $$
BEGIN
DELETE FROM Shop WHERE shop_id = cod_shop;
END;
$$;

--Eliminazione di un alimento
CREATE OR REPLACE PROCEDURE deleteMeal(meal varchar) LANGUAGE PLPGSQL AS $$
BEGIN
DELETE FROM Meal WHERE meal_name = meal;
END;
$$;

--Dato un alimento e una lista di allergeni, aggiunge questi ultimi all' alimento
CREATE OR REPLACE PROCEDURE addAllergen(meal_id varchar, allergens varchar) LANGUAGE plpgsql AS $$
DECLARE
allerg varchar='';
count_allergens INT DEFAULT 1;
BEGIN
LOOP
 allerg=split_part(allergens, ',', count_allergens);
 IF allerg<>'' THEN
 INSERT INTO MealComposition VALUES(meal_id, allerg::AllergenType);
 count_allergens = count_allergens + 1;
 ELSE
 exit;
 END IF;
END LOOP;
END;
$$;

--Inserisce un customer
CREATE OR REPLACE PROCEDURE insertCustomer(customer_name varchar, surname varchar, address varchar, birth_date date, birth_place varchar, gender char, cellphone char, email varchar, passw varchar, cf varchar) LANGUAGE PLPGSQL AS $$
BEGIN
INSERT INTO Customer VALUES (DEFAULT,customer_name,surname,address,birth_date,birth_place,gender,cellphone,email,passw,cf);
END;
$$;

--Constraint address
ALTER TABLE Customer
ADD CONSTRAINT customer_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ A-Za-z0-9]+( )[A-Z0-9]+(, )[0-9]{5}(, )[A-Za-z]+( )[A-Z]{2}$' )

