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


import managers.ManageTweets;
import managers.ManageUsers;
import models.Tweet;
import models.User;

/**
 * Servlet implementation class GetNotFollowedTweets
 */
@WebServlet("/GetNotFollowedTweets")
public class GetNotFollowedTweets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNotFollowedTweets() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ManageTweets tweetManager = new ManageTweets();
		ManageUsers userManager = new ManageUsers();
		String user = null;
		if(session != null) {
			user = (String) session.getAttribute("user");
			request.setAttribute("isAnonymous", false);
		}else {
			request.setAttribute("isAnonymous", true);
		}
		List<Tweet> tweets = tweetManager.GetNotFollowedTweets(user);
		List<User> users = userManager.getNotFollowedUsers(user, 0, 5);
		for(Tweet tweet:tweets) {
			System.out.println(tweet.getId()+tweet.getContent());
		}
		request.setAttribute("tweets", tweets);
		request.setAttribute("users", users);
		tweetManager.finalize();
		if(userManager.getUser(user).isAdmin()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewMenuAdmin.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExplore.jsp");
			dispatcher.forward(request, response);
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
