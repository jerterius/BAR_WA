package group25.eao.booking;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import group25.ejb.booking.Booking;

/**
 * Session Bean implementation class BookingEAO
 */
@Stateless
public class BookingEAO implements BookingEAOLocal {

	
	@PersistenceContext(unitName="LabEJBSql")
	private EntityManager em;

    /**
     * Default constructor. 
     */
    public BookingEAO() {
        // TODO Auto-generated constructor stub
    }

	
	public Booking findByBookingId(long id) {
		return em.find(Booking.class, id);

	}

	
	public Booking createBooking(Booking booking) {
		em.persist(booking);
		 return booking;
	}

	
	public Booking updateBooking(Booking booking) {
		em.merge(booking);
		 return booking;
	}

	
	public void deleteBooking(long id) {
		 Booking b = this.findByBookingId(id);
		 if (b != null) {
		 em.remove(b);
		 }

	}

}
