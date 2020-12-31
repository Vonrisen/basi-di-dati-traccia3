package Classi;

import java.sql.Date;
import java.util.ArrayList;

public class Customer {
	
	//ATTRIBUTI
	private String customer_id;
	private String customer_name;
	private String surname;
	private String address;
	private Date birth_date;
	private String birth_place;
	private char gender;
	private String cellular;
	private String email;
	private String password;
	private String cf;
	private Cart cart;
	private ArrayList <CustomerOrder> order_list;
	
	
	//COSTRUTTORE
	public Customer(String customer_id, String customer_name, String surname, String address, Date birth_date,
			String birth_place, char gender, String cellular, String email, String password, String cf, Cart cart,
			ArrayList<CustomerOrder> order_list) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.surname = surname;
		this.address = address;
		this.birth_date = birth_date;
		this.birth_place = birth_place;
		this.gender = gender;
		this.cellular = cellular;
		this.email = email;
		this.password = password;
		this.cf = cf;
		this.cart = cart;
		this.order_list = order_list;
	}


	//GETTER AND SETTER
	public String getCustomer_id() {
		return customer_id;
	}


	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}


	public String getCustomer_name() {
		return customer_name;
	}


	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
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


	public String getCf() {
		return cf;
	}


	public void setCf(String cf) {
		this.cf = cf;
	}


	public Cart getCart() {
		return cart;
	}


	public void setCart(Cart cart) {
		this.cart = cart;
	}


	public ArrayList<CustomerOrder> getOrder_list() {
		return order_list;
	}


	public void setOrder_list(ArrayList<CustomerOrder> order_list) {
		this.order_list = order_list;
	}
	
	
	

}
