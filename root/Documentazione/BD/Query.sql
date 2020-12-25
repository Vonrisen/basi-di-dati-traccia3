-- TABELLA SCORTA
CREATE TABLE Scorta(

	cod_negozio CHAR(3),
	cod_alimento CHAR(6),
	quantita SMALLINT NOT NULL,

	PRIMARY KEY(cod_negozio, cod_alimento),
	FOREIGN KEY (cod_negozio) REFERENCES Negozio(cod_negozio) ON DELETE CASCADE,
	FOREIGN KEY (cod_alimento) REFERENCES Alimento(cod_alimento) ON DELETE CASCADE
	
)


-- TABELLA COMPORDINE
CREATE TABLE CompOrdine(

	cod_ordine CHAR(16),
	cod_alimento CHAR(6),
	quantita SMALLINT NOT NULL,

	PRIMARY KEY(cod_ordine, cod_alimento),
	FOREIGN KEY (cod_ordine) REFERENCES Ordine(cod_ordine) ON DELETE CASCADE,
	FOREIGN KEY (cod_alimento) REFERENCES Alimento(cod_alimento)
	
)


-- TABELLA COMPCARRELLO
CREATE TABLE CompCarrello(

	cod_carrello CHAR(16),
	cod_alimento CHAR(6),
	quantita SMALLINT NOT NULL,

	PRIMARY KEY(cod_carrello, cod_alimento),
	FOREIGN KEY (cod_carrello) REFERENCES Carrello(cod_carrello) ON DELETE CASCADE,
	FOREIGN KEY (cod_alimento) REFERENCES Alimento(cod_alimento) ON DELETE CASCADE
	
)


-- TABELLA CONTRATTO
CREATE TABLE Contratto(

	cod_rider CHAR(5),
	cod_negozio CHAR(3),
	
	PRIMARY KEY (cod_rider,cod_negozio),
	FOREIGN KEY (cod_rider) REFERENCES Rider(cod_rider) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (cod_negozio) REFERENCES Negozio(cod_negozio) ON DELETE CASCADE ON UPDATE CASCADE
	
)


-- TABELLA COMPALIMENTO
CREATE TABLE CompAlimento( 

	cod_alimento CHAR(8), 
	t_allergene TipoAllergene, 

	PRIMARY KEY(cod_alimento,t_allergene), 
	FOREIGN KEY (cod_alimento) REFERENCES Alimento(cod_alimento) ON DELETE CASCADE, 
	FOREIGN KEY (t_allergene) REFERENCES Allergene(t_allergene) 

) 

-- TABELLA ALLERGENE
CREATE TYPE TipoAllergene AS ENUM ('Cereali e derivati', 'Crostacei', 'Uova', 'Pesce', 'Arachidi', 'Soia', 'Latte', 'Frutta a guscio', 'Sedano', 'Senape', 'Anidride solforosa e solfiti', 'Lupini', 'Molluschi');
CREATE TABLE Allergene( 

	t_allergene TipoAllergene PRIMARY KEY 

) 


-- TABELLA ALIMENTO
CREATE TABLE Alimento( 

	cod_alimento CHAR (6) PRIMARY KEY, 
	nome VARCHAR (32) NOT NULL UNIQUE, 
	prezzo REAL NOT NULL, 
	descrizione VARCHAR(255) 

) 


-- TABELLA ORDINE
CREATE TYPE StatoConsegna AS ENUM ('In attesa','In consegna','Consegnato','Errore');
CREATE TABLE Ordine(

	cod_ordine CHAR(16) PRIMARY KEY,
	data_ordine TIMESTAMP NOT NULL,
	ora_consegna TIME,
	indirizzo VARCHAR(255) NOT NULL,
	stato StatoConsegna NOT NULL DEFAULT 'In attesa',
	note VARCHAR(255),
	cod_rider CHAR(5),
	cod_negozio CHAR(3),
	cod_utente CHAR(10),
	
	FOREIGN KEY(cod_rider) REFERENCES Rider(cod_rider),
	FOREIGN KEY(cod_negozio) REFERENCES Negozio(cod_negozio),
	FOREIGN KEY(cod_utente) REFERENCES Utente(cod_utente)
	
)


-- TABELLA CARRELLO
CREATE SEQUENCE seq_Carrello; 

CREATE TABLE Carrello( 

	cod_carrello CHAR(16) PRIMARY KEY DEFAULT to_char(nextval('seq_carrello'),'0000000000000000'), 
	completo CHAR(1) NOT NULL, 
	cod_utente CHAR(10), 

	CONSTRAINT fk_Carrello FOREIGN KEY(cod_utente) REFERENCES Utente(cod_utente) ON DELETE CASCADE ON UPDATE CASCADE 

)


-- TABELLA PERSONA
CREATE TABLE Persona( 

	cf CHAR(16), 
	nome VARCHAR(30) NOT NULL, 
	cognome VARCHAR(30) NOT NULL, 
	residenza VARCHAR(255) NOT NULL, 
	data_n DATE NOT NULL, 
	luogo_n VARCHAR(25) NOT NULL, 
	sesso CHAR(1) NOT NULL, 
	cellulare CHAR(10) NOT NULL, 

	CONSTRAINT pk_Persona PRIMARY KEY (cf) 

)


-- TABELLA RIDER
CREATE TYPE TipoVeicolo AS ENUM ('Bicicletta', 'Motoveicolo', 'Autovettura');
CREATE SEQUENCE seq_Rider; 
CREATE TABLE Rider( 

	cod_rider CHAR(5) PRIMARY KEY DEFAULT to_char(nextval ('seq_rider'),'R0000FM'), 
	email VARCHAR(320) NOT NULL UNIQUE, 
	password VARCHAR(32) NOT NULL, 
	veicolo TipoVeicolo NOT NULL, 
	fascia_oraria CHAR(11) NOT NULL, 
	n_consegne SMALLINT NOT NULL, 
	cf CHAR(16), 

	CONSTRAINT fk_Rider FOREIGN KEY (cf) REFERENCES Persona(cf) ON DELETE CASCADE ON UPDATE CASCADE 

) 


-- TABELLA UTENTE
CREATE SEQUENCE seq_Utente; 

CREATE TABLE Utente( 

	cod_utente CHAR(10) PRIMARY KEY DEFAULT to_char(nextval('seq_Utente'),'U000000000FM'), 
	email VARCHAR(320) NOT NULL UNIQUE, 
	password VARCHAR(32) NOT NULL, 
	flag CHAR(1) NOT NULL, 
	cf CHAR(16), 

	CONSTRAINT fk_Utente FOREIGN KEY(cf) REFERENCES Persona(cf) ON DELETE CASCADE ON UPDATE CASCADE 

)


-- TABELLA NEGOZIO
CREATE SEQUENCE seq_Negozio;

 CREATE TABLE Negozio(

	cod_negozio CHAR(3) PRIMARY KEY DEFAULT to_char(nextval('seq_Negozio'),'000'),
	nome VARCHAR(32) NOT NULL,
	indirizzo VARCHAR(255) NOT NULL,
	orario CHAR(11),
	giorno_chiusura VARCHAR(56)

 )



--TRIGGER E FUNCTION PER CREARE UN ORDINE


CREATE TRIGGER crea_ordine
AFTER UPDATE ON Carrello
FOR EACH ROW
WHEN (OLD.completo='n' AND NEW.completo='s')
EXECUTE PROCEDURE crea_ordine();


CREATE OR REPLACE FUNCTION crea_ordine() RETURNS trigger AS $crea_ordine$
DECLARE
/* Inizializzare indirizzo, note, cod_rider, cod_negozio*/
BEGIN
INSERT INTO Ordine (cod_ordine,cod_utente, data_ordine,indirizzo ,note , cod_rider, cod_negozio)
VALUES(NEW.cod_carrello,NEW.cod_utente,current_timestamp,indirizzo ,note ,cod_rider, cod_negozio);
INSERT INTO CompOrdine (SELECT * FROM CompCarrello WHERE cod_carrello=NEW.cod_carrello);
UPDATE Scorta AS S
SET quantita = S.quantita - C.quantita
FROM CompOrdine AS C
WHERE S.cod_alimento = C.cod_alimento AND C.cod_ordine=NEW.cod_carrello AND S.cod_negozio = cod_negozio;
DELETE FROM Carrello WHERE cod_carrello=NEW.cod_carrello;
RETURN NEW;
END;
$crea_ordine$ LANGUAGE plpgsql;

