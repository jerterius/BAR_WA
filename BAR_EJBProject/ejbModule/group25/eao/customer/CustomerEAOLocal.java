package group25.eao.customer;

import javax.ejb.Local;

import group25.ejb.Customer;

@Local
public interface CustomerEAOLocal {
	public Customer findByCustomerEmail(String email);

}
