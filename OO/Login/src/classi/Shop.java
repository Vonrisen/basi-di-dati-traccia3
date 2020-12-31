package Classi;

public class Shop {
	
	//ATTRIBUTI
	private String shop_id;
	private String shop_name;
	private String address;
	private String working_hours;
	private String closing_days;
		
	
	//COSTRUTTORE
	public Shop(String shop_id, String shop_name, String address, String working_hours, String closing_days) {
		super();
		this.shop_id = shop_id;
		this.shop_name = shop_name;
		this.address = address;
		this.working_hours = working_hours;
		this.closing_days = closing_days;
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
	
	
	
	
	
}
