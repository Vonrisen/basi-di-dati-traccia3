package daos_implementation;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;
import daos_interfaces.RiderDAO;
import daos_interfaces.ShopDAO;
import db_connection.DBconnection;
import entities.Address;
import entities.Rider;
import entities.Shop;
import utilities.ConvertAddress;

public class RiderDAOPostgresImplementation implements RiderDAO {
	
	private Connection connection;
	PreparedStatement get_all_riders_PS;
	public RiderDAOPostgresImplementation() {
		
		try {
			DBconnection instance = DBconnection.getInstance();
			connection = instance.getConnection();
		}catch(SQLException s)
		{
			JOptionPane.showMessageDialog(null, "Errore di connessione");
		}
		try {
			
			get_all_riders_PS = connection.prepareStatement("SELECT cf, name, surname, address, birth_date, birth_place, gender, cellphone, vehicle, working_time, deliveries_number FROM Rider");
		
		}catch(SQLException s)
		{
			JOptionPane.showMessageDialog(null, "Errore durante il prepare degli statements");
		}
		

}

	public ArrayList<Rider>getAllRiders() throws SQLException
	{
		ResultSet rs = get_all_riders_PS.executeQuery();
		ArrayList<Rider> rider_list = new ArrayList<Rider>();
		String database_address;
		String delims;
		String[] tokens;
		Address address;
		Rider rider;
		while(rs.next())
		{

			rider = new Rider(rs.getString("cf"),rs.getString("name"),rs.getString("surname"), new Date(rs.getDate("birth_date").getTime()),rs.getString("birth_place"),rs.getString("gender"),
							rs.getString("cellphone"),ConvertAddress.stringAddressToObjectAddress(rs.getString("address"), ","),rs.getString("vehicle"),rs.getString("working_time"),rs.getShort("deliveries_number"));
			rider_list.add(rider);
		}
		return rider_list;
	}
	
}
