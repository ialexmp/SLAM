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
import models.User;

/**
 * Servlet implementation class EditLike
 */
@WebServlet("/EditLike")
public class EditLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tweet tweet = new Tweet();
		ManageTweets tweetManager = new ManageTweets();
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("user");
		
		if (session != null || user != null)
			tweet.setId(Integer.parseInt(request.getParameter("likeID")));
			tweetManager.editLike(tweet, user);
			tweetManager.finalize();
			RequestDispatcher dispatcher = request.getRequestDispatcher("MenuController");
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
