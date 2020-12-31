package Classi;

import java.sql.Date;

public class Rider {
	
	//ATTRIBUTI
	private String rider_id;
	private String cf;
	private String rider_name;
	private String surname;
	private String address;
	private Date birth_date;
	private String birth_place;
	private char gender;
	private String cellular;
	private String email;
	private String password;
	private String vehicle;
	private String working_time;
	private String deliveries_number;
	
	
	//COSTRUTTORE
	public Rider(String rider_id, String cf, String rider_name, String surname, String address, Date birth_date,
			String birth_place, char gender, String cellular, String email, String password, String vehicle,
			String working_time, String deliveries_number) {
		super();
		this.rider_id = rider_id;
		this.cf = cf;
		this.rider_name = rider_name;
		this.surname = surname;
		this.address = address;
		this.birth_date = birth_date;
		this.birth_place = birth_place;
		this.gender = gender;
		this.cellular = cellular;
		this.email = email;
		this.password = password;
		this.vehicle = vehicle;
		this.working_time = working_time;
		this.deliveries_number = deliveries_number;
	}

	
	//GETTER AND SETTER
	public String getRider_id() {
		return rider_id;
	}

	public void setRider_id(String rider_id) {
		this.rider_id = rider_id;
	}

	public String getCf() {
		return cf;
	}

	public void setCf(String cf) {
		this.cf = cf;
	}

	public String getRider_name() {
		return rider_name;
	}

	public void setRider_name(String rider_name) {
		this.rider_name = rider_name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}

	public String getBirth_place() {
		return birth_place;
	}

	public void setBirth_place(String birth_place) {
		this.birth_place = birth_place;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getCellular() {
		return cellular;
	}

	public void setCellular(String cellular) {
		this.cellular = cellular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVehicle() {
		return vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	public String getWorking_time() {
		return working_time;
	}

	public void setWorking_time(String working_time) {
		this.working_time = working_time;
	}

	public String getDeliveries_number() {
		return deliveries_number;
	}

	public void setDeliveries_number(String deliveries_number) {
		this.deliveries_number = deliveries_number;
	}
	
	
	
	
}
