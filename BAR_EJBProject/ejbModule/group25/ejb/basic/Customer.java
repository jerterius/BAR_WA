package group25.ejb.basic;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

/**
 * Session Bean implementation class Customer
 */
@Stateless
@LocalBean
public class Customer implements CustomerRemote, CustomerLocal {

    /**
     * Default constructor. 
     */
    public Customer() {
        // TODO Auto-generated constructor stub
    }

}
