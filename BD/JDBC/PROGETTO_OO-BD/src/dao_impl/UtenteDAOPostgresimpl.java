package dao_impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daos.UtenteDAO;
import entities.Persona;
import entities.Utente;

public class UtenteDAOPostgresimpl implements UtenteDAO {
	
	   private Connection connection;
	   private PreparedStatement getUtenteByNomePS, insertIntoPersonaPS, insertIntoUtentePS, utenteJoinPersonaPS;

	    public UtenteDAOPostgresimpl(Connection connection) throws SQLException {
	        this.connection=connection;
	        getUtenteByNomePS = connection.prepareStatement("SELECT * FROM Utente AS U JOIN Persona AS P ON U.cf=P.cf WHERE P.nome like ?");
	        insertIntoPersonaPS = connection.prepareStatement("INSERT INTO Persona VALUES (?,?,?,?,?,?,?,?)");
	        insertIntoUtentePS = connection.prepareStatement("INSERT INTO Utente VALUES (DEFAULT,?,?,?,?)");
	        utenteJoinPersonaPS = connection.prepareStatement("SELECT * FROM Persona AS P NATURAL JOIN Utente AS U");
	    }
	    
//	    public List<Utente> getUtenteByNome(String name) throws SQLException
//	    {
//	        getUtenteByNomePS.setString(1, name);
//	        ResultSet rs= getUtenteByNomePS.executeQuery();
//	        List<Utente> lista = new ArrayList<Utente>();
//	        while(rs.next())
//	        {
//	            Utente s = new Utente(rs.getString("cf"), rs.getString("nome"), rs.getString("cognome"), rs.getString("residenza"), rs.getDate("data_n"), rs.getString("luogo_n"), rs.getString("sesso"), rs.getString("cellulare"), rs.getString("cod_utente"));
//	            lista.add(s);
//	            System.out.println(rs.getString("cf")+ rs.getString("nome") + rs.getString("cognome") + rs.getString("residenza") + rs.getDate("data_n")+ rs.getString("luogo_n")+ rs.getString("sesso") + rs.getString("cellulare")+ rs.getString("cod_utente"));
//	        }
//	        rs.close();
//	        getUtenteByNomePS.close();
//	        return lista;
//	    }
//	    
	    public void insertPersona(Utente u) throws SQLException
	    {
	    	insertIntoPersonaPS.setString(1,u.getCodice_fiscale());
	    	insertIntoPersonaPS.setString(2,u.getNome());
	    	insertIntoPersonaPS.setString(3,u.getCognome());
	    	insertIntoPersonaPS.setString(4,u.getIndirizzo());
	    	insertIntoPersonaPS.setDate(5,(Date) u.getData_n());
	    	insertIntoPersonaPS.setString(6,u.getLuogo_n());
	    	insertIntoPersonaPS.setString(7,u.getSesso());
	    	insertIntoPersonaPS.setString(8,u.getCellulare());
	    	
	    	int row = insertIntoPersonaPS.executeUpdate();
	    	if(row==1)
	    	 System.out.println("Inserimento in persona avvenuto con successo");
	    	else
	    	 System.out.println("Errore inserimento in persona");
	    	insertIntoPersonaPS.close();
	    
	    }
	    
	    public  void insertUtente(Utente u) throws SQLException
	    {
	  
	    	
	    	insertIntoUtentePS.setString(1,u.getEmail());
	    	insertIntoUtentePS.setString(2,u.getPassword());
	    	insertIntoUtentePS.setString(3,u.getFlag());
	    	insertIntoUtentePS.setString(4, u.getCodice_fiscale());
	    	int row = insertIntoUtentePS.executeUpdate();
	    	if(row==1)
		    	 System.out.println("Inserimento in utente avvenuto con successo");
		    	else
		    	 System.out.println("Errore inserimento in utente");
	    	insertIntoUtentePS.close();
	    }
	    
	    public void UtenteJoinPersona() throws SQLException {
	    	
	    	ResultSet rs = utenteJoinPersonaPS.executeQuery();
	    	
	    	while(rs.next()) {
	    		
	    		System.out.println(rs.getString("cf") + "	 "+ rs.getString("nome") + " 	"+ rs.getString("cognome") + " 		"+ rs.getString("residenza")+ "		 " +
	    				rs.getDate("data_n")+ " 	"+ rs.getString("luogo_n")+ " 	"+ rs.getString("sesso") + " 	" + rs.getString("cellulare") + " 	"+ rs.getString("cod_utente") + " 	"+ rs.getString("email") + " 	"+ 
	    				rs.getString("password")+ " 	" + rs.getString("flag"));
	    		System.out.println("\n");
	    	}
	    	
	    	rs.close();
	    	utenteJoinPersonaPS.close();
	    	
	    }

		
	    
	    

	
	
}
