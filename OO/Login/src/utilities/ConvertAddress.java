package utilities;
import entities.Address;

public class ConvertAddress {

	public static Address stringAddressToObjectAddress(String address_to_convert,String delim_characters)
	{
		String delim = delim_characters;
		String[] tokens = address_to_convert.split(delim);
		Address address = new Address(tokens[0],tokens[1],tokens[2],tokens[3],tokens[4]);
		return address;
	}

}
