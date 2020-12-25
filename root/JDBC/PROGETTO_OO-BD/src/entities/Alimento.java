package entities;

import java.util.ArrayList;

public class Alimento {
	
	private String codice_alimento;
	private String nome;
	private float prezzo;
	private String descrizione;
	private ArrayList<String> lista_allergeni = new ArrayList<String>();
	private ArrayList<Scorta> lista_scorta = new ArrayList<Scorta>();
	private ArrayList<ComposizioneOrdine> composizione_ordine = new ArrayList<ComposizioneOrdine>();
	
}
