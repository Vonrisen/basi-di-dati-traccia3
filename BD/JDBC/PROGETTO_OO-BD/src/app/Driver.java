package app;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import dao_impl.UtenteDAOPostgresimpl;
import java.sql.SQLException;
import db_config.DBconnection;
import entities.Utente;
import gui.frame_login;
import daos.UtenteDAO;
public class Driver {

	public static void main(String[] args) {
		
	    DBconnection dbconn = null;
        Connection connection = null;
        List<Utente>lista_utenti_per_nome = new ArrayList<Utente>();
        try
        {
            dbconn = DBconnection.getInstance();
            connection = dbconn.getConnection();
            UtenteDAO dao = new UtenteDAOPostgresimpl(connection);
            try {
				frame_login frame = new frame_login(dao);
				frame.setVisible(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
            
        } catch (SQLException e)
        {
        	System.out.println("SQL error: "+e.getMessage());
        }
        
}

}
