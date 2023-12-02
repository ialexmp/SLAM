package managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Tweet;
import utils.DB;


public class ManageTweets {
	
	private DB db = null ;
	
	public ManageTweets() {
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
	
	/* Add a tweet */
	public void addTweet(Tweet tweet) {
		String query = "INSERT INTO tweets (content,usr,isComment) VALUES (?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			
			statement.setString(1,tweet.getContent());
			statement.setString(2,tweet.getUname());
			statement.setBoolean(3,tweet.isComment());
	
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/* Delete existing tweet */
	public void deleteTweet(Tweet tweet) {
		String query = "DELETE FROM tweets WHERE tID = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,tweet.getId());
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/* edit a like */
	public void editLike(Tweet tweet, String usr) {
		String querySelect = "SELECT likeID FROM likes WHERE tID = ? AND usr = ?";
		String moreLikes = "UPDATE tweets SET likes = likes + 1 WHERE tID = ?";
		String lessLikes = "UPDATE tweets SET likes = likes - 1 WHERE tID = ?";
		String deleteLikes = "DELETE FROM likes WHERE tID = ? AND usr = ?";
		String insertLikes = "INSERT INTO likes (tID, usr) VALUES (?, ?);";

		PreparedStatement statementSelect = null;
		PreparedStatement statementUpdate = null;
		PreparedStatement statementInsert = null;
		PreparedStatement statementDelete = null;
		try {
			statementSelect = db.prepareStatement(querySelect);
			statementSelect.setInt(1,tweet.getId());
			statementSelect.setString(2,usr);
			ResultSet rs = statementSelect.executeQuery();
			if(rs.next()) {
				statementDelete = db.prepareStatement(deleteLikes);
				statementDelete.setInt(1, tweet.getId());
				statementDelete.setString(2, usr);
				statementDelete.executeUpdate();
				statementDelete.close();
				
				statementUpdate = db.prepareStatement(lessLikes);
				statementUpdate.setInt(1, tweet.getId());
				statementUpdate.executeUpdate();
			} else {
				statementInsert = db.prepareStatement(insertLikes);
				statementInsert.setInt(1, tweet.getId());
				statementInsert.setString(2, usr);
				statementInsert.executeUpdate();
				statementInsert.close();
				
				statementUpdate = db.prepareStatement(moreLikes);
				statementUpdate.setInt(1, tweet.getId());
				statementUpdate.executeUpdate();
			}
			statementSelect.close();
			statementUpdate.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/* Get tweets from a user given start and end*/
	public List<Tweet> getUserTweets(String usr,Integer start, Integer end) {
		 String query = "SELECT tID,usr,likes,content,isComment,comments,created_at FROM tweets WHERE usr = ? ORDER BY created_at DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,usr);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Tweet tweet = new Tweet();
       		     tweet.setId(rs.getInt("tID"));
       		     tweet.setUname(rs.getString("usr"));
				 tweet.setLikes(rs.getInt("likes"));
				 tweet.setComments(rs.getInt("comments"));
				 tweet.setCreated_at(rs.getTimestamp("created_at"));
				 tweet.setContent(rs.getString("content"));
				 if(!rs.getBoolean("isComment")) {
					 l.add(tweet);
				 }
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	/* Get tweets from a user given start and end*/
	public List<Tweet> getAllTweets(String usr,Integer start, Integer end) {
		 String query = "SELECT * FROM tweets AS t JOIN followers AS f ON f.usr = t.usr WHERE f.follower=? ORDER BY t.created_at DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,usr);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next() && l.size()<5) {
				 Tweet tweet = new Tweet();
       		     tweet.setId(rs.getInt("tID"));
				 tweet.setLikes(rs.getInt("likes"));
				 tweet.setComments(rs.getInt("comments"));
				 tweet.setCreated_at(rs.getTimestamp("created_at"));
				 tweet.setContent(rs.getString("content"));
				 tweet.setUname(rs.getString("usr"));
				 if(!rs.getBoolean("isComment")) {
					 l.add(tweet);
				 }
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}

	public List<Tweet> GetNotFollowedTweets(String user) {
		 String query = "SELECT t.tID,t.isComment,t.usr,t.likes,t.content,t.comments,t.created_at FROM tweets AS t LEFT JOIN followers AS f ON t.usr = f.usr AND f.follower=? WHERE f.usr IS NULL AND t.usr != ? ORDER BY t.created_at DESC LIMIT 0,5;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 if(user!=null) {
				statement.setString(1,user);
			 	statement.setString(2,user);
			 }
			 else {
				statement.setString(1,"");
				statement.setString(2,"");				 
			 }
			 ResultSet rs = statement.executeQuery();
			 while (rs.next() && l.size()<5) {
				 Tweet tweet = new Tweet();
				 tweet.setId(rs.getInt("tID"));
				 tweet.setLikes(rs.getInt("likes"));
				 tweet.setUname(rs.getString("usr"));
				 tweet.setComments(rs.getInt("comments"));
				 tweet.setCreated_at(rs.getTimestamp("created_at"));
				 tweet.setContent(rs.getString("content"));
				 if(!rs.getBoolean("isComment")) {
					 l.add(tweet);
				 }
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
		
	}

	public List<Tweet> getComments(Integer tID) {
		String query = "SELECT t.tID,t.likes,t.usr,t.content,t.created_at FROM tweets AS t JOIN comments AS c ON t.tID = c.id WHERE c.parent_tweet_id = ? ORDER BY t.created_at DESC LIMIT 0,5;";
		PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setInt(1,tID);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Tweet tweet = new Tweet();
				 tweet.setId(rs.getInt("tID"));
				 tweet.setLikes(rs.getInt("likes"));
				 tweet.setUname(rs.getString("usr"));
				 tweet.setCreated_at(rs.getTimestamp("created_at"));
				 tweet.setContent(rs.getString("content"));
				 l.add(tweet);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
		
	}

	public Integer getLastId() {
		String query = "SELECT tID FROM tweets ORDER BY created_at DESC LIMIT 1";
		PreparedStatement statement = null;
		Integer id = 0;
		try {
			statement = db.prepareStatement(query);
			ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 id = rs.getInt("tID");
			 }
			 rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public void addComment(Tweet tweet, Integer parent_id) {
		String query = "INSERT INTO comments (id,parent_tweet_id) VALUES (?,?)";
		PreparedStatement statement = null;
		
		try {
		
			statement = db.prepareStatement(query);
			statement.setInt(1, tweet.getId());
			statement.setInt(2, parent_id);
			
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String query2 = "UPDATE tweets SET comments = comments + 1 WHERE tID = ?;";
		PreparedStatement statement2 = null;
		try {
			
			statement2 = db.prepareStatement(query2);

			statement2.setInt(1, parent_id);
			
			statement2.executeUpdate();
			statement2.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editTweet(Tweet tweet) {
		String query_update = "UPDATE tweets SET content = ?, likes = 0 WHERE tID = ?;";
		String query_delete = "DELETE FROM likes WHERE tID = ?;";

		PreparedStatement statement = null;
		PreparedStatement statement_delete = null;
		try {
			statement = db.prepareStatement(query_update);
			statement.setString(1, tweet.getContent());
			statement.setInt(2,tweet.getId());
			statement.executeUpdate();
			statement.close();
			
			statement_delete = db.prepareStatement(query_delete);
			statement_delete.setInt(1, tweet.getId());
			statement_delete.executeUpdate();
			statement_delete.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}