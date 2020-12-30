package daos_implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import daos.ShopDAO;
import db_connection.DBconnection;
import entities.Shop;

public class ShopDAOPostgresImplementation implements ShopDAO {
	
	private Connection connection;
	private PreparedStatement print_all_shops_PS;
	public ShopDAOPostgresImplementation(Connection connection) throws SQLException
	{
		this.connection = connection;
		print_all_shops_PS = connection.prepareStatement("SELECT * FROM SHOP");
	}
	public ResultSet getAllShops() throws SQLException {
		
		ResultSet rs = print_all_shops_PS.executeQuery();
		return rs;
	}

}
