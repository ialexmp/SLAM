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
 * Servlet implementation class GetUserInfo
 */
@WebServlet("/GetUserInfo")
public class GetUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserInfo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ManageTweets tweetsManager = new ManageTweets();
		ManageUsers usersManager = new ManageUsers();
		String session_user=null;
		if(session!=null) {
			session_user = (String)session.getAttribute("user");
			request.setAttribute("isAnonymous", false);
		}else {
			request.setAttribute("isAnonymous", true);
		}
		String user = (String) request.getParameter("usr");
		User user_info = usersManager.getUser(user);
		
		request.setAttribute("user", user_info);
		request.setAttribute("sessionUser", session_user);
		request.setAttribute("followers", usersManager.getFollowers(user_info.getUser()));
		request.setAttribute("n_tweets", usersManager.getNumberTweets(user_info.getUser()));
		request.setAttribute("following", usersManager.getFollowing(user_info.getUser()));
		request.setAttribute("n_comments", usersManager.getNumberComments(user_info.getUser()));
		request.setAttribute("username", user_info.getUser());
        request.setAttribute("firstName", user_info.getFirstName());
        request.setAttribute("lastName", user_info.getLastName());
        request.setAttribute("mail", user_info.getMail());
        request.setAttribute("phoneNumber", user_info.getPhoneNumber());
        request.setAttribute("state", user_info.getState());
        request.setAttribute("securityQuestion", user_info.getSecurityQuestion());
		if(usersManager.getUser(session_user).isAdmin()) {
			request.setAttribute("isAdmin", true);
		}
		else {
			request.setAttribute("isAdmin", false);
		}
		List<Tweet> tweets = tweetsManager.getUserTweets(user, 0, 10);
		request.setAttribute("tweets", tweets);
		
		List<User> followedUsers = usersManager.getAllFollowedUsers(user);
		request.setAttribute("followedUsers", followedUsers);

		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUserInfo.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
