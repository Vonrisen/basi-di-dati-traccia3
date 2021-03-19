-- Popolazione Customer
INSERT INTO CUSTOMER 
VALUES
	(DEFAULT, 'CCARBL01L30E244Q', 'Arcibaldo', 'Acciai', 'Via Silvio Spaventa, 130, 84013, CAVA DE'' TIRRENI, SALERNO', '30/07/2001','GUARDALFIERA', 'M', '1234567890', 'arci.acci@gmail.com', 'arciacci'),
	(DEFAULT, 'MSCGLN81E59E656C', 'Giuliana', 'Muscatelli', 'Via Partenope, 38, 81031, AVERSA, CASERTA', '19/05/1981', 'LOMAGNA', 'F', '0987654321', 'giuliana.musc@gmail.com', 'julymusc'),
	(DEFAULT, 'SMMVTR02R53H264O', 'Vittoria Alice', 'Sammane', 'Via Scarpati, 11A, 80145, NAPOLI, NAPOLI', '13/10/2002', 'RHO', 'F', '0123456789', 'vittor@gmail.com', 'vittoria13'),
	(DEFAULT, 'DNCPQL70P18F839P', 'Pasquale', 'De Nicola', 'Via del Rito, 20, 80132, POZZUOLI, NAPOLI', '18/09/1970', 'NAPOLI', 'M', '0012345678', 'pasq@gmail.com', 'pasqdenic'),
	(DEFAULT, 'SVNMRC75B46B963V', 'Marica', 'Savino', 'Piazza del Duomo, 68 Z, 80133, CASAVATORE, NAPOLI', '06/02/1975', 'CASERTA', 'F', '0001234567', 'marik.savino@gmail.com', 'marika31'),
	(DEFAULT, 'TRNNCL96A14A508U', 'Nicola', 'Trinchese', 'Via Avella, 99, 80100, BACOLI, NAPOLI', '14/01/1996', 'AVELLA', 'M', '0000123456', 'n.trinchese@gmail.com', 'trinkese'),
	(DEFAULT, 'FCCNLS86D62I862G', 'Annalisa', 'Fiocchi', 'Via Sicura, 3, 80129, PORTICI, NAPOLI', '22/04/1986', 'SORRENTO', 'F', '0000012345', 'fioccolandia@gmail.com', 'fioccolovia'),
	(DEFAULT, 'PRSMRA00S17A509N', 'Mario', 'Parisi', 'Via Artica, 69, 80100, OTTAVIANO, SALERNO', '17/11/2000', 'AVELLINO', 'M', '1236547890', 'scimmiartica@gmail.com', 'artica'),
	(DEFAULT, 'RMNSVR01E19G964E', 'Saverio', 'Romano', 'Via Rolling Stones, 00, 84011, AMALFI, SALERNO', '19/05/2001','POZZUOLI', 'M', '3336669991', 'mickjagger@gmail.com', 'mickjrs'),
	(DEFAULT, 'MIOCMN90C29G812U', 'Carmine', 'Ioime', 'Via Trivice, 30L, 84059, CAMEROTA, SALERNO', '29/03/1990', 'POMIGLIANO D''ARCO', 'M', '1112223334', 'vpervendetta@gmail.com', 'ggwp'),
	(DEFAULT, 'NPLCMN01P70G964X', 'Carmen', 'Napolitano', 'Via Stens, 54, 81043, CAPUA, CASERTA', '30/09/2001', 'POZZUOLI', 'M', '7654321091', 'napolitan@gmail.com', 'casertanapoli');
	
-- Popolazione Meal
INSERT INTO Meal 
VALUES 
	(DEFAULT, 'Primo piatto', 'Spaghetti e vongole', 7.50, 'Spaghetti, vongole, pomodorini'),
	(DEFAULT, 'Primo piatto', 'Spaghetti alla carbonara', 10.00, 'Spaghetti, uova, guanciale, pepe nero, pecorino romano'),
	(DEFAULT, 'Primo piatto', 'Pennette all''arrabbiata' , 8.50, 'Penne rigate, aglio, prezzemolo, sale, pomodori pelati, peperoncino, olio'),
	(DEFAULT, 'Primo piatto', 'Brodo di tortellini', 6.00, 'Tortellini, brodino con spezie varie'),
	(DEFAULT, 'Carne', 'Cotoletta', 8.50, 'Carne di vitello, uova, farina, burro'),
	(DEFAULT, 'Carne', 'Carne alla pizzaiola', 11.50, 'Fettine di manzo, olio, sale, aglio, passata di pomodoro, origano, pepe'),
	(DEFAULT, 'Carne', 'Costine al forno', 12.00, 'Costine di carne, rosmarino, pepe nero, aglio'),
	(DEFAULT, 'Pesce', 'Baccalà fritto', 10.50, 'Baccalà dissalato, farina'),
	(DEFAULT, 'Pesce', 'Insalata di polpo e patate', 9.00, 'Polpo, Patate, prezzemolo, olio, succo di limone'),
	(DEFAULT, 'Pesce', 'Salmone croccante', 9.50, 'Filetto di salmone, prezzemolo, scorza di limone, pane, pepe bianco, rosmarino'),
	(DEFAULT, 'Bevande analcoliche', 'Coca cola', 2.00, 'Acqua, Anidride carbonica, zucchero, colorante, acido fosforico, aromi naturali. caffeina'),
	(DEFAULT, 'Bevande analcoliche', 'Bottiglina d''acqua naturale', 1.00, null),
	(DEFAULT, 'Fritto', 'Patatine fritte piccola', 2.00, 'Patate, sale, olio. Porzione piccola'),
	(DEFAULT, 'Fritto', 'Patatine Fritte media', 3.00, 'Patate, sale, olio. Porzione media'),
	(DEFAULT, 'Fritto', 'Patatine Fritte grande', 4.00, 'Patate, sale, olio. Porzione Grande'),
	(DEFAULT, 'Panino', 'Panino hamburger', 6.00, 'Panino, hamburger, patatine, pomodorini'),
	(DEFAULT, 'Panino', 'Panino kebab', 7.00, 'Panino, patatine, provola'),
	(DEFAULT, 'Pizza', 'Pizza margherita', 4.00, 'Sugo, mozzarella'),
	(DEFAULT, 'Dolce', 'Gelato alla vaniglia', 2.00, 'Latte, panna, vaniglia'),
	(DEFAULT, 'Dolce', 'Gelato al cioccolato', 2.00, 'Latte, panna, cacao'),
	(DEFAULT, 'Dolce', 'Gelato a fragola', 2.00, 'Latte, panna, succo di fragola, fragola a pezzi'),
	(DEFAULT, 'Dolce', 'Monoporzione red velvet', 5.00, 'Burro, uova, farina, zucchero, sale, coloranti, yogurt bianco, lievito'),
	(DEFAULT, 'Bevande alcoliche', 'Spritz', 5.00, 'Aperol, soda, prosecco, arancia');

--Popolazione allergeni
INSERT INTO allergen 
VALUES 
	('Cereali e derivati'),
	('Crostacei'),
	('Uova'),
	('Pesce'),
	('Arachidi'),
	('Soia'),
	('Latte e derivati'),
	('Frutta a guscio'),
	('Sedano'),
	('Senape'),
	('Sesamo'),
	('An. solforosa e solfiti'),
	('Lupini'),
	('Molluschi');


-- Aggiunta degli allergeni agli alimenti
CALL addallergens ('Spaghetti e vongole', 'Molluschi, Cereali e derivati');
CALL addallergens ('Spaghetti alla carbonara', 'Uova, Cereali e derivati, Latte e derivati');
CALL addallergens ('Pennette all''arrabbiata', 'Cereali e derivati');
CALL addallergens ('Brodo di tortellini', 'Cereali e derivati');
CALL addallergens ('Cotoletta', 'Uova, Cereali e derivati');
CALL addallergens ('Baccalà fritto', 'Pesce, Cereali e derivati');
CALL addallergens ('Insalata di polpo e patate', 'Molluschi');
CALL addallergens ('Salmone croccante', 'Pesce');
CALL addallergens ('Panino hamburger', 'Cereali e derivati');
CALL addallergens ('Panino kebab', 'Latte e derivati');
CALL addallergens ('Pizza margherita', 'Latte e derivati, Cereali e derivati');
CALL addallergens ('Gelato alla vaniglia', 'Latte e derivati, Cereali e derivati');
CALL addallergens ('Gelato al cioccolato', 'Latte e derivati');
CALL addallergens ('Gelato a fragola', 'Latte e derivati');
CALL addallergens ('Monoporzione red velvet', 'Latte e derivati, Uova');

--Popolazione Shop
INSERT INTO SHOP
VALUES
	(DEFAULT, 'Food Overflow Napoli', 'Via Napoli, 20, 80030, NAPOLI, NAPOLI', '08:00-23:00', 'Lunedì', 'Napoli123', 'napoli@foodoverflow.it', '081-1234556'),
	(DEFAULT, 'Food Overflow Caserta', 'Via Caserta, 20, 80030, CASERTA, CASERTA', '16:00-00:00', 'Lunedì, Martedì', 'Caserta123', 'caserta@foodoverflow.it', '081-1235454'),
	(DEFAULT, 'Food Overflow Salerno', 'Via Salerno, 20, 80030, SALERNO, SALERNO', '18:00-02:00', 'Giovedì', 'Salerno123', 'salerno@foodoverflow.it', '081-1234555');

--Popolazione Rider
INSERT INTO RIDER
VALUES
	('RZZLNZ00B63C675H', 'Lorenza', 'Rozza', 'Via Marino, 20, 80130, NAPOLI, NAPOLI', '2000-02-23', 'CICCIANO', 'F', '9876543210', 'Motoveicolo', '15:00-23:00', DEFAULT, '001'),
	('TRCLGU88E11A509X', 'Luigi', 'Turco', 'Via Nonsaprei, 20, 80131, NOLA, NAPOLI', '1988-05-11', 'AVELLINO', 'M', '4321098765', 'Motoveicolo', '18:00-02:00', DEFAULT, '001'),
	('DLRFNC93C03H703Q', 'Francesco', 'Di Lauro', 'Via Ester, 20, 80111, ERCOLANO, NAPOLI', '1993-03-03', 'SALERNO', 'M', '8765432109', 'Autoveicolo', '12:00-19:00', DEFAULT, '001'),
	('MNDVLR96C63F924G', 'Valeria', 'Menditti', 'Via Cimitile, 20, 80132, CASALNUOVO, NAPOLI', '1996-03-23', 'NOLA', 'F', '3210987654', 'Motoveicolo', '11:00-18:00', DEFAULT, '001'),
	('LTRMRA96A58F839V', 'Maria', 'Altieri', 'Via Cite, 20, 80030, AVERSA, CASERTA', '1996-01-18', 'NAPOLI', 'F', '7654321098', 'Bicicletta', '16:00-00:00', DEFAULT, '002'),
	('CRDMHL99A10B963H', 'Michele', 'Cordaro', 'Via De Stefano, 20, 80030, CAPUA, CASERTA', '1999-01-10', 'CASERTA', 'M', '6543210987', 'Motoveicolo', '16:00-00:00', DEFAULT, '002'),
	('TSTNGL97L15G964R', 'Angelo', 'Testa', 'Via Campo, 20, 80030, NAPOLI, CASERTA', '1997-07-15', 'POZZUOLI', 'M', '2109876543', 'Autoveicolo', '16:00-00:00', DEFAULT, '002'),
	('MLLMRC91S52C188Y', 'Mariarca', 'Maiello', 'Via Cisterna, 20, 80030, MADDALONI, NAPOLI', '1991-11-12', 'CASTELLO DI CISTERNA', 'F', '5432109876', 'Autoveicolo', '18:00-02:00', DEFAULT, '003'),
	('MIOCMN90C29G812U', 'Carmine', 'Ioime', 'Via Trivice, 30L, 84059, CAMEROTA, SALERNO', '29/03/1990', 'POMIGLIANO D''ARCO', 'M', '1112223334', 'Autoveicolo', '08:00-16:00', DEFAULT, '003'),
	('NPLCMN01P70G964X', 'Carmen', 'Napolitano', 'Via Stens, 20, 80030, AMALFI, SALERNO', '2001-09-30', 'Pozzuoli', 'F', '1098765432', 'Motoveicolo', '18:00-02:00', DEFAULT, '003');

--Popolazione Supply
INSERT INTO Supply
VALUES
	('001', '0001'),
	('001', '0002'),
	('001', '0003'),
	('001', '0004'),
	('001', '0005'),
	('001', '0006'),
	('001', '0007'),
	('001', '0008'),
	('001', '0009'),
	('001', '0010'),
	('001', '0011'),
	('001', '0012'),
	('001', '0013'),
	('001', '0014'),
	('001', '0015'),
	('001', '0016'),
	('001', '0017'),
	('001', '0018'),
	('001', '0019'),
	('001', '0020'),

	('002', '0023'),
	('002', '0022'),
	('002', '0021'),
	('002', '0020'),
	('002', '0019'),
	('002', '0018'),
	('002', '0017'),
	('002', '0016'),
	('002', '0015'),
	('002', '0014'),
	('002', '0013'),
	('002', '0012'),
	('002', '0011'),

	('003', '0001'),
	('003', '0002'),
	('003', '0003'),
	('003', '0004'),
	('003', '0005'),
	('003', '0006'),
	('003', '0007'),
	('003', '0008'),
	('003', '0009'),
	('003', '0010'),
	('003', '0011'),
	('003', '0012'),
	('003', '0013'),
	('003', '0014'),
	('003', '0015'),
	('003', '0016'),
	('003', '0017'),
	('003', '0018'),
	('003', '0019'),
	('003', '0020'),
	('003', '0021'),
	('003', '0022'),
	('003', '0023');

--Popolazione CustomerOrder
CALL createOrder('Via Silvio Spaventa, 130, 84013, CAVA DE'' TIRRENI, SALERNO', 'Contrassegno', NULL, 'salerno@foodoverflow.it', 'arci.acci@gmail.com', 'Spaghetti e vongole, Cotoletta, Carne alla pizzaiola, Coca cola, Monoporzione red velvet', '2, 1, 1, 2, 1');
CALL createOrder('Via Silvio Spaventa, 130, 84013, CAVA DE'' TIRRENI, SALERNO', 'Contrassegno', NULL, 'salerno@foodoverflow.it', 'arci.acci@gmail.com', 'Pizza margherita, Panino kebab, Patatine Fritte grande, Coca cola', '1, 1, 1, 2');
CALL createOrder('Via Artica, 69, 80100, OTTAVIANO, SALERNO', 'Contrassegno', 'Campanello rotto', 'salerno@foodoverflow.it', 'scimmiartica@gmail.com', 'Gelato alla vaniglia, Gelato al cioccolato, Gelato a fragola', '1, 1, 1');
CALL createOrder('Via Artica, 69, 80100, OTTAVIANO, SALERNO', 'Contrassegno', 'Campanello rotto', 'salerno@foodoverflow.it', 'scimmiartica@gmail.com', 'Pizza margherita, Panino kebab, Panino hamburger, Coca cola, Bottiglina d''acqua naturale, Spritz', '4, 2, 2, 3, 2, 3');
CALL createOrder('Via Rolling Stones, 00, 84011, AMALFI, SALERNO', 'Contrassegno', 'terzo piano', 'salerno@foodoverflow.it', 'mickjagger@gmail.com', 'Spaghetti alla carbonara, Bottiglina d''acqua naturale', '1, 1');
CALL createOrder('Via Rolling Stones, 00, 84011, AMALFI, SALERNO', 'Contrassegno', 'terzo piano', 'salerno@foodoverflow.it', 'mickjagger@gmail.com', 'Patatine Fritte grande, Spritz, Coca cola', '3, 1, 2');
CALL createOrder('Via Trivice, 30L, 84059, CAMEROTA, SALERNO', 'Contrassegno', NULL, 'salerno@foodoverflow.it', 'vpervendetta@gmail.com', 'Pizza margherita, Coca cola', '3, 3');
CALL createOrder('Via Trivice, 30L, 84059, CAMEROTA, SALERNO', 'Contrassegno', NULL, 'salerno@foodoverflow.it', 'vpervendetta@gmail.com', 'Costine al forno, Cotoletta, Bottiglina d''acqua naturale, Coca cola, Monoporzione red velvet', '1, 1, 1, 1, 2');
CALL createOrder('Via Partenope, 38, 81031, AVERSA, CASERTA', 'Contrassegno', NULL, 'caserta@foodoverflow.it', 'giuliana.musc@gmail.com', 'Pennette all''arrabbiata', '1');
CALL createOrder('Via Partenope, 38, 81031, AVERSA, CASERTA', 'Contrassegno', NULL, 'caserta@foodoverflow.it', 'giuliana.musc@gmail.com', 'Brodo di tortellini, Baccalà fritto, Bottiglina d''acqua naturale', '1, 1, 1');
CALL createOrder('Via Stens, 54, 81043, CAPUA, CASERTA', 'Contrassegno', NULL, 'caserta@foodoverflow.it', 'napolitan@gmail.com', 'Insalata di polpo e patate, Monoporzione red velvet', '1, 1');
CALL createOrder('Via Stens, 54, 81043, CAPUA, CASERTA', 'Contrassegno', NULL, 'caserta@foodoverflow.it', 'napolitan@gmail.com', 'Spaghetti e vongole, Salmone croccante', '2, 1');
CALL createOrder('Via Scarpati, 11A, 80145, NAPOLI, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'vittor@gmail.com', 'Patatine fritte piccola, Panino hamburger, Spritz', '1, 2, 2');
CALL createOrder('Via Scarpati, 11A, 80145, NAPOLI, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'vittor@gmail.com', 'Patatine Fritte media, Cotoletta, Coca cola, Gelato al cioccolato', '2, 2, 2, 2');
CALL createOrder('Via del Rito, 20, 80132, POZZUOLI, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'pasq@gmail.com', 'Cotoletta, Costine al forno, Carne alla pizzaiola, Salmone croccante, Patatine Fritte grande, Monoporzione red velvet, Coca cola, Bottiglina d''acqua naturale, Spritz', '2, 1, 1, 2, 3, 6, 2, 2, 2');
CALL createOrder('Via del Rito, 20, 80132, POZZUOLI, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'pasq@gmail.com', 'Panino kebab, Coca cola', '4, 4');
CALL createOrder('Piazza del Duomo, 68 Z, 80133, CASAVATORE, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'marik.savino@gmail.com', 'Pizza margherita, Panino hamburger, Coca cola, Monoporzione red velvet', '2, 1, 3, 2');
CALL createOrder('Piazza del Duomo, 68 Z, 80133, CASAVATORE, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'marik.savino@gmail.com', 'Pennette all''arrabbiata, Cotoletta, Carne alla pizzaiola', '2, 1, 1');
CALL createOrder('Via Avella, 99, 80100, BACOLI, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'n.trinchese@gmail.com', 'Baccalà fritto, Bottiglina d''acqua naturale, Monoporzione red velvet', '1, 1, 2');
CALL createOrder('Via Sicura, 3, 80129, PORTICI, NAPOLI', 'Contrassegno', NULL, 'napoli@foodoverflow.it', 'fioccolandia@gmail.com', 'Spaghetti e vongole, Bottiglina d''acqua naturale', '1, 1');


UPDATE CustomerOrder SET rider_cf='MIOCMN90C29G812U' WHERE id='000000000013';
UPDATE CustomerOrder SET rider_cf='MIOCMN90C29G812U' WHERE id='000000000013';
UPDATE CustomerOrder SET rider_cf='DLRFNC93C03H703Q' WHERE id='000000000017';
UPDATE CustomerOrder SET rider_cf='MNDVLR96C63F924G' WHERE id='000000000020';
UPDATE CustomerOrder SET rider_cf='LTRMRA96A58F839V' WHERE id='000000000009';
UPDATE CustomerOrder SET rider_cf='CRDMHL99A10B963H' WHERE id='000000000010';
UPDATE CustomerOrder SET rider_cf='TSTNGL97L15G964R' WHERE id='000000000011';
UPDATE CustomerOrder SET rider_cf='TRCLGU88E11A509X' WHERE id='000000000001';
UPDATE CustomerOrder SET rider_cf='MLLMRC91S52C188Y' WHERE id='000000000003';
UPDATE CustomerOrder SET rider_cf='NPLCMN01P70G964X' WHERE id='000000000007';


UPDATE CustomerOrder SET delivery_time=current_time, status='Consegnato' WHERE id='000000000017';
UPDATE CustomerOrder SET delivery_time=current_time, status='Consegnato' WHERE id='000000000017';
UPDATE CustomerOrder SET delivery_time=current_time, status='Errore' WHERE id='000000000020';
UPDATE CustomerOrder SET delivery_time=current_time, status='Consegnato' WHERE id='000000000009';
UPDATE CustomerOrder SET delivery_time=current_time, status='Consegnato' WHERE id='000000000010';
UPDATE CustomerOrder SET delivery_time=current_time, status='Errore' WHERE id='000000000003';