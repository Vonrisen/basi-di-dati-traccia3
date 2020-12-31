package Classi;

import java.util.ArrayList;

public class Meal {

	//ATTRIBUTI
	private String meal_id;
	private String name;
	private float price;
	private String description;
	private ArrayList <Supply> supply_list;
	
	
	//COSTRUTTORE
	public Meal(String meal_id, String name, float price, String description, ArrayList<Supply> supply_list) {
		super();
		this.meal_id = meal_id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.supply_list = supply_list;
	}


	//GETTER AND SETTER
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


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public ArrayList<Supply> getSupply_list() {
		return supply_list;
	}


	public void setSupply_list(ArrayList<Supply> supply_list) {
		this.supply_list = supply_list;
	}
	
	
	
}
