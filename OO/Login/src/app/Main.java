package app;
import java.awt.EventQueue;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

import daos_implementation.RiderDAOPostgresImplementation;
import daos_interfaces.RiderDAO;
import entities.OrderComposition;
import entities.Rider;
import entities.Shop;


public class Main {
	
	public static void main(String[] args) {
		
		ArrayList<Rider> riders = null;
		RiderDAO rider_dao = new RiderDAOPostgresImplementation();
		try {
			riders = rider_dao.getAllRiders();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(riders.get(1).getAddress().getName());
	}
	
}
