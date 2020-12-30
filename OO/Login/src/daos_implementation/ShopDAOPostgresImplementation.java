package daos_implementation;

import java.sql.CallableStatement;
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
	private CallableStatement insert_shop_CS, delete_shop_CS;
	public ShopDAOPostgresImplementation(Connection connection) throws SQLException
	{
		this.connection = connection;
		print_all_shops_PS = connection.prepareStatement("SELECT * FROM SHOP");
		insert_shop_CS = connection.prepareCall("CALL insertShop(?,?,?");
		delete_shop_CS = connection.prepareCall("CALL DeleteShop(?)");
	}
	public ResultSet getAllShops() throws SQLException {
		
		ResultSet rs = print_all_shops_PS.executeQuery();
		return rs;
	}
	
	public void insertShop(Shop shop) throws SQLException {
		
		insert_shop_CS.setString(1, shop.getName());
		insert_shop_CS.setFloat(2, shop.getPrice());
		insert_shop_CS.setString(3, shop.getDescription());
		insert_shop_CS.executeUpdate();
		return;
	}
	
	
	public void deleteShop(Shop shop) throws SQLException {
		delete_shop_CS.setString(1, shop.getMeal_id());
		delete_shop_CS.executeUpdate();
		return;
	}
}
