package group25.facade;

import javax.ejb.Local;

import group25.ejb.Customer;

@Local
public interface FacadeLocal {
	
	public Customer findByCustomerEmail(String email);

}
