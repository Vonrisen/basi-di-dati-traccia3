package controllers;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;

import daos_implementation.MealDAOPostgresImplementation;
import daos_implementation.ShopDAOPostgresImplementation;
import daos_interfaces.MealDAO;
import daos_interfaces.ShopDAO;
import db_connection.DBconnection;
import entities.Shop;
import gui.AdminFrame;
import gui.LoginFrame;
import gui.ShopFrame;
import net.proteanit.sql.DbUtils;


public class AdminController{
	
	ShopDAO shop = new ShopDAOPostgresImplementation();
	public AdminController()
	{
	}
	public void openAdminFrame(LoginFrame login_frame)
	{
		login_frame.setVisible(false);
		new AdminFrame();
		return;
	}
	public void openShopFrame(AdminFrame admin_frame) {
		
		admin_frame.setVisible(false);
		ShopFrame shop_frame = new ShopFrame();
		try {
			shop_frame.getTable().setModel(DbUtils.resultSetToTableModel(shop.getAllShops()));
		} catch (SQLException e1) {
			System.out.println("Errore durante la trasposizione del result set sulla tabella"+e1.getMessage());
		}
		return;
	}
	public void insert_refreshShopTable(ShopFrame shop_frame)
	{
		try {
			shop.insertShop(shop_frame.getNameTF().getText(), shop_frame.getAddressTF().getText(), shop_frame.getWorking_hoursTF().getText(), shop_frame.getClosing_daysTF().getText());
			shop_frame.getTable().setModel(DbUtils.resultSetToTableModel(shop.getAllShops()));
		} catch (SQLException e) {
			System.out.println("Errore durante l'inserimento di una riga: "+e.getMessage());
		}
		return;
	}
	public void delete_refreshShopTable(ShopFrame shop_frame)
	{
		String value = shop_frame.getTable().getModel().getValueAt(shop_frame.getTable().getSelectedRow(), 0).toString();
		try {
			shop.deleteShop(value);
			shop_frame.getTable().setModel(DbUtils.resultSetToTableModel(shop.getAllShops()));
		} catch (SQLException e1) {
			System.out.println("Errore durante la cancellazione: "+e1.getMessage());
		}
		catch(ArrayIndexOutOfBoundsException e2)
		{
			System.out.println("Devi selezionare la riga da eliminare!");
		}
		return;
	}
	public void update_refreshShopTable(ShopFrame shop_frame)
	{
		
		String shop_id;
		String name=shop_frame.getNameTF().getText();
		String address=shop_frame.getAddressTF().getText();
		String working_hours=shop_frame.getWorking_hoursTF().getText();
		String closing_days=shop_frame.getClosing_daysTF().getText();
		try {
			shop_id=shop_frame.getTable().getModel().getValueAt(shop_frame.getTable().getSelectedRow(), 0).toString();
			shop.updateShop(shop_id, name, address, working_hours, closing_days);
			ShopDAO shop1 = new ShopDAOPostgresImplementation();
			shop_frame.getTable().setModel(DbUtils.resultSetToTableModel(shop1.getAllShops()));
		} catch (SQLException e1) {
			System.out.println("Errore durante l' update della riga: "+e1.getMessage());
		}
		catch(ArrayIndexOutOfBoundsException e2)
		{
			System.out.println("Per apportare modifiche devi prima selezionare una riga!");
		}
		return;
	}
}
