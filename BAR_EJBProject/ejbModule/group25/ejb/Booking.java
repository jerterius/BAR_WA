package group25.ejb;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Bookings")
public class Booking implements Serializable{
	
	private long bookingNumber;
	private String adress;
	private String roomNumber;
	private String email;
	private Timestamp date;
	private Customer customer;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="BookingNumber")
	public long getBookingNumber() {
		return bookingNumber;
	}
	public void setBookingNumber(long bookingNumber) {
		this.bookingNumber = bookingNumber;
	}
	@Column(name="Adress")
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	@Column(name="RoomNumber")
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	@Column(name="CEmail")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="Date")
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	@ManyToOne
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	

}
