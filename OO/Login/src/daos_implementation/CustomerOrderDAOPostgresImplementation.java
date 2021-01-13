package daos_implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import daos_interfaces.CustomerDAO;
import daos_interfaces.CustomerOrderDAO;
import daos_interfaces.OrderCompositionDAO;
import daos_interfaces.RiderDAO;
import daos_interfaces.ShopDAO;
import db_connection.DBconnection;
import entities.Customer;
import entities.CustomerOrder;
import entities.OrderComposition;
import entities.Rider;
import entities.Shop;

public class CustomerOrderDAOPostgresImplementation implements CustomerOrderDAO {
	
	private Connection connection;
	PreparedStatement get_orders_of_a_shop_PS, get_deliveries_of_a_rider_PS, get_customer_order_by_order_id_PS;
	public CustomerOrderDAOPostgresImplementation() {
		
		try {
			DBconnection instance = DBconnection.getInstance();
			connection = instance.getConnection();
		}catch(SQLException s)
		{
			JOptionPane.showMessageDialog(null, "Errore di connessione");
		}
		try {
			
			 get_orders_of_a_shop_PS = connection.prepareStatement("SELECT * FROM CustomerOrder WHERE shop_id=?");
			 get_deliveries_of_a_rider_PS = connection.prepareStatement("SELECT order_id, TO_CHAR(order_date,'DD/MM/YYYY'), delivery_time, address, status, payment, note, rider_cf,shop_id,customer_id "
			 														   + "FROM customerorder "
			 														   + "WHERE rider_cf=?");
			 get_customer_order_by_order_id_PS = connection.prepareStatement("SELECT * FROM CustomerOrder WHERE order_id=?");
			 
		}catch(SQLException s)
		{
			JOptionPane.showMessageDialog(null, "Errore durante il prepare degli statements");
		}
		

}
	@Override
	public List<CustomerOrder> getAllCustomerOrders() throws SQLException {

		return null;
	}
	@Override
	public int insertCustomerOrder(CustomerOrder customer_order) throws SQLException {

		return 0;
	}
	@Override
	public void updateCustomerOrder(CustomerOrder customer_order) throws SQLException {
		
		
	}
	@Override
	public List<CustomerOrder> getCustomerOrdersOfAShop(String shop_id) throws SQLException {
	
		List<CustomerOrder>order_list = new ArrayList<CustomerOrder>();
		RiderDAO rider_DAO = new RiderDAOPostgresImplementation();
		CustomerDAO customer_DAO = new CustomerDAOPostgresImplementation();
		OrderCompositionDAO order_composition_DAO = new OrderCompositionDAOPostgresImplementation();
		ShopDAO shop_DAO = new ShopDAOPostgresImplementation();
		get_orders_of_a_shop_PS.setString(1, shop_id);
		ResultSet rs = get_orders_of_a_shop_PS.executeQuery();
		Shop shop = shop_DAO.getShopById(shop_id);
		if (!rs.next())
			System.out.println("ciao");
		while(rs.next())
		{
			
			Rider rider = rider_DAO.getRiderOfTheOrder(rs.getString("order_id"));
			Customer customer = customer_DAO.getCustomerOfTheOrder(rs.getString("order_id"));
			List<OrderComposition> order_composition = order_composition_DAO.getOrderCompositionOfTheOrder(rs.getString("order_id"));
			CustomerOrder order = new CustomerOrder(rs.getString("order_id"),rs.getString("order_date"), rs.getString("delivery_time"), rs.getString("address"),rs.getString("status"),
												    rs.getString("payment"),rs.getString("note"), rider, shop, customer, order_composition);
			order_list.add(order);
			
		}
		return order_list;
	}
	@Override
	public List<CustomerOrder> getDeliveriesOfARider(String cf) throws SQLException {
		List<CustomerOrder>rider_deliveries = new ArrayList<CustomerOrder>();
		RiderDAO rider_DAO = new RiderDAOPostgresImplementation();
		ShopDAO shop_DAO = new ShopDAOPostgresImplementation();
		get_deliveries_of_a_rider_PS.setString(1, cf);
		CustomerDAO customer_DAO = new CustomerDAOPostgresImplementation();
		OrderCompositionDAO order_composition_DAO = new OrderCompositionDAOPostgresImplementation();
		ResultSet rs = get_deliveries_of_a_rider_PS.executeQuery();
		Rider rider = rider_DAO.getRiderByCf(cf);
		while(rs.next())
		{
			System.out.println(rs.getString("order_id"));
//			Shop shop = shop_DAO.getShopOfTheOrder(rs.getString("order_id"));
//			Customer customer = customer_DAO.getCustomerOfTheOrder(rs.getString("order_id"));
//			List<OrderComposition> order_composition = order_composition_DAO.getOrderCompositionOfTheOrder(rs.getString("order_id"));
//			CustomerOrder order = new CustomerOrder(rs.getString("order_id"),rs.getString("order_date"), rs.getString("delivery_time"), rs.getString("address"),rs.getString("status"),
//												    rs.getString("payment"),rs.getString("note"), rider, shop, customer, order_composition);
//			rider_deliveries.add(order);
		}
		
		return rider_deliveries;
		
	}
	@Override
	public CustomerOrder getCustomerOrderByOrderId(String order_id) throws SQLException {
		
		 get_customer_order_by_order_id_PS.setString(1, order_id);
		 ResultSet rs = get_customer_order_by_order_id_PS.executeQuery();
		 RiderDAO rider_DAO = new RiderDAOPostgresImplementation();
		 ShopDAO shop_DAO = new ShopDAOPostgresImplementation();
		 CustomerDAO customer_DAO = new CustomerDAOPostgresImplementation();
		 OrderCompositionDAO order_composition_DAO = new OrderCompositionDAOPostgresImplementation();
		 CustomerOrder customer_order = null;
		 Shop shop = shop_DAO.getShopOfTheOrder(rs.getString("order_id"));
		 Customer customer = customer_DAO.getCustomerOfTheOrder(rs.getString("order_id"));
		 Rider rider = rider_DAO.getRiderByCf(rs.getString("rider_cf"));
		 List<OrderComposition> order_composition = order_composition_DAO.getOrderCompositionOfTheOrder(rs.getString("order_id"));
		 while (rs.next())
		 {
				CustomerOrder order = new CustomerOrder(rs.getString("order_id"),rs.getString("order_date"), rs.getString("delivery_time"), rs.getString("address"),rs.getString("status"),
													    rs.getString("payment"),rs.getString("note"), rider, shop, customer, order_composition);
		 }
		 
		return customer_order;
	}
	
}