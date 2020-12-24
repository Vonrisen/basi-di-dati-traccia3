package app;
import java.sql.Connection;

import java.sql.Date;
import java.util.List;

import dao_impl.UtenteDAOPostgresimpl;

import java.sql.SQLException;
import dbconfig.DBconnection;
import entities.Utente;
import daos.UtenteDAO;
public class Driver {

	public static void main(String[] args) {
		
	    DBconnection dbconn = null;
        Connection connection = null;
        try
        {
            dbconn = DBconnection.getInstance();
            connection = dbconn.getConnection();
            System.out.println("Connessione riuscita");
            UtenteDAO dao=null;
            dao = new UtenteDAOPostgresimpl(connection);
        Utente u = new Utente("ddd4439990a44ded","Cataccoo","Ficiatano","via bevilacqua",Date.valueOf("2037-02-09"),"pornhub","m","3664657733","bevialcqua@ddd.x","31tkke31ked","g");
        dao.insertPersona(u);
        dao.insertUtente(u);
        dao.UtenteJoinPersona();
        
     
        } catch (SQLException e)
        {
        	System.out.println("SQL error: "+e.getMessage());
        }
        
}

}
