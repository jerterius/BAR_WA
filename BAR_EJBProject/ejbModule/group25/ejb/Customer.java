package group25.ejb;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Customers")
public class Customer implements Serializable {

	private String email;
	private String phoneNbr;
	private String name;
	private String title;
	private String address;
	private String password;
	//private Set<Booking> bookings;
	
	@Id
	@Column(name="CEmail")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="CPhoneNumber")
	public String getPhoneNbr() {
		return phoneNbr;
	}
	
	public void setPhoneNbr(String phoneNbr) {
		this.phoneNbr = phoneNbr;
	}
	
	@Column(name="CName")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="Title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="CAdress")
	public String getAddress() {
		return address;
	}

	public void setAddress(String adress) {
		this.address = adress;
	}
	
	@Column(name="Password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	/*
	
	@OneToMany(mappedBy="customer", fetch=FetchType.EAGER)
	public Set<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(Set<Booking> bookings) {
		this.bookings = bookings;
	}
    */
    public Customer() {
        // TODO Auto-generated constructor stub
    }

}
