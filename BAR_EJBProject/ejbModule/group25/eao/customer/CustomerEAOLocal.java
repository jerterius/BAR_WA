package group25.eao.customer;

import javax.ejb.Local;

import group25.ejb.Customer;

@Local
public interface CustomerEAOLocal {
	
	public Customer findByCustomerEmail(String email);
	public Customer createCustomer(Customer customer);
	public Customer updateCustomer(Customer customer);
	public void deleteCustomer(String email);


}
