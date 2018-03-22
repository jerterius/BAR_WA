package group25.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import group25.ejb.Customer;
import group25.ejb.Booking;
import group25.facade.FacadeLocal;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


       
	@EJB
	private FacadeLocal facade;
	
    /**
     * @see HttpServlet#HttpServlet()
     */

    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		PrintWriter outCustomer = response.getWriter();
		
		outCustomer.println("<DOCTYPE html><html><head>");
		outCustomer.println("<title>Booking</title>");
		outCustomer.println("<meta charset=\"ISO-8859-1\">");
		outCustomer.println("</head><body>");
		
		outCustomer.println("<h2>Customer</h2>");
		
		
		Customer customer = facade.findByCustomerEmail("dennis@gmail.com");
		
		
		outCustomer.print("<p> Title: " + customer.getTitle() + " ");
		outCustomer.print("<p> Name: " + customer.getName() + " ");
		outCustomer.print("<p> Address: " + customer.getAddress() + " ");
		outCustomer.print("<p> Phone number: " + customer.getPhoneNbr() + " ");
		outCustomer.print("<p> Email: " + customer.getEmail() + " ");
		
		outCustomer.print("<h2> Customers Bookings: </h2>");
		for(Booking b: customer.getBookings()) {
			outCustomer.print("<p>" + b.getBookingNumber() +" "+ b.getAdress()+" "+ b.getRoomNumber()+" "+ b.getDate());
		}
		
		
		
		
		outCustomer.println("</body></html>");

		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html><head>");
		out.println("<title>Lab1</title>");
		out.println("<meta charset=\"ISO-8859-1\">");
		out.println("</head><body>");
		out.println("<h2>Booking</h2>");
		Booking booking = facade.findByBookingId(7);
		out.print("<p> BookingNumber: " + booking.getBookingNumber() + "</p>");
		out.print("<p> Adress: " + booking.getAdress() + "</p>");
		out.print("<p> RoomNumber: " + booking.getRoomNumber() + "</p>");
		out.print("<p> Date: " + booking.getDate() + "</p>");
		out.print("<p> Email: " + booking.getCustomer().getEmail() + "</p>");
		
		out.println("</body></html>");
		

	}

}
