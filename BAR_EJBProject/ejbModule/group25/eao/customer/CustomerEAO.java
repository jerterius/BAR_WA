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

	@Override
	public Customer findByCustomerEmail(String email) {
		return em.find(Customer.class, email);
	}

	@Override
	public Customer createCustomer(Customer customer) {
		em.persist(customer);
		return customer;
	}

	@Override
	public Customer updateCustomer(Customer customer) {
		em.merge(customer);
		return customer;
	}

	@Override
	public void deleteCustomer(String email) {
		Customer c = this.findByCustomerEmail(email);
		if(c != null) {
			em.remove(c);
		}
		
	}
    
    

}
