-- Permette di effettuare una ricerca filtrata di pasti combinando categoria di un pasto, fascia di prezzo; sono scartati i cibi che hanno almeno un allergia alimentare tra quelle incluse nella lista.
CREATE OR REPLACE FUNCTION effettuaRicercaComplessaCustomer(category varchar, min_price FLOAT, max_price FLOAT, allergen_list varchar, shop_email varchar) RETURNS SETOF RECORD AS $$
DECLARE 
command text;
i integer DEFAULT 1;
BEGIN 
-- Nel caso in cui non voglio limiti sulla categoria
IF $1='Visualizza tutti i pasti' THEN command = 'SELECT DISTINCT name, category, price, ingredients, id FROM Meal WHERE price >= '||$2||'AND price <= '||$3||'AND id IN(SELECT meal_id FROM Supply WHERE shop_id=(SELECT id FROM Shop WHERE email='||quote_literal($5)||')) AND id NOT IN (SELECT meal_id FROM MealComposition WHERE allergen_name =';
ELSE
-- Ricerca applicando tutti i filtri
command = 'SELECT DISTINCT name, category, price, ingredients, id FROM Meal WHERE category ='||quote_literal($1)||' AND price >= '||$2||'AND price <= '||$3||'AND id IN(SELECT meal_id FROM Supply WHERE shop_id=(SELECT id FROM Shop WHERE email='||quote_literal($5)||')) AND id NOT IN (SELECT meal_id FROM MealComposition WHERE allergen_name =';
END IF;
-- Se la lista degli allergeni è NULL oppure è vuota non vengono presi in considerazione le allergie alimentari
IF allergen_list IS NULL OR allergen_list='' THEN command = command|| quote_literal(' ')||') ORDER BY price'; 
END IF;
-- Finquando ci sono allergeni nella lista o la lista è NULL
LOOP
EXIT WHEN allergen_list='' OR allergen_list IS NULL;
IF SPLIT_PART(allergen_list,', ',i)='' THEN
 command = command ||quote_literal(allergen_list)||') ORDER BY price';
 allergen_list='';
ELSE
-- Concatena le diverse allergie alimentari
 command = command || quote_literal(SPLIT_PART(allergen_list,', ',i))|| ' OR allergen_name=';
 i = i+1;
END IF;
END LOOP;
RETURN QUERY EXECUTE command;
END;
$$ LANGUAGE plpgsql;

-- Ricerca di ordini che hanno almeno un pasto della categoria selezionata, con totale dell ordine compreso nella fascia di prezzo selezionata il cui rider ha il veicolo selezionato e la cui provincia di consegna è quella selezionata
CREATE OR REPLACE FUNCTION effettuaRicercaComplessaAdmin(cat varchar, min_price FLOAT, max_price FLOAT, vehc varchar, prov varchar) RETURNS SETOF RECORD AS $$
DECLARE
-- Le variabili "ok1" "ok2" permettono ad una condizione di essere sempre verificata, quando richiesto.
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

-- Permette il salvataggio di un ordine sul database. 
-- Verrà prima inserito un record in CustomerOrder e successivamente per ogni pasto dell' ordine viene inserito un record in OrderComposition contenente l' id dell' ordine, id del pasto con rispettiva quantità.
CREATE OR REPLACE PROCEDURE createOrder(addr varchar, payment varchar, notes varchar, shop_email varchar, customer_email varchar, meal_list_name varchar, quantity_list varchar)
-- meal_list_name è la lista dei nomi dei cibi ordinati dall' utente separati da ", "
-- quantity_list è la lista delle quantità dei rispettivi cibi separati da ", "
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
LOOP -- Finquando c'è un nome di un alimento in una lista allora effettua l'inserimento in OrderComposition
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

-- Permette di aggiornare i campi di un ristorante.
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

-- Permette di aggiungere ad un alimento una lista di allergeni
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

-- Restituisce gli allergeni di un pasto.
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

-- Permette di associare un rider ad una consegna. Se si prova ad associare un ordine ad un rider che ha 3 consegne in corso, allora verrà lanciata un eccezione.
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

-- Trigger che viene innescato non appena un rider viene associato ad una consegna.
CREATE TRIGGER link_rider_to_order
AFTER UPDATE of rider_cf ON customerorder
FOR EACH ROW
WHEN (OLD.rider_cf IS null)
EXECUTE PROCEDURE linkRiderToOrder();


-- Permette di aggiornare il numero di consegne di un rider nel caso in cui questo ha consegnato l' ordine oppure ha avuto problemi durante la consegna. 
-- Se si prova ad aggiornare il numero di consegne di un rider che non ha consegne verrà lanciata un eccezione.
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

-- Trigger che viene innescato quando un ordine viene consegnato(cioè quando il delivery_time viene aggiornato) oppure quando c'è stato un problema durante la consegna di questo.
CREATE TRIGGER update_deliveries_number_of_a_rider
AFTER UPDATE of delivery_time ON customerorder
FOR EACH ROW 
WHEN (OLD.delivery_time IS NULL)
EXECUTE PROCEDURE updateDeliveriesNumberOfARider();