package entities;

import java.util.ArrayList;
import java.util.Date;

public class Utente extends Persona {

	private String codice_utente;
	private String email;
	private String password;
	private String flag;
	private ArrayList<Ordine> lista_ordini = new ArrayList<Ordine>();
	private Carrello carrello;
	public Utente(String cf, String nome, String cognome, String indirizzo, Date data_n, String luogo_n, String sesso,
			String cellulare,String codice_utente, String email, String password, String flag) {
		super(cf, nome, cognome, indirizzo, data_n, luogo_n, sesso, cellulare);
		this.email=email;
		this.password=password;
		this.flag=flag;
		this.codice_utente = codice_utente;
	}
	
	public String getCodice_utente() {
		return codice_utente;
	}
	public void setCodice_utente(String cod_utente) {
		this.codice_utente = cod_utente;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "Utente [codice_utente=" + codice_utente + ", email=" + email + ", password=" + password + ", flag="
				+ flag + ", lista_ordini=" + lista_ordini + ", carrello=" + carrello + "]";
	}
}
