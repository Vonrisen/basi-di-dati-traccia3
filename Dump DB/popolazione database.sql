	--INSERIMENTO IN CUSTOMER
CALL insertCustomer('Pasquale', 'De Nicola', 'Via Di Pasquale', '1970-09-18', 'Napoli', 'M', '1234567890', 'p.denicola@outlook.com', 'Password123', 'DNCPQL70P18F839P');

CALL insertCustomer('Marica','Savino','Via DI Marica','1975-02-06','Caserta','F','2345678901','m.savino@outlook.com','MaricaSa975','SVNMRC75B46B963V');

CALL insertCustomer('Nicola','Trinchese','Via Avella','1996-01-14','Avella','M','3456789012','n.trinchese@libero.it','trinCo1','TRNNCL96A14A508U');

CALL insertCustomer('Annalisa','Fiocchi','Via Sicura','1986-04-22','Sorrento','F','4567890123','a.fiocchi@alice.it','LisaFiocchiAnna32','FCCNLS86D62I862G');

CALL insertCustomer('Mario','Parisi','Via Bono','2000-11-17','Avellino','M','5678901234','m.parisi@live.it','PaMario00','PRSMRA00S17A509N');

CALL insertCustomer('Elena','De Luca','Via Daqui','1999-12-31','Salerno','F','6789012345','e.deluca@outlook.it','DEelena99','DLCLNE99T71H703K');

CALL insertCustomer('Saverio','Romano','Via Oleandri','2001-05-19','Pozzuoli','M','7890123456','s.romano@libero.com','SaRoVeMa201','RMNSVR01E19G964E');

CALL insertCustomer('Giovanna','Di Maio','Via Seconda','1980-08-08','Nola','F','8901234567','d.dimaio@outlook.com','gioDima80','DMIGNN80M48F924S');

CALL insertCustomer('Carmine','Ioime','Via Trivice','1990-03-29','Pomigliano D''arco','M','9012345678','c.ioime@outlook.com','Mino90','MIOCMN90C29G812U');

CALL insertCustomer('Cristina','D''avena','Via Zecchino d''Oro','1964-07-06','Bologna','F','0123456789','c.davena@puffi.pu','Puffiamo10','DVNCST64L46A944B');





	--INSERIMENTO IN MEAL
CALL insertfood('Spaghetti e vongole','PE',5.50,'Ingredienti: Spaghetti, vongole, pomodorini');

CALL insertfood('Spaghetti alla Carbonara','PA',10.00,'Ingredienti: Spaghetti, tuorli, guanciale, pepe nero, pecorino romano');

CALL insertfood('Pennette all''arrabiata','PL',8.50,'Ingredienti: Penne rigate, aglio, prezzemolo, sale, pomodori pelati, peperoncino, olio');

CALL insertfood('Brodo di tortellini','PL',11.00,'Ingredienti: Tortellini, brodino con spezie varie');

CALL insertfood('Cotoletta','SA',8.50,'Ingredienti: Carne di vitello, uova, farina, burro');

CALL insertfood ('Carne alla pizzaiola','SA',11.50,'Ingredienti: Fettine di manzo, olio, sale, aglio, passata di pomodoro, origano, pepe');

CALL insertfood ('Costine al forno','SA',12.00,'Ingredienti: Costine di carne, rosmarino, pepe nero, aglio');

CALL insertfood ('Baccalà fritto','SE',10.50,'Ingredienti: Baccalà dissalato, farina');

CALL insertfood ('Insalata di polpo e patate','SE',9.00,'Ingredienti: Polpo, Patate, prezzemolo, olio, succo di limone');

CALL insertfood('Salmone croccante','SE',9.50,'Ingredienti: Filetto di salmone, prezzemolo, scorza di limone, pane, pepe bianco, rosmarino');

CALL insertfood('CocaCola','BN',2.00,'Ingredienti: Acqua, Anidride carbonica, zucchero, colorante, acido fosforico, aromi naturali. caffeina');

CALL insertfood('Bottiglina d''acqua','BN',1.00,'Ingredienti: acqua, sali minerali');

CALL insertfood('Patatine Fritte p','FR',2.00,'Ingredienti: Patate, sale, olio. Porzione piccola');

CALL insertfood('Patatine Fritte m','FR',3.00,'Ingredienti: Patate, sale, olio. Porzione Merdia');

CALL insertfood('Patatine Fritte g','FR',4.00,'Ingredienti: Patate, sale, olio. Porzione Grande');

CALL insertfood('Panino hamburger','FA',6.00,'Ingredienti: Panino, hamburger, patatine, pomodorini');

CALL insertfood('Panino kebab','FA',7.00,'Ingredienti: Panino, patatine, provola');

CALL insertfood('Pizza margherita','FI',4.00,'Ingredienti: Sugo, mozzarella');

CALL insertfood('Gelato alla vaniglia','DE',2.00,'Ingredienti: Latte, panna, vaniglia');

CALL insertfood('Gelato al cioccolato','DE',2.00,'Ingredienti: Latte, panna, cacao');

CALL insertfood('Gelato a fragola','DE',2.00,'Ingredienti: Latte, panna, succo di fragola, fragola a pezzi');

CALL insertfood('Monoporzione red velvet','DA',5.00,'Ingredienti: Burro, uova, farina, zucchero, sale, coloranti, yogurt bianco, lievito');





	--INSERIMENTO IN SHOP
INSERT INTO shop VALUES (DEFAULT, 'Food Overflow Napoli', 'Via Napoli', null, null, 'Napoli123');

INSERT INTO shop VALUES (DEFAULT, 'Food Overflow Caserta', 'Via Caserta', '08:00-00:00', null, 'Caserta123');

INSERT INTO shop VALUES (DEFAULT, 'Food Overflow Salerno', 'Via Salerno',null, 'Lunedi', 'Salerno123');






	--INSERIMENTO IN RIDER
CAll insertRider ('FRUGLC90T02F839Q','Gianluca','Fru','Via Napoli','1990-12-02','Napoli','M','0987654321','Bicicletta','00:00-00:00','001');

CAll insertRider ('RZZLNZ00B63C675H','Lorenza','Rozza','Via Marino','2000-02-23','Cicciano','F','9876543210','Motoveicolo','00:00-00:00','002');

CAll insertRider ('DLRFNC93C03H703Q','Francesco','Di Lauro','Via Ester','1993-03-03','Salerno','M','8765432109','Autoveicolo','00:00-00:00','003');

CAll insertRider ('LTRMRA96A58F839V','Maria','Altieri','Via Cite','1996-01-18','Napoli','F','7654321098','Bicicletta','00:00-00:00','001');

CAll insertRider ('CRDMHL99A10B963H','Michele','Cordaro','Via De Stefano','1999-01-10','Caserta','M','6543210987','Motoveicolo','00:00-00:00','002');

CAll insertRider ('MLLMRC91S52C188Y','Mariarca','Maiello','Via Cisterna','1991-11-12','Castello di Cisterna','F','5432109876','Autoveicolo','00:00-00:00','003');

CAll insertRider ('TRCLGU88E11A509X','Luigi','Turco','Via Nonsaprei','1988-05-11','Avellino','M','4321098765','Motoveicolo','00:00-00:00','001');

CAll insertRider ('MNDVLR96C63F924G','Valeria','Menditti','Via Cimitile','1996-03-23','Nola','F','3210987654','Motoveicolo','00:00-00:00','001');

CAll insertRider ('TSTNGL97L15G964R','Angelo','Testa','Via Campo','1997-07-15','Pozzuoli','M','2109876543','Autoveicolo','00:00-00:00','003');

CAll insertRider ('NPLCMN01P70G964X','Carmen','Napolitano','Via Stens','2001-09-30','Pozzuoli','F','1098765432','Motoveicolo','00:00-00:00','001');




	--INSERIMENTO ALLERGENI
INSERT INTO allergen VALUES ('Cereali e derivati');
INSERT INTO allergen VALUES ('Crostacei');
INSERT INTO allergen VALUES ('Uova');
INSERT INTO allergen VALUES ('Pesce');
INSERT INTO allergen VALUES ('Arachidi');
INSERT INTO allergen VALUES ('Soia');
INSERT INTO allergen VALUES ('Latte e derivati');
INSERT INTO allergen VALUES ('Frutta a guscio');
INSERT INTO allergen VALUES ('Sedano');
INSERT INTO allergen VALUES ('Senape');
INSERT INTO allergen VALUES ('Sesamo');
INSERT INTO allergen VALUES ('Anidride solforosa e solfiti');
INSERT INTO allergen VALUES ('Lupini');
INSERT INTO allergen VALUES ('Molluschi');





	--INSERIMENTO ALLERGENI-ALIMENTO
INSERT INTO mealComposition ('PE0001', 'Molluschi');
INSERT INTO mealComposition ('PA0002', 'Uova');
INSERT INTO mealComposition ('PA0002', 'Latte e derivati');
INSERT INTO mealComposition ('SA0005', 'Uova');
INSERT INTO mealComposition ('SE0009', 'Molluschi');
INSERT INTO mealComposition ('SE0008', 'Pesce');
INSERT INTO mealComposition ('SE0010', 'Pesce');
INSERT INTO mealComposition ('FA0017', 'Latte e derivati');
INSERT INTO mealComposition ('FA0018', 'Latte e derivati');
INSERT INTO mealComposition ('DE0019', 'Latte e derivati');
INSERT INTO mealComposition ('DE0020', 'Latte e derivati');
INSERT INTO mealComposition ('DE0021', 'Latte e derivati');
INSERT INTO mealComposition ('DA0022', 'Latte e derivati');
INSERT INTO mealComposition ('DA0022', 'Uova');
INSERT INTO mealComposition ('PE0001', 'Cereali e derivati');
INSERT INTO mealComposition ('PA0002', 'Cereali e derivati');
INSERT INTO mealComposition ('PL0003', 'Cereali e derivati');
INSERT INTO mealComposition ('PL0004', 'Cereali e derivati');
INSERT INTO mealComposition ('SA0005', 'Cereali e derivati');
INSERT INTO mealComposition ('SE0008', 'Cereali e derivati');
INSERT INTO mealComposition ('FA0016', 'Cereali e derivati');
INSERT INTO mealComposition ('FA0017', 'Cereali e derivati');
INSERT INTO mealComposition ('FI0018', 'Cereali e derivati');
