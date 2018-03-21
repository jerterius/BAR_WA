package group25.facade;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import group25.eao.booking.BookingEAOLocal;
import group25.ejb.Booking;

/**
 * Session Bean implementation class Facade
 */
@Stateless
public class Facade implements FacadeLocal {

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


}
