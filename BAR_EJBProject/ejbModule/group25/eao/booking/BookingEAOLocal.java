package group25.eao.booking;

import javax.ejb.Local;

import group25.ejb.booking.Booking;

@Local
public interface BookingEAOLocal {

	public Booking findByBookingId(long id);
	public Booking createBooking(Booking booking);
	public Booking updateBooking(Booking booking);
	public void deleteBooking(long id);
}
