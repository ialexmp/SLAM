package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import models.Login;

/**
 * Servlet implementation class ChangePasswordController
 */
@WebServlet("/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.print("ChangePasswordController: ");
		
		Login login = new Login();
		
	    try {
	    	HttpSession session = request.getSession();
	    	String user_to_set = null;
	    	if(user_to_set == null) {
	    		user_to_set = session.getAttribute("user").toString();
	    		login.setUser(user_to_set);
	    		login.setSecurityQuestion();
	    	}
	    	BeanUtils.populate(login, request.getParameterMap());

	    	if (login.isComplete()) {
	    		System.out.println("password change OK, forwarding to ViewLoginForm ");
	    		if(session!=null) {
	    			session.invalidate();
	    		}
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
			    dispatcher.forward(request, response);
		    } 
			else {
	    		System.out.println("password change not OK, forwarding to ChangePassword ");
				request.setAttribute("login", login);
			    RequestDispatcher dispatcher = request.getRequestDispatcher("ChangePassword.jsp");
			    dispatcher.forward(request, response);
		    }
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
