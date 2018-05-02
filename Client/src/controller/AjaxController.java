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
		
		response.setContentType("text/plain");
		String email = request.getParameter("useremail");
		String password = request.getParameter("userpassword");

		Customer c = facade.findByCustomerEmail(email);
		
		PrintWriter out = response.getWriter();
		if(c!=null) {
			if(c.getPassword().equals(password)) {
				out.print("Welcome " + c.getName());
				
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", c);
				response.sendRedirect("account.jsp");
			} else {
				out.print("Invalid password");
			}
		} else {
			out.print("User does not exist.");
		}
	}

}
