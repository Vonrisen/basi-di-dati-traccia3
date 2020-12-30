package daos;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ShopDAO {
	
	public ResultSet getAllShops() throws SQLException;
	
}
