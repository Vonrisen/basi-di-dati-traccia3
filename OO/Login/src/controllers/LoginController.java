package controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;
import javax.swing.JTable;

import daos.ShopDAO;
import daos_implementation.ShopDAOPostgresImplementation;
import entities.Shop;
import gui.AdminFrame;
import net.proteanit.sql.DbUtils;

public class LoginController{
	
	Connection connection;
	public LoginController(Connection connection, JFrame frame) {
		super();
		this.connection = connection;
	}
	public void displayShops(Connection connection) throws SQLException
	{
//FUNZIONA SOLO COL DATABASE CONNESSO		
//		AdminFrame admin_frame = new AdminFrame();
//		admin_frame.setVisible(true);
//		ShopDAO shop = new ShopDAOPostgresImplementation(connection);
//		ResultSet all_shops_result_set = shop.getAllShops();
//		admin_frame.getTable().setModel(DbUtils.resultSetToTableModel(all_shops_result_set));
		return;
	}
}
