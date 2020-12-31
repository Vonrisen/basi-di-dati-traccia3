package Classi;

import java.util.ArrayList;

public class Shop {
	
	//ATTRIBUTI
	private String shop_id;
	private String shop_name;
	private String address;
	private String working_hours;
	private String closing_days;
	private ArrayList <Rider> rider_list;
	private ArrayList <CustomerOrder> order_list;
	private ArrayList <Supply> supply_list;
		
	
	//COSTRUTTORE
	public Shop(String shop_id, String shop_name, String address, String working_hours, String closing_days,
			ArrayList<Rider> rider_list, ArrayList<CustomerOrder> order_list, ArrayList<Supply> supply_list) {
		super();
		this.shop_id = shop_id;
		this.shop_name = shop_name;
		this.address = address;
		this.working_hours = working_hours;
		this.closing_days = closing_days;
		this.rider_list = rider_list;
		this.order_list = order_list;
		this.supply_list = supply_list;
	}

	//GETTER AND SETTER
	public String getShop_id() {
		return shop_id;
	}
	
	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}
	
	public String getShop_name() {
		return shop_name;
	}
	
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getWorking_hours() {
		return working_hours;
	}
	
	public void setWorking_hours(String working_hours) {
		this.working_hours = working_hours;
	}
	
	public String getClosing_days() {
		return closing_days;
	}
	
	public void setClosing_days(String closing_days) {
		this.closing_days = closing_days;
	}

	public ArrayList <Rider> getRider_list() {
		return rider_list;
	}

	public void setRider_list(ArrayList <Rider> rider_list) {
		this.rider_list = rider_list;
	}
	
	
	
	
	
}
