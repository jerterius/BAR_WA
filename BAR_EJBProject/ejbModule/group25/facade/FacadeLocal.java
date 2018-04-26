package group25.facade;

import javax.ejb.Local;

import group25.ejb.Customer;
import group25.ejb.Booking;


@Local
public interface FacadeLocal {
	
	public Customer findByCustomerEmail(String email);
	public Customer createCustomer(Customer customer);
	public Customer updateCustomer(Customer customer);
	public void deleteCustomer(String email);

	public Booking findByBookingId(long id);
	public Booking createBooking(Booking booking);
	public Booking updateBooking(Booking booking);
	public void deleteBooking(long id);
	
}
