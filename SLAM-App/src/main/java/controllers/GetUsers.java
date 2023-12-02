package controllers;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managers.ManageUsers;
import models.User;

/**
 * Servlet implementation class GetFollows
 */
@WebServlet("/GetUsers")
public class GetUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUsers() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		HttpSession session = request.getSession(false);
		String palabra = request.getParameter("palabra");
		ManageUsers userManager = new ManageUsers();
		String user = null;
		if (session!=null) {
			user = (String) session.getAttribute("user");
			request.setAttribute("isAnonymous", false);
		}
		else {
			request.setAttribute("isAnonymous", true);
		}
		if(userManager.getUser(user).isAdmin()) {
			request.setAttribute("isAdmin", true);
		}
		else {
			request.setAttribute("isAdmin", false);
		}
		if (palabra != null) {
			List<User> users = userManager.getUsers(palabra, user);
			List<User> followingUsers = userManager.getAllFollowingUsers(user);
			request.setAttribute("followingUsers", followingUsers);
			request.setAttribute("users", users);

			userManager.finalize();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUsers.jsp"); 
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}