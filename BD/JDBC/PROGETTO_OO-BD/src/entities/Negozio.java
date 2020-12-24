package entities;

import java.util.ArrayList;

public class Negozio {
	
	private String codice_negozio;
	private String nome;
	private String indirizzo;
	private String orario;
	private String giorno_chiusura;
	private ArrayList<Rider> lista_riders = new ArrayList<Rider>();
	private ArrayList<Ordine> lista_ordini = new ArrayList<Ordine>();
	private ArrayList<Scorta> lista_scorta = new ArrayList<Scorta>();
	public Negozio(String cod_negozio, String nome, String indirizzo, String orario, String giorno_chiusura) {
		super();
		this.codice_negozio = cod_negozio;
		this.nome = nome;
		this.indirizzo = indirizzo;
		this.orario = orario;
		this.giorno_chiusura = giorno_chiusura;
	}
	public String getCodice_negozio() {
		return codice_negozio;
	}
	public void setCodice_negozio(String cod_negozio) {
		this.codice_negozio = cod_negozio;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getOrario() {
		return orario;
	}
	public void setOrario(String orario) {
		this.orario = orario;
	}
	public String getGiorno_chiusura() {
		return giorno_chiusura;
	}
	public void setGiorno_chiusura(String giorno_chiusura) {
		this.giorno_chiusura = giorno_chiusura;
	}
	public ArrayList<Rider> getLista_rider() {
		return lista_riders;
	}
	public void setLista_rider(ArrayList<Rider> lista_rider) {
		this.lista_riders = lista_rider;
	}
}
