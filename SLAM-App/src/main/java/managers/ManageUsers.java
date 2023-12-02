package managers;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import utils.DB;
import models.User;

public class ManageUsers {
	
	private DB db = null ;
	
	public ManageUsers() {
		try {
			db = new DB();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void finalize() {
		try {
			db.disconnectBD();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
		
	// Add new user
	public void addUser(String user, String mail, String pwd, String firstName, String lastName, boolean terms, String birth, String phoneNumber, String state, String securityQuestion, String securityAnswer) {
		String query = "INSERT INTO users (usr, mail, pwd, firstName, lastName, terms, birth, phoneNumber, state, securityQuestion, securityAnswer) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			statement.setString(2,mail);
			statement.setString(3,pwd);
			statement.setString(4,firstName);
			statement.setString(5,lastName);
			statement.setBoolean(6, terms);
			statement.setString(7,birth);
			statement.setString(8,phoneNumber);
			statement.setString(9,state);
			statement.setString(10, securityQuestion);
			statement.setString(11, securityAnswer);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Check if the user is registered in the DB.
	public boolean checkUser(String user) {
		String query = "SELECT * FROM users WHERE usr = ?";
		PreparedStatement statementcheck = null;
	    ResultSet resultSet = null;
	    boolean exists = false;
		try {
			statementcheck = db.prepareStatement(query);
			statementcheck.setString(1,user);
			resultSet = statementcheck.executeQuery();
	        if (resultSet.next()) {
	            // User exists in the database
	        	exists = true;
	            return exists;
	        }
			statementcheck.close();
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exists;
	}
	
	// Check if the pwd is correct in the DB.
	public boolean checkPwd(String user, String password) {
	    String query = "SELECT * FROM users WHERE usr = ?";
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;
	    boolean exists = false;
	    try {
	        statement = db.prepareStatement(query);
	        statement.setString(1, user);
	        resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            String storedPassword = resultSet.getString("pwd");
	            // Compare the stored password with the provided password
	            if (storedPassword.equals(password)) {
	            	exists = true;
	                return exists;
	            }
	        }
            statement.close();
            resultSet.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return exists;
	}
	
	public String[] getSecurityQuestionAndAnswer(String user) {
	    String query = "SELECT securityQuestion, securityAnswer FROM users WHERE usr = ?";
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;
	    String[] result = new String[2];

	    try {
	        statement = db.prepareStatement(query);
	        statement.setString(1, user);
	        resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            result[0] = resultSet.getString("securityQuestion");
	            result[1] = resultSet.getString("securityAnswer");
	        }

	        statement.close();
	        resultSet.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}

	
	// Update the password of a user in the DB.
	public boolean updatePwd(String user, String newPassword) {
	    String query = "UPDATE users SET pwd = ? WHERE usr = ?";
	    PreparedStatement statement = null;
	    boolean updated = false;

	    try {
	        statement = db.prepareStatement(query);
	        statement.setString(1, newPassword);
	        statement.setString(2, user);
	        int rowsUpdated = statement.executeUpdate();
	        if (rowsUpdated > 0) {
	            // Password was updated successfully
	            updated = true;
	        }
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return updated;
	}
	
	/* Get a user given its PK*/
	public User getUser(String usr) {
		String query = "SELECT usr,lastName,firstName,mail,phoneNumber,state,securityQuestion,securityAnswer,isAdmin FROM users WHERE usr = ? ;";
		PreparedStatement statement = null;
		ResultSet rs = null;
		User user = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,usr);
			rs = statement.executeQuery();
			if (rs.next()) {
				user = new User();
				user.auxiliar_setUser(usr);
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setMail(rs.getString("mail"));
				user.setPhoneNumber(rs.getString("phoneNumber"));
				user.setSecurityQuestion(rs.getString("securityQuestion"));
				user.setSecurityAnswer(rs.getString("securityAnswer"));
				user.setState(rs.getString("state"));
				user.setAdmin(rs.getBoolean("isAdmin"));
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
		

	// Follow a user
	public void followUser(String username, String follower) {
		String query = "INSERT INTO followers (usr,follower) VALUES (?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,username);
			statement.setString(2,follower);
			statement.executeUpdate();
			statement.close();
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Unfollow a user
	public void unfollowUser(String username, String follower) {
		String query = "DELETE FROM followers WHERE usr = ? AND follower = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,username);
			statement.setString(2,follower);
			statement.executeUpdate();
			statement.close();
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// Get all the users
	public List<User> getUsers(String palabra, String usr) {	
		 String query = "SELECT usr,firstName,lastName FROM users WHERE (usr LIKE ? or firstName LIKE ?) AND usr <> ? LIMIT 0,10;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,"%"+palabra+"%");
			 statement.setString(2,"%"+palabra+"%");
			 if(usr!=null) {
				 statement.setString(3, usr);
			 }
			 else {
				 statement.setString(3, "");
			 }
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.auxiliar_setUser(rs.getString("usr"));
				 user.setFirstName(rs.getString("firstName"));
				 user.setLastName(rs.getString("lastName"));
				 l.add(user);
			 }

			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public ArrayList<User> getNotFollowedUsers(String usr, Integer start, Integer end) {
		 String query = "SELECT usr FROM users WHERE usr != ? AND usr NOT IN (SELECT usr FROM followers WHERE follower = ?) AND usr != 'admin' ORDER BY firstName LIMIT ?,?;";
		 PreparedStatement statement = null;
		 ArrayList<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 if(usr!=null) {
				 statement.setString(1,usr);
				 statement.setString(2, usr);
			 } else {
				 statement.setString(1,"");
				 statement.setString(2, "");
			 }
			 statement.setInt(3,start);
			 statement.setInt(4,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.auxiliar_setUser(rs.getString("usr"));
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public List<User> getFollowedUsers(String usr, Integer start, Integer end) {
		 String query = "SELECT usr,firstName FROM users WHERE usr != ? AND usr IN(SELECT follower FROM followers WHERE usr = ?) ORDER BY firstName LIMIT ?,?;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,usr);
			 statement.setString(2, usr);
			 statement.setInt(3,start);
			 statement.setInt(4,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.auxiliar_setUser(rs.getString("usr"));
				 user.setFirstName(rs.getString("firstName"));
				 
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public List<User> getFollowingUsers(String usr, Integer start, Integer end) {
		 String query = "SELECT usr,firstName FROM users WHERE usr != ? AND usr IN(SELECT usr FROM followers WHERE follower = ?) ORDER BY firstName LIMIT ?,?;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,usr);
			 statement.setString(2, usr);
			 statement.setInt(3,start);
			 statement.setInt(4,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.auxiliar_setUser(rs.getString("usr"));
				 user.setFirstName(rs.getString("firstName"));
				 
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	

	public List<User> getAllFollowingUsers(String usr) {
		 String query = "SELECT usr,firstName FROM users WHERE usr != ? AND usr IN(SELECT usr FROM followers WHERE follower = ?) ORDER BY firstName;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,usr);
			 statement.setString(2, usr);

			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.auxiliar_setUser(rs.getString("usr"));
				 user.setFirstName(rs.getString("firstName"));
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public List<User> getAllFollowedUsers(String usr) {
		 String query = "SELECT usr,firstName FROM users WHERE usr != ? AND usr IN(SELECT follower FROM followers WHERE usr = ?) ORDER BY firstName;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1, usr);
			 statement.setString(2, usr);

			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.auxiliar_setUser(rs.getString("usr"));
				 user.setFirstName(rs.getString("firstName"));
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public Integer getFollowers(String user) {
		String query = "SELECT COUNT(*) AS num_followers FROM followers WHERE usr = ?;";
		PreparedStatement statement = null;
		Integer num_followers = 0;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 num_followers = rs.getInt("num_followers");
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  num_followers;
	}
	
	public Integer getNumberTweets(String user) {
		String query = "SELECT COUNT(*) AS num_tweets FROM tweets WHERE usr = ? AND isComment=false;";
		PreparedStatement statement = null;
		Integer num_tweets = 0;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 num_tweets = rs.getInt("num_tweets");
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  num_tweets;
	}
	
	public Integer getNumberComments(String user) {
		String query = "SELECT COUNT(*) AS num_comments FROM tweets WHERE usr = ? AND isComment=true;";
		PreparedStatement statement = null;
		Integer num_comments = 0;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 num_comments = rs.getInt("num_comments");
			 }
			 
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  num_comments;
	}
	
	public Integer getFollowing(String user) {
		String query = "SELECT COUNT(*) AS num_following FROM followers WHERE follower = ?;";
		PreparedStatement statement = null;
		Integer num_following = 0;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 num_following = rs.getInt("num_following");
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  num_following;
	}
	
	 public void updateUserInfo(String username, String newFirstName, String newLastName, String newMail, String newPhoneNumber, String newState, String newUsername, String securityAnswer) {
		 	String query_select = "SELECT securityAnswer FROM users WHERE usr=?";
	        String query = "UPDATE users SET usr = ?, firstName = ?, lastName = ?, mail = ?, phoneNumber = ?, state = ? WHERE usr = ?";
	        PreparedStatement statement = null;
	        PreparedStatement statement_select = null;
			String realSecurityAnswer="";
			
	        try {
	        	statement_select = db.prepareStatement(query_select);
	        	statement_select.setString(1, username);
	        	ResultSet rs = statement_select.executeQuery();
				while (rs.next()) {
					 realSecurityAnswer = rs.getString("securityAnswer");
				}
				rs.close();
				statement_select.close();
				int rowsUpdated = 0;
				if(realSecurityAnswer.equals(securityAnswer)) {
		            statement = db.prepareStatement(query);
		            statement.setString(1, newUsername);
		            statement.setString(2, newFirstName);
		            statement.setString(3, newLastName);
		            statement.setString(4, newMail);
		            statement.setString(5, newPhoneNumber);
		            statement.setString(6, newState);
		            statement.setString(7, username);
		            
		            rowsUpdated = statement.executeUpdate();
		            statement.close();
				}
	            
	            if (rowsUpdated > 0) {
	                System.out.println("User information updated successfully.");
	            } else {
	                System.out.println("Failed to update user information.");
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete(User user) {
	    return(hasValue(user.getUser()) &&
	    	   hasValue(user.getMail()) &&
	    	   hasValue(user.getPwd1()) &&
	    	   hasValue(user.getFirstName()) &&
	    	   hasValue(user.getLastName()) &&
	    	   hasValue(user.getBirth()) &&
	    	   hasValue(user.getSecurityQuestion()) &&
	           hasValue(user.getSecurityAnswer()));
	}
	
	/*Check if all the fields are filled correctly */
	public boolean editIsComplete(User user) {
	    return(hasValue(user.getUser()) &&
	    	   hasValue(user.getMail()) &&
	    	   hasValue(user.getFirstName()) &&
	    	   hasValue(user.getLastName()));
	}

	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
		
	
	// TODO: add other methods 
	public boolean isUsernameTaken(String user) {
		boolean usernameTaken = false;
		String query = "SELECT * FROM users WHERE usr=?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				usernameTaken = true;
			}
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usernameTaken;
	}

	public void deleteUser(String user) {
		String query = "DELETE FROM users WHERE usr = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	
	
}
