  
--RICERCA COMPLESSA CUSTOMER
DROP FUNCTION effettuaRicercaComplessaCustomer;
CREATE OR REPLACE FUNCTION effettuaRicercaComplessaCustomer(category varchar, min_price FLOAT, max_price FLOAT, allergen_list varchar, shop_email varchar) RETURNS SETOF RECORD AS $$
DECLARE 
command text;
i integer DEFAULT 1;
BEGIN 
IF $1='Visualizza tutti i pasti' THEN command = 'SELECT DISTINCT name, category, price, ingredients, id FROM Meal WHERE price >= '||$2||'AND price <= '||$3||'AND id IN(SELECT meal_id FROM Supply WHERE shop_id=(SELECT id FROM Shop WHERE email='||quote_literal($5)||')) AND id NOT IN (SELECT meal_id FROM MealComposition WHERE allergen_name =';
ELSE
command = 'SELECT DISTINCT name, category, price, ingredients, id FROM Meal WHERE category ='||quote_literal($1)||' AND price >= '||$2||'AND price <= '||$3||'AND id IN(SELECT meal_id FROM Supply WHERE shop_id=(SELECT id FROM Shop WHERE email='||quote_literal($5)||')) AND id NOT IN (SELECT meal_id FROM MealComposition WHERE allergen_name =';
END IF;
IF allergen_list IS NULL THEN command = command|| quote_literal(' ')||')'; 
END IF;
LOOP
EXIT WHEN allergen_list='' OR allergen_list IS NULL;
IF SPLIT_PART(allergen_list,', ',i)='' THEN
 command = command ||quote_literal(allergen_list)||')';
 allergen_list='';
ELSE
 command = command || quote_literal(SPLIT_PART(allergen_list,', ',i))|| ' OR allergen_name=';
 i = i+1;
END IF;
END LOOP;
RETURN QUERY EXECUTE command;
END;
$$ LANGUAGE plpgsql;



--Creazione ordine
--meal_list_name e' la lista dei nomi dei cibi ordinati dall' utente  / quantity_list e' la lista delle quantita' dei rispettivi cibi
DROP PROCEDURE createORDER;
CREATE OR REPLACE PROCEDURE createOrder(addr varchar, paymnt varchar, notes varchar, shop_email varchar, customer_email varchar, meal_list_name varchar, quantity_list varchar) 
LANGUAGE PLPGSQL AS $$
DECLARE
meal_name Meal.name%TYPE;
quant varchar;
meal_counter int default 1;
id_meal Meal.id%TYPE;
id_shop Shop.id%TYPE;
id_customer Customer.id%TYPE;
BEGIN
IF notes='' THEN notes=null; END IF;
SELECT id INTO id_shop FROM Shop WHERE email=shop_email;
SELECT id INTO id_customer FROM Customer WHERE email=customer_email_email;
INSERT INTO CustomerOrder VALUES (DEFAULT, DEFAULT, null, addr, DEFAULT, payment, notes, null, id_shop, id_customer);
LOOP
 meal_name=split_part(meal_list_name, ', ', meal_counter);
 quant=split_part(quantity_list, ', ', meal_counter);
 SELECT id INTO id_meal FROM Meal WHERE name=meal_name;
 IF meal_name<>'' THEN
 INSERT INTO OrderComposition VALUES(to_char(currval('customerorder_sequence'),'000000000000FM'),id_meal,quant::real);
 meal_counter=meal_counter+1;
 ELSE
 exit;
 END IF;
END LOOP;
END;
$$


--Aggiornamento rider
CREATE OR REPLACE PROCEDURE updateRider(cod_f varchar, residence varchar, cellular varchar, vehic varchar, workingtime varchar)
AS $$
BEGIN
IF workingtime=''THEN workingtime=null; END IF;
UPDATE Rider SET address=residence, cellphone=cellular, vehicle=vehic, working_time=workingtime WHERE cf=cod_f;
END;
$$
LANGUAGE PLPGSQL;



--Update Shop
DROP PROCEDURE updateShop;
CREATE OR REPLACE PROCEDURE updateShop(shop_name varchar, addr varchar, hours varchar, days varchar, passw varchar,newEmail varchar, phone varchar, oldEmail varchar)
AS $$
BEGIN
IF hours=''THEN hours=DEFAULT; END IF;
IF days=''THEN days=null; END IF;
UPDATE Shop SET name=shop_name, working_hours=hours, closing_days=closing_days, password=passw, email=newEmail, home_phone=phone, address=addr
WHERE email=oldEmail;
END;
$$
LANGUAGE PLPGSQL;




--Dato un alimento e una lista di allergeni, aggiunge questi ultimi all' alimento
CREATE OR REPLACE PROCEDURE addAllergens(meal_name varchar, allergens varchar) LANGUAGE plpgsql AS $$
DECLARE
allerg Allergen.name%TYPE DEFAULT '';
count_allergens INT DEFAULT 1;
meal_id Meal.id%TYPE;
BEGIN
SELECT id INTO meal_id FROM meal WHERE name=meal_name;
LOOP
 allerg=split_part(allergens, ', ', count_allergens);
 IF allerg<>'' THEN
 INSERT INTO MealComposition VALUES(meal_id, allerg);
 count_allergens = count_allergens + 1;
 ELSE
 exit;
 END IF;
END LOOP;
END;
$$;


CREATE OR REPLACE FUNCTION getAllergensofameal(meal varchar) RETURNS VARCHAR  language plpgsql AS $$
DECLARE
my_curs cursor FOR SELECT allergen_name FROM MealComposition WHERE meal_id=meal;
allergens Allergen.name%TYPE DEFAULT '';
BEGIN
FOR I IN my_curs
LOOP
allergens = i.allergen_name||', '||allergens;
END LOOP;
return substr(allergens,1,length(allergens)-2);
END; 
$$

--
CREATE OR REPLACE FUNCTION associateRiderToOrder() RETURNS TRIGGER AS $associate_rider_to_order$
BEGIN
	
		if (SELECT deliveries_number FROM rider WHERE cf=new.rider_cf) < 3
		THEN
			UPDATE Rider
			SET deliveries_number=deliveries_number+1
			WHERE cf=new.rider_cf;
			
			new.status='In consegna';
		END IF;
	
	return new;

END;
$associate_rider_to_order$ LANGUAGE plpgsql;

CREATE TRIGGER associate_rider_to_order
BEFORE UPDATE of rider_cf ON customerorder
FOR EACH ROW
WHEN (NEW.rider_cf IS NOT NULL)
EXECUTE PROCEDURE add_rider_in_order();



CREATE OR REPLACE FUNCTION updateDeliveriesNumberOfARider() RETURNS TRIGGER AS $update_deliveries_number_of_a_rider$
BEGIN
	
	IF new.status = 'Consegnato' OR new.status = 'Errore'
	THEN
	
		UPDATE rider
		SET deliveries_number=deliveries_number-1
		WHERE cf = new.rider_cf;
		
	END IF;
	
	RETURN NEW;
	
END;
$update_deliveries_number_of_a_rider$ LANGUAGE plpgsql;

CREATE TRIGGER update_deliveries_number_of_a_rider
AFTER UPDATE of status ON customerorder
FOR EACH ROW EXECUTE PROCEDURE update_deliveries_number_of_a_order();
