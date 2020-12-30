package entities;

public class Shop {

	private String meal_id;
	private String name;
	private String price;
	private String description;
	
	
	public Shop(String meal_id, String name, String price, String description) {
		super();
		this.meal_id = meal_id;
		this.name = name;
		this.price = price;
		this.description = description;
	}
	
	public String getMeal_id() {
		return meal_id;
	}
	public void setMeal_id(String meal_id) {
		this.meal_id = meal_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
