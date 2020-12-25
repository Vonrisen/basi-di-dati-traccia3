package entities;

import java.util.ArrayList;
import java.util.Date;

public class Rider extends Persona {

	private String cod_rider;
	private String[] veicolo = {"Bicicletta","Autovettura","Motoveicolo"};
	private String email;
	private String password;
	private String fascia_oraria;
	private String numero_consegna;
	private ArrayList<Negozio> lista_negozi = new ArrayList<Negozio>();
	private ArrayList<Ordine> lista_ordini = new ArrayList<Ordine>();
	public String getCod_rider() {
		return cod_rider;
	}
	public void setCod_rider(String cod_rider) {
		this.cod_rider = cod_rider;
	}
	public String[] getVeicolo() {
		return veicolo;
	}
	public void setVeicolo(String[] veicolo) {
		this.veicolo = veicolo;
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
	public String getFascia_oraria() {
		return fascia_oraria;
	}
	public void setFascia_oraria(String fascia_oraria) {
		this.fascia_oraria = fascia_oraria;
	}
	public String getNumero_consegna() {
		return numero_consegna;
	}
	public void setNumero_consegna(String n_consegna) {
		this.numero_consegna = n_consegna;
	}
	public ArrayList<Negozio> getLista_negozi() {
		return lista_negozi;
	}
	public void setLista_negozi(ArrayList<Negozio> lista_negozi) {
		this.lista_negozi = lista_negozi;
	}
	

}
