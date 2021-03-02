--RICERCA COMPLESSA CUSTOMER

CREATE OR REPLACE FUNCTION effettuaRicercaComplessaCustomer(category varchar, min_price FLOAT, max_price FLOAT, allergen_list varchar, shop_email varchar) RETURNS SETOF RECORD AS $$
DECLARE 
command text;
i integer DEFAULT 1;
BEGIN 
IF $1='Visualizza tutti i pasti' THEN command = 'SELECT DISTINCT name, category, price, ingredients, id FROM Meal WHERE price >= '||$2||'AND price <= '||$3||'AND id IN(SELECT meal_id FROM Supply WHERE shop_id=(SELECT id FROM Shop WHERE email='||quote_literal($5)||')) AND id NOT IN (SELECT meal_id FROM MealComposition WHERE allergen_name =';
ELSE
command = 'SELECT DISTINCT name, category, price, ingredients, id FROM Meal WHERE category ='||quote_literal($1)||' AND price >= '||$2||'AND price <= '||$3||'AND id IN(SELECT meal_id FROM Supply WHERE shop_id=(SELECT id FROM Shop WHERE email='||quote_literal($5)||')) AND id NOT IN (SELECT meal_id FROM MealComposition WHERE allergen_name =';
END IF;
IF allergen_list IS NULL OR allergen_list='' THEN command = command|| quote_literal(' ')||') ORDER BY price'; 
END IF;
LOOP
EXIT WHEN allergen_list='' OR allergen_list IS NULL;
IF SPLIT_PART(allergen_list,', ',i)='' THEN
 command = command ||quote_literal(allergen_list)||') ORDER BY price';
 allergen_list='';
ELSE
 command = command || quote_literal(SPLIT_PART(allergen_list,', ',i))|| ' OR allergen_name=';
 i = i+1;
END IF;
END LOOP;
RETURN QUERY EXECUTE command;
END;
$$ LANGUAGE plpgsql;

-- effettuaRicercaComplessaAdmin 
--Ricerca di ordini che hanno almeno un pasto nella categoria selezionata, con totale dell ordine compreso nella fascia di prezzo selezionata, il cui rider ha il veicolo selezionato e la cui provincia di consegna e' quella selezionata
CREATE OR REPLACE FUNCTION effettuaRicercaComplessaAdmin(cat varchar, min_price FLOAT, max_price FLOAT, vehc varchar, prov varchar) RETURNS SETOF RECORD AS $$
DECLARE
ok1 int default 0;
ok2 int default 0;
no_rider varchar(200) default ' AND CO.rider_cf IN (SELECT cf FROM Rider WHERE vehicle = '||quote_literal(vehc)||') GROUP BY CO.id HAVING SUM(M.price*OC.quantity)>='||min_price||' AND SUM(M.price)<='||max_price||') ORDER BY CO.date';
command varchar(1000) default '';
BEGIN 
IF cat = 'Seleziona categoria' OR cat = '-------------------' THEN ok1=1; END IF;
IF vehc = 'Seleziona veicolo del rider' OR vehc = '-------------------' THEN no_rider = ' GROUP BY CO.id HAVING SUM(M.price*OC.quantity)>='||min_price||' AND SUM(M.price)<='||max_price||') ORDER BY CO.date'; END IF;
IF prov ='Seleziona provincia di consegna' OR prov = '-------------------' THEN ok2=1; END IF;
command = 'SELECT  CO.id, CO.date, CO.delivery_time, CO.address, CO.status, CO.payment, CO.note, CO.rider_cf, S.email, C.email
							  			  FROM CustomerOrder AS CO JOIN Shop AS S ON S.id = CO.shop_id JOIN Customer AS C ON C.id = CO.customer_id
							 			  WHERE CO.id IN (SELECT CO.id
											 			  FROM CustomerOrder CO JOIN OrderComposition OC ON CO.id = OC.order_id JOIN Customer AS C ON C.id = CO.customer_id JOIN Meal AS M ON M.id = OC.meal_id 
											  			  WHERE (M.category = '||quote_literal(cat)||' OR 1='||ok1||') AND (SPLIT_PART(C.address,'','',5) ='|| quote_literal(prov)||' OR 1='||ok2||') ';
command = command || no_rider;
RETURN QUERY EXECUTE command;
END;
$$ LANGUAGE plpgsql;





--Creazione ordine
--meal_list_name e' la lista dei nomi dei cibi ordinati dall' utente  / quantity_list e' la lista delle quantita' dei rispettivi cibi
CREATE OR REPLACE PROCEDURE createOrder(addr varchar, payment varchar, notes varchar, shop_email varchar, customer_email varchar, meal_list_name varchar, quantity_list varchar) 
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
SELECT id INTO id_customer FROM Customer WHERE email=customer_email;
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
$$;

--Update Shop
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

CREATE OR REPLACE FUNCTION getAllergensOfAMeal(meal varchar) RETURNS VARCHAR  language plpgsql AS $$
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
$$;

-- trigger add_rider_in_order

CREATE OR REPLACE FUNCTION linkRiderToOrder() RETURNS TRIGGER AS $link_rider_to_order$
BEGIN 
	
		IF (SELECT deliveries_number FROM rider WHERE cf=new.rider_cf) < 3
		THEN
			UPDATE Rider
			SET deliveries_number=deliveries_number+1
			WHERE cf=new.rider_cf;
			Update CustomerOrder
			SET status = 'In consegna' WHERE id = new.id;
		else
		RAISE EXCEPTION 'Rider cannot be associated to more than 3 activities!';
		END IF;
	return new;

END;
$link_rider_to_order$ LANGUAGE plpgsql;

CREATE TRIGGER link_rider_to_order
AFTER UPDATE of rider_cf ON customerorder
FOR EACH ROW
WHEN (OLD.rider_cf IS null)
EXECUTE PROCEDURE linkRiderToOrder();


CREATE OR REPLACE FUNCTION updateDeliveriesNumberOfARider() RETURNS TRIGGER AS $update_deliveries_number_of_a_rider$
BEGIN
	
	IF (SELECT deliveries_number FROM Rider WHERE cf = OLD.rider_cf )>0 THEN
		UPDATE rider
		SET deliveries_number=deliveries_number-1
		WHERE cf = OLD.rider_cf;
	ELSE
	    RAISE EXCEPTION 'Rider with cf: % has no pending deliveries',OLD.rider_cf;
		END IF;
	RETURN NEW;
	
END;
$update_deliveries_number_of_a_rider$ LANGUAGE plpgsql;


CREATE TRIGGER update_deliveries_number_of_a_rider
AFTER UPDATE of delivery_time ON customerorder
FOR EACH ROW 
WHEN (OLD.delivery_time IS NULL)
EXECUTE PROCEDURE updateDeliveriesNumberOfARider();