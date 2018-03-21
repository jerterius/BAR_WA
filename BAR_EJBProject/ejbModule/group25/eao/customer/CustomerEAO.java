package group25.eao.customer;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import group25.ejb.Customer;

/**
 * Session Bean implementation class CustomerEAO
 */
@Stateless
public class CustomerEAO implements CustomerEAOLocal {

    @PersistenceContext(unitName="LabEJBSql")
    private EntityManager em;
	
    public CustomerEAO() {
        // TODO Auto-generated constructor stub
    }
    
    public Customer findByCustomerEmail(String email) {
    	return em.find(Customer.class, email);
    }

}
