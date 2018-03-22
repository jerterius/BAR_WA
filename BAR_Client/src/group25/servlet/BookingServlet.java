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
		outCustomer.println("</head><style>" + 
				"table {" + 
				"    font-family: arial, sans-serif;" + 
				"    border-collapse: collapse;" + 
				"    width: 100%;" + 
				"}" + 
				"td, th {" + 
				"    border: 1px solid #dddddd;" + 
				"    text-align: left;" + 
				"    padding: 8px;" + 
				"tr:nth-child(even) {" + 
				"    background-color: #dddddd;" + 
				"}" + 
				"</style><body>");
		
		outCustomer.println("<h2>Customer</h2>");
		
		
		Customer customer = facade.findByCustomerEmail("tester@testmail.com");
		
		
		outCustomer.print("<p> Title: " + customer.getTitle() + " ");
		outCustomer.print("<p> Name: " + customer.getName() + " ");
		outCustomer.print("<p> Address: " + customer.getAddress() + " ");
		outCustomer.print("<p> Phone number: " + customer.getPhoneNbr() + " ");
		outCustomer.print("<p> Email: " + customer.getEmail() + " ");
		
		outCustomer.print("<p><h2>Bookings</h2><table>" + 
				"  <tr>" + 
				"    <th>Booking Number</th>" + 
				"    <th>Adress</th>" + 
				"    <th>Room</th>" + 
				"    <th>Date</th>" + 
				"  </tr>");
		
		for(Booking b: customer.getBookings()) {
			outCustomer.print(
			"<tr>" + 
							"<td>" + b.getBookingNumber() + "</td>" +
							"<td>" + b.getAdress()+ "</td>" + 
							"<td>" + b.getRoomNumber()+"</td>" + 
							"<td>" + b.getDate() + "</td>" +
			"</tr>");
		}
		
		
		outCustomer.println("</body></html>");


	}

}
