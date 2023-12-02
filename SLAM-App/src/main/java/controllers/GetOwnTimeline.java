package controllers;

import java.io.IOException;
import java.util.List;

import models.Tweet;
import models.User;
import managers.ManageTweets;
import managers.ManageUsers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetOwnTimeline
 */
@WebServlet("/GetOwnTimeline")
public class GetOwnTimeline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOwnTimeline() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ManageTweets tweetsManager = new ManageTweets();
		ManageUsers usersManager = new ManageUsers();
		
		User user_info = usersManager.getUser((String) session.getAttribute("user"));
		request.setAttribute("user", user_info);
		request.setAttribute("followers", usersManager.getFollowers(user_info.getUser()));
		request.setAttribute("n_tweets", usersManager.getNumberTweets(user_info.getUser()));
		request.setAttribute("following", usersManager.getFollowing(user_info.getUser()));
		request.setAttribute("n_comments", usersManager.getNumberComments(user_info.getUser()));

		List<Tweet> tweets = tweetsManager.getUserTweets((String) session.getAttribute("user"), 0, 10);
		request.setAttribute("tweets", tweets);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewOwnTimeline.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
