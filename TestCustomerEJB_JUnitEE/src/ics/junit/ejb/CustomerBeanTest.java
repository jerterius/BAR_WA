package ics.junit.ejb;

import junit.framework.TestCase;
import javax.naming.Context;
import javax.naming.InitialContext;
import group25.ejb.Customer;
import group25.facade.FacadeLocal;

public class CustomerBeanTest extends TestCase {
	
	FacadeLocal facadeLocal;
	Customer customer = new Customer();

	public CustomerBeanTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
		Context context = new InitialContext();
		facadeLocal = (FacadeLocal) context.lookup("java:app/BAR_EJBProject/Facade!group25.facade.FacadeLocal");
	}

	protected void tearDown() throws Exception {
		super.tearDown();
		facadeLocal.deleteCustomer("ebba@gmail.com");
	}
	
	public void testCustomerMethods() throws Exception {
		customer.setEmail("ebba@gmail.com");
		customer.setPassword("hejasverige");
		facadeLocal.createCustomer(customer);	
		
		assertEquals(customer.getEmail(), "ebba@gmail.com");
		
	}
	
	public void testCustomerMethods2() throws Exception {
		customer.setName("Ebba");
		assertEquals(customer.getName(), "Ebba");
	}
	
	

}
