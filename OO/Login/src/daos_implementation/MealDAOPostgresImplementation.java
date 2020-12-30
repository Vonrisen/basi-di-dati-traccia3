package daos_implementation;

import java.sql.CallableStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import daos.MealDAO;
import daos.MealDAO;
import db_connection.DBconnection;
import entities.Meal;
import entities.Meal;

public class MealDAOPostgresImplementation implements MealDAO {
	
	private Connection connection;
	private PreparedStatement print_all_meals_PS;
	private CallableStatement insert_meal_CS, delete_meal_CS;
	public MealDAOPostgresImplementation(Connection connection) throws SQLException
	{
		this.connection = connection;
		print_all_meals_PS = connection.prepareStatement("SELECT * FROM MEAL");
		insert_meal_CS = connection.prepareCall("CALL insertMeal(?,?,?");
		delete_meal_CS = connection.prepareCall("CALL DeleteMeal(?)");
	}
	public ResultSet getAllShops() throws SQLException {
		
		ResultSet rs = print_all_meals_PS.executeQuery();
		return rs;
	}
	
	public void insertShop(Meal shop) throws SQLException {
		
		insert_meal_CS.setString(1, shop.getName());
		insert_meal_CS.setFloat(2, shop.getPrice());
		insert_meal_CS.setString(3, shop.getDescription());
		insert_meal_CS.executeUpdate();
		return;
	}
	
	
	public void deleteShop(Meal shop) throws SQLException {
		delete_meal_CS.setString(1, shop.getMeal_id());
		delete_meal_CS.executeUpdate();
		return;
	}
	@Override
	public void updateShop(Meal shop) throws SQLException {
		
	}
}
