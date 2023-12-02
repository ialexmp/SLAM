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

import managers.ManageUsers;
import models.User;

/**
 * Servlet implementation class editUserInfo
 */
@WebServlet("/editUserInfo")
public class editUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        try {
           String old_user = (String)session.getAttribute("user");
		   User user = new User();
		   BeanUtils.populate(user, request.getParameterMap());
		   ManageUsers manageUser = new ManageUsers();
		   
		   //RESET ERROR WHEN DON'T CHANGE USERNAME OR WHEN YOU CHANGE IT 
		   if(old_user.equals(request.getParameter("user"))) {
			   user.auxiliar_setUser(old_user);
			   User.error[0]=false;
		   }else if(user.getUser()!="") {
			   User.error[0]=false;
		   }

		   if(user.getSecurityAnswer().equals(manageUser.getSecurityQuestionAndAnswer(user.getUser())[1])) {
			   User.error[11]=false;
		   }else {
			   User.error[11]=true;
		   }
		   
		   if(manageUser.editIsComplete(user)) {
			   manageUser.updateUserInfo(old_user, user.getFirstName(), user.getLastName(), user.getMail(), user.getPhoneNumber(), user.getState(), user.getUser(), user.getSecurityAnswer());
			   manageUser.finalize();
			   session.setAttribute("user", user.getUser());
			   String url = "GetOwnTimeline?usr=" + user.getUser();
			   RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			   dispatcher.forward(request, response);
		   } else {
			   request.setAttribute("user", user);
			   String url = "GetOwnTimeline?usr=" + old_user;
			   RequestDispatcher dispatcher = request.getRequestDispatcher(url);
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
