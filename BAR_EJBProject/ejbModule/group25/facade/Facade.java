package group25.facade;

import javax.ejb.EJB;
import javax.ejb.Stateless;


import group25.eao.customer.CustomerEAOLocal;
import group25.ejb.Customer;
import group25.eao.booking.BookingEAOLocal;
import group25.ejb.Booking;


/**
 * Session Bean implementation class Facade
 */
@Stateless
public class Facade implements FacadeLocal {

    @EJB
    private CustomerEAOLocal customerEAO;
	@EJB
	private BookingEAOLocal bookingEAO;

	/**
	 * Default constructor.
	 */
	public Facade() {
		// TODO Auto-generated constructor stub
	}
	
	public Booking findByBookingId(long id) {
		return bookingEAO.findByBookingId(id);
	}

	public Booking createBooking(Booking booking) {
		return bookingEAO.createBooking(booking);
	}

	public Booking updateBooking(Booking booking) {
		return bookingEAO.updateBooking(booking);
	}

	public void deleteBooking(long id) {
		bookingEAO.deleteBooking(id);
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
