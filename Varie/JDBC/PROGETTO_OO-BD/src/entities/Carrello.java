package entities;

import java.util.ArrayList;

public class Carrello {​​​​

   private String codice_carrello;
   private char completo;
   private Utente utente;
   private ArrayList<ComposizioneCarrello> composizione_carrello = new ArrayList<ComposizioneCarrello>();
   public Carrello(String cod_carrello, char completo, Utente utente) {​​​​
       super();
       this.codice_carrello = codice_carrello;
       this.completo = completo;
       this.utente = utente;
   }​​​​

   public String getCodice_carrello() {​​​​
       return codice_carrello;
   }​​​​

   public void setCodice_carrello(String codice_carrello) {​​​​
       this.codice_carrello = codice_carrello;
   }​​​​

   public char getCompleto() {​​​​
       return completo;
   }​​​​

   public void setCompleto(char completo) {​​​​
       this.completo = completo;
   }​​​​

   public Utente getUtente() {​​​​
       return utente;
   }​​​​

   public void setUtente(Utente utente) {​​​​
       this.utente = utente;
   }​​​​

}​​​​