package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managers.ManageTweets;
import managers.ManageUsers;
import models.Tweet;
import models.User;

/**
 * Servlet implementation class MenuController
 */
@WebServlet("/MenuController")
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.print("MenuController: ");
		
		HttpSession session = request.getSession(false);
		if(request.getParameter("anonymous")!=null) {
			if(request.getParameter("anonymous").equals("true")) {
				session.invalidate();
			}
		}
		session = request.getSession(false);

		ManageTweets tweetsManager = new ManageTweets();
		ManageUsers usersManager = new ManageUsers();
		String user=null;
		if (session!=null) {
			user = (String) session.getAttribute("user");

			List<Tweet> tweets = tweetsManager.getAllTweets(user,0,30);
			request.setAttribute("tweets", tweets);
			
			String tid = request.getParameter("tID");
			if(tid!= null) {
				List<Tweet> comments = tweetsManager.getComments(Integer.parseInt(request.getParameter("tID")));
				request.setAttribute("comments", comments);
			}
			
			ArrayList<User> users = usersManager.getNotFollowedUsers(user, 0, 3);
			request.setAttribute("users", users);

			System.out.println("forwarding to ViewMenuLogged");
			if(usersManager.getUser(user).isAdmin()) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("GetNotFollowedTweets");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("ViewMenuLogged.jsp");
				dispatcher.forward(request, response);
			}
		}
		else {
			List<Tweet> tweets = tweetsManager.GetNotFollowedTweets(user);
			request.setAttribute("tweets", tweets);
			String tid = request.getParameter("tID");
			if(tid!= null) {
				List<Tweet> comments = tweetsManager.getComments(Integer.parseInt(request.getParameter("tID")));
				request.setAttribute("comments", comments);
			}
			tweetsManager.finalize();
			request.setAttribute("isAnonymous", true);

			System.out.println("forwarding to ViewContentNotLogged ");
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExplore.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
