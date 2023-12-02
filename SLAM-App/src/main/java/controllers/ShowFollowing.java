package controllers;

import java.io.IOException;
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
 * Servlet implementation class ShowFollowing
 */
@WebServlet("/ShowFollowing")
public class ShowFollowing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFollowing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String sessionUser = "";
		if (session != null) {
			sessionUser = (String)session.getAttribute("user");
			request.setAttribute("isAnonymous", false);
		}else {
			request.setAttribute("isAnonymous", true);
		}
		String user = (String) request.getParameter("user");
		request.setAttribute("user", user);
		ManageUsers userManager = new ManageUsers();
		List<User> users = userManager.getFollowingUsers(user,0,5);
		List<User> followingUsers = userManager.getAllFollowingUsers(sessionUser);
		for(User following1:users) {
			System.out.println("users:"+following1.getUser());
		}
		for(User following:followingUsers) {
			System.out.println("following:"+following.getUser());
		}
		request.setAttribute("users", users);
		request.setAttribute("followingUsers", followingUsers);
		request.setAttribute("sessionUser", sessionUser);
		userManager.finalize();


		RequestDispatcher dispatcher = request.getRequestDispatcher("ShowFollowers.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
