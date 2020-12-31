package Classi;

public class Cart {
	
	//ATTRIBUTI
	private String cart_id;
	private char complete = 'n';
	private Customer customer;
	
	
	//COSTRUTTORE
	public Cart(String cart_id, char complete, Customer customer) {
		super();
		this.cart_id = cart_id;
		this.complete = complete;
		this.customer = customer;
	}

	
	//GETTER AND SETTER
	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public char getComplete() {
		return complete;
	}

	public void setComplete(char complete) {
		this.complete = complete;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	

}
