package daos;
import entities.Utente;
import java.sql.SQLException;
import java.util.List;

public interface UtenteDAO {
	
	 public void UtenteJoinPersona () throws SQLException;
	 public void insertPersona(Utente u) throws SQLException;
	 public void insertUtente(Utente u) throws SQLException;
	 public List<Utente> getUtenteByNome(String name) throws SQLException;
	 public boolean validaLoginUtente(String email, String password) throws SQLException;
}
