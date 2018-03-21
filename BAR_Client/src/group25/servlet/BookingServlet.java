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
import group25.facade.FacadeLocal;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    @EJB
    FacadeLocal facade;
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		out.println("<DOCTYPE html><html><head>");
		out.println("<title>Booking</title>");
		out.println("meta charset=\"ISO-8859-1\">");
		out.println("</head><body>");
		
		out.println("<h2>Customer</h2>");
		
		
		Customer customer = facade.findByCustomerEmail("dennis@gmail.com");
		
		
		out.print("<p>" + customer.getTitle() + " ");
		out.print("<p>" + customer.getName() + " ");
		out.print("<p>" + customer.getAddress() + " ");
		out.print("<p>" + customer.getPhoneNbr() + " ");
		out.print("<p>" + customer.getEmail() + " ");
		out.print("<p>" + customer.getPassword() + " ");
		
		
		out.println("</body></html>");
	}

}
