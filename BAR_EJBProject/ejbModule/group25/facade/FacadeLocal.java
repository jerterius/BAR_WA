package group25.facade;

import javax.ejb.Local;

import group25.ejb.Customer;

@Local
public interface FacadeLocal {
	
	public Customer findByCustomerEmail(String email);
	public Customer createCustomer(Customer customer);
	public Customer updateCustomer(Customer customer);
	public void deleteCustomer(String email);

}
