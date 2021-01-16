package entities;

import java.util.Arrays;
import java.util.List;

import enumerations.DaysOfTheWeek;

public class Shop {

	//ATTRIBUTI
	private String id;
	private String name;
	private String password;
	private String working_hours;
	private Address address;
	private DaysOfTheWeek[] closing_days;
	private List<Rider> employed_riders_list;
	private List<Meal> meal_list;
	
	//COSTRUTTORE
	public Shop()
	{
		
	}
	public Shop(String name, String password, String working_hours, Address address,
			DaysOfTheWeek[] closing_days, List<Rider> employed_riders_list, List<Meal> meal_list) {
		
		super();
		this.name = name;
		this.password = password;
		this.working_hours = working_hours;
		this.address = address;
		this.closing_days = closing_days;
		this.employed_riders_list = employed_riders_list;
		this.meal_list = meal_list;
	}


	public String getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getWorking_hours() {
		return working_hours;
	}


	public void setWorking_hours(String working_hours) {
		this.working_hours = working_hours;
	}


	public Address getAddress() {
		return address;
	}


	public void setAddress(Address address) {
		this.address = address;
	}


	public DaysOfTheWeek[] getClosing_days() {
		return closing_days;
	}


	public void setClosing_days(DaysOfTheWeek[] closing_days) {
		this.closing_days = closing_days;
	}


	public List<Rider> getEmployed_riders_list() {
		return employed_riders_list;
	}


	public void setEmployed_riders_list(List<Rider> employed_riders_list) {
		this.employed_riders_list = employed_riders_list;
	}


	
	public List<Meal> getMeal_list() {
		return meal_list;
	}
	public void setMeal_list(List<Meal> meal_list) {
		this.meal_list = meal_list;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Shop [id=" + id + ", name=" + name + ", password=" + password + ", working_hours=" + working_hours
				+ ", address=" + address + ", closing_days=" + Arrays.toString(closing_days) + ", employed_riders_list="
				+ employed_riders_list + "]";
	}
	

	
	
	
}
