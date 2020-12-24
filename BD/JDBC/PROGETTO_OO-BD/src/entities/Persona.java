package entities;

import java.util.Date;

public abstract class Persona {
	
	private String codice_fiscale;
	private String nome;
	private String cognome;
	private String indirizzo;
	private Date data_n;
	private String luogo_n;
	private String sesso;
	private String cellulare;
	public Persona(String cf, String nome, String cognome, String indirizzo, Date data_n, String luogo_n, String sesso,
		   String cellulare) {
		super();
		this.codice_fiscale = cf;
		this.nome = nome;
		this.cognome = cognome;
		this.indirizzo = indirizzo;
		this.data_n = data_n;
		this.luogo_n = luogo_n;
		this.sesso = sesso;
		this.cellulare = cellulare;
	}
	public String getCodice_fiscale() {
		return codice_fiscale;
	}
	public void setCodice_fiscale(String cf) {
		this.codice_fiscale = cf;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public Date getData_n() {
		return data_n;
	}
	public void setData_n(Date data_n) {
		this.data_n = data_n;
	}
	public String getLuogo_n() {
		return luogo_n;
	}
	public void setLuogo_n(String luogo_n) {
		this.luogo_n = luogo_n;
	}
	public String getSesso() {
		return sesso;
	}
	public void setSesso(String sesso) {
		this.sesso = sesso;
	}
	public String getCellulare() {
		return cellulare;
	}
	public void setCellulare(String cellulare) {
		this.cellulare = cellulare;
	}
	
}
