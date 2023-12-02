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

import managers.ManageTweets;
import models.Tweet;

/**
 * Servlet implementation class EditTweet
 */
@WebServlet("/EditTweet")
public class EditTweet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTweet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Tweet tweet = new Tweet();
		ManageTweets tweetManager = new ManageTweets();
		String user = (String) session.getAttribute("user");

		if (session != null || user != null) {
			try {
				BeanUtils.populate(tweet, request.getParameterMap());
				tweet.setId(Integer.parseInt(request.getParameter("tID")));
				tweetManager.editTweet(tweet);
				tweetManager.finalize();
				RequestDispatcher dispatcher = request.getRequestDispatcher("GetOwnTimeline");
				dispatcher.forward(request, response);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

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
