package controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import group25.ejb.Customer;
import group25.facade.FacadeLocal;

import com.google.gson.*;


/**
 * Servlet implementation class AjaxController
 */
@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	private FacadeLocal facade;
	
    public AjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		if(operation.equals("login")){
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Customer c = facade.findByCustomerEmail(email);
			
			if(c!=null) {
				if(c.getPassword().equals(password)) {
					
					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", c);
					response.sendRedirect("account.jsp");
				} else {
					out.print("Password incorrect");
				}
			} else {
				out.print("User does not exist");
			}
			
			
		} else if(operation.equals("updateUser")) {
			
			HttpSession session = request.getSession(true);
			
			String newTitle = request.getParameter("titleInput");
			String newName = request.getParameter("nameInput");
			String newAddress = request.getParameter("addressInput");
			String newPhoneNo = request.getParameter("phoneNoInput").toString();
			String newEmail = request.getParameter("emailInput");
			String newPassword = request.getParameter("passwordInput");
		
			
			Customer originalCustomer = (Customer) session.getAttribute("currentSessionUser");
			originalCustomer = facade.findByCustomerEmail(originalCustomer.getEmail());
			
			originalCustomer.setTitle(newTitle);
			originalCustomer.setName(newName);
			originalCustomer.setAddress(newAddress);
			originalCustomer.setPhoneNbr(newPhoneNo);
			originalCustomer.setEmail(newEmail);
			originalCustomer.setPassword(newPassword);
			
			Customer updatedCustomer = facade.updateCustomer(originalCustomer);
			
			session.setAttribute("currentSessionUser", updatedCustomer);
			
			out.print("Update successful!");
			
			
		} else if(operation.equals("removeBookings")) {	
			HttpSession session = request.getSession(true);
			Customer loggedInCustomer = (Customer) session.getAttribute("currentSessionUser");
			
			String[] bookingNumbers = request.getParameterValues("bookings[]");
			
			for(String b:bookingNumbers) {
				
				long bookingNo = Long.parseLong(b);
				facade.deleteBooking(bookingNo);
			}
			response.setContentType("application/json");
			new Gson().toJson(bookingNumbers, response.getWriter());
			
			Customer updatedCustomer = facade.findByCustomerEmail(loggedInCustomer.getEmail());
			session.setAttribute("currentSessionUser", updatedCustomer);
			
			
			
		}

	}

}
