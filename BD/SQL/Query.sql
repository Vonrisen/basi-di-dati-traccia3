-- Carrello Creazione tabella
CREATE SEQUENCE seq_Carrello; 

CREATE TABLE Carrello( 

	cod_carrello CHAR(16) PRIMARY KEY DEFAULT to_char(nextval('seq_carrello'),'0000000000000000'), 
	completo CHAR(1) NOT NULL, 
	cod_utente CHAR(10), 

	CONSTRAINT fk_Carrello FOREIGN KEY(cod_utente) REFERENCES Utente(cod_utente) ON DELETE CASCADE ON UPDATE CASCADE 

)

-- Persona creazione tabella
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

-- Rider creazione tabella
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

-- Utente creazione tabella
CREATE SEQUENCE seq_Utente; 

CREATE TABLE Utente( 

	cod_utente CHAR(10) PRIMARY KEY DEFAULT to_char(nextval('seq_Utente'),'U000000000FM'), 
	email VARCHAR(320) NOT NULL UNIQUE, 
	password VARCHAR(32) NOT NULL, 
	flag CHAR(1) NOT NULL, 
	cf CHAR(16), 

	CONSTRAINT fk_Utente FOREIGN KEY(cf) REFERENCES Persona(cf) ON DELETE CASCADE ON UPDATE CASCADE 

)

-- Ordine creazione tabella

CREATE TABLE Ordine(

	cod_ordine CHAR(16) PRIMARY KEY,
	data TIMESTAMP NOT NULL,
	cod_utente CHAR(10),

	CONSTRAINT fk_Ordine FOREIGN KEY(cod_utente) REFERENCES Utente(cod_utente) ON UPDATE CASCADE

 )

-- Negozio creazione tabella

CREATE SEQUENCE seq_Negozio;

 CREATE TABLE Negozio(

	cod_negozio CHAR(3) PRIMARY KEY DEFAULT to_char(nextval('seq_Negozio'),'000'),
	nome VARCHAR(32) NOT NULL,
	indirizzo VARCHAR(255) NOT NULL,
	orario CHAR(11),
	giorno_chiusura VARCHAR(56)

 )