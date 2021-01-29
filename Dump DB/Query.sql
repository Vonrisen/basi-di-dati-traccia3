  --Creazione ordine
--meal_list_name e' la lista dei nomi dei cibi ordinati dall' utente  / quantity_list e' la lista delle quantita' dei rispettivi cibi
CREATE OR REPLACE PROCEDURE createOrder(address varchar, payment varchar, note varchar, shop_id varchar, customer_cf varchar, meal_list_name varchar, quantity_list varchar) 
LANGUAGE PLPGSQL AS $$
DECLARE
meal_name Meal.name%TYPE;
quant varchar;
meal_counter int default 1;
id_meal Meal.id%TYPE;
BEGIN
IF note='' THEN note=null; END IF;
INSERT INTO CustomerOrder VALUES (DEFAULT, DEFAULT, null, address, DEFAULT, payment, note, null, shop_id, customer_cf);
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


--FUNZIONE che restituisce il valore massimo raggiungibile dalla sequenza. Come parametro prende il nome della sequenza
CREATE OR REPLACE FUNCTION massimo(seqname varchar) RETURNS integer as $$
declare 
max integer;
begin
select max_value into max from pg_sequences where sequencename=seqname;
return max;
end;
$$ LANGUAGE plpgsql;

--FUNZIONE che restituisce il valore corrente dalla sequenza. Come parametro prende il nome della sequenza
CREATE OR REPLACE FUNCTION current(seqname varchar) RETURNS integer as $$
declare 
curr integer;
begin
select last_value into curr from pg_sequences where sequencename=seqname;
return curr;
end;
$$ LANGUAGE plpgsql;

--FUNZIONE che genera il codice ordine. Come parametri prende il nome della sequenza che genera la lettera e il nome della sequenza numerica
CREATE or replace FUNCTION genseq(letterSeq varchar, seqNum varchar) RETURNS char AS $$
declare
BEGIN
RETURN  ( let(letterSeq, seqNum) || to_char(nextval(seqNum),'00000000000FM') );
END;
$$ LANGUAGE plpgsql;

--FUNZIONE che gestisce la lettera della sequenza. Come parametri prende il nome della sequenza che genera la lettera e il nome della sequenza numerica
create or replace function let(letterSeq varchar, seqNum varchar) returns char as $$
declare
i integer;
j integer;
begin
i=corrente(letterSeq);
if i is null then i=nextval(letterSeq); end if;
	begin
	j=currval(seqNum);
	exception
	when sqlstate '55000' then j=1;
	end;
if j = massimo(seqNum) then i= nextval(letterSeq); end if;
return chr(i);
end;
$$ language plpgsql;


--Aggiornamento rider
CREATE OR REPLACE PROCEDURE updateRider(codice_fiscale varchar, residenza varchar, cellulare varchar, veicolo varchar, workingtime varchar)
AS $$
BEGIN
IF workingtime=''THEN workingtime=null; END IF;
UPDATE Rider SET address=residenza, cellphone=cellulare, vehicle=veicolo, working_time=workingtime WHERE cf=codice_fiscale;
END;
$$
LANGUAGE PLPGSQL;



--Update Shop
CREATE OR REPLACE PROCEDURE updateShop(shop_name varchar, address varchar, working_hours varchar, closing_days varchar, password varchar, oldEmail varchar, newEmail varchar)
AS $$
BEGIN
IF working_hours=''THEN working_hours=DEFAULT; END IF;
IF closing_days=''THEN closing_days=null; END IF;
UPDATE Shop SET shop_name=shop_name, working_hours=working_hours, closing_days=closing_days, password=password, email=newEmail 
WHERE email=oldEmail;
END;
$$
LANGUAGE PLPGSQL;




--Dato un alimento e una lista di allergeni, aggiunge questi ultimi all' alimento
CREATE OR REPLACE PROCEDURE addAllergens(meal_name varchar, allergens varchar) LANGUAGE plpgsql AS $$
DECLARE
allerg varchar='';
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

