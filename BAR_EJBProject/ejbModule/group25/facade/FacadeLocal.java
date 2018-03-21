package group25.facade;

import javax.ejb.Local;

import group25.ejb.Booking;

@Local
public interface FacadeLocal {

	public Booking findByBookingId(long id);
	public Booking createBooking(Booking booking);
	public Booking updateBooking(Booking booking);
	public void deleteBooking(long id);
	
}
