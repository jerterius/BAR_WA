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
    
    public Customer findByCustomerEmail(String email) {
    	return customerEAO.findByCustomerEmail(email);
    }

}
