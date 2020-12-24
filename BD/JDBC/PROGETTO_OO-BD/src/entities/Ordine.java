package entities;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Ordine {
	
	private String codice_ordine;
	private Timestamp data_ordine;
	private Time ora_consegna;
	private String indirizzo;
	private String[] stato_consegna = {"In attesa", "In consegna", "Consegnato", "Errore"};
	private String note;
	private Rider rider;
	private Negozio negozio;
	private Utente utente;
	private ArrayList<ComposizioneOrdine> composizione_ordine = new ArrayList<ComposizioneOrdine>();
	public Ordine(String cod_ordine, Timestamp data_ordine, Time ora_consegna, String indirizzo,
			String[] stato_consegna, String note, Rider rider, Negozio negozio, Utente utente) {
		super();
		this.codice_ordine = cod_ordine;
		this.data_ordine = data_ordine;
		this.ora_consegna = ora_consegna;
		this.indirizzo = indirizzo;
		this.stato_consegna = stato_consegna;
		this.note = note;
		this.rider = rider;
		this.negozio = negozio;
		this.utente = utente;
	}
	public String getCodice_ordine() {
		return codice_ordine;
	}
	public void setCodice_ordine(String cod_ordine) {
		this.codice_ordine = cod_ordine;
	}
	public Timestamp getData_ordine() {
		return data_ordine;
	}
	public void setData_ordine(Timestamp data_ordine) {
		this.data_ordine = data_ordine;
	}
	public Time getOra_consegna() {
		return ora_consegna;
	}
	public void setOra_consegna(Time ora_consegna) {
		this.ora_consegna = ora_consegna;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String[] getStato_consegna() {
		return stato_consegna;
	}
	public void setStato_consegna(String[] stato_consegna) {
		this.stato_consegna = stato_consegna;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Rider getRider() {
		return rider;
	}
	public void setRider(Rider rider) {
		this.rider = rider;
	}
	public Negozio getNegozio() {
		return negozio;
	}
	public void setNegozio(Negozio negozio) {
		this.negozio = negozio;
	}
	public Utente getUtente() {
		return utente;
	}
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	
	
}
