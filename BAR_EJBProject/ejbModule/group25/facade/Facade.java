package group25.facade;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import group25.eao.customer.CustomerEAOLocal;
import group25.ejb.Customer;

/**
 * Session Bean implementation class Facade
 */
@Stateless
public class Facade implements FacadeLocal {

    @EJB
    private CustomerEAOLocal customerEAO;
    
    public Facade() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Customer findByCustomerEmail(String email) {
		return customerEAO.findByCustomerEmail(email);
	}

	@Override
	public Customer createCustomer(Customer customer) {
		return customerEAO.createCustomer(customer);
	}

	@Override
	public Customer updateCustomer(Customer customer) {
		return customerEAO.updateCustomer(customer);
	}

	@Override
	public void deleteCustomer(String email) {
		customerEAO.deleteCustomer(email);
		
	}
    
    

}
