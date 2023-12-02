package models;
import java.sql.Timestamp;

public class Tweet implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;

	 private int id;
	 private int likes;
	 private String uname;
	 private Timestamp created_at;
	 private String content;
	 private int comments;
	 private boolean isComment;

	 public Tweet() {
	 }

	 public Integer getId() {
		 return this.id;
		 
	 }
	 
	 public void setId(Integer id) {
		 this.id = id;
	 }

	 public String getUname() {
		 return this.uname;
	 }
	 
	 public void setUname(String uname) {
		 this.uname = uname;
	 }
	 
	 public String getContent() {
		 return this.content;
	 }
	 public void setContent(String content) {
		 this.content = content;
	 }

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public boolean isComment() {
		return isComment;
	}

	public void setComment(boolean isComment) {
		this.isComment = isComment;
	}


}