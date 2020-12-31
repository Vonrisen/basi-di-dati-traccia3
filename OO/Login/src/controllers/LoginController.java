package controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFrame;
import javax.swing.JTable;

import daos_implementation.MealDAOPostgresImplementation;
import daos_interfaces.MealDAO;
import gui.AdminFrame;
import net.proteanit.sql.DbUtils;

public class LoginController{
	
	Connection connection;
	public LoginController(Connection connection) {
		super();
		this.connection = connection;
	}
	public void displayShops(Connection connection) throws SQLException
	{
	
//		AdminFrame admin_frame = new AdminFrame();
//		admin_frame.setVisible(true);
//		MealDAO meal = new MealDAOPostgresImplementation(connection);
//		ResultSet all_shops_result_set = meal.getAllShops();
//		admin_frame.getTable().setModel(DbUtils.resultSetToTableModel(all_shops_result_set));
//		return;
	}
	
	
}
