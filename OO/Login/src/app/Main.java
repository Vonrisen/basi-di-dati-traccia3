package app;
import java.awt.EventQueue;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daos_implementation.RiderDAOPostgresImplementation;
import daos_implementation.ShopDAOPostgresImplementation;
import daos_interfaces.RiderDAO;
import daos_interfaces.ShopDAO;
import db_connection.DBconnection_CodiceCatastale;
import entities.Rider;
import entities.Shop;


public class Main {
	
	public static void main(String[] args) {
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					RiderDAO rider = new RiderDAOPostgresImplementation();
					List<Rider>riders = new ArrayList<Rider>();
					riders = rider.getRidersOfAShop("003");
					for(Rider r: riders)
					{
						System.out.println(r.getName());
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
}
