package bean;

import java.io.Serializable;

public class Admin implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userId, userPass;

	public Admin() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	@Override
	public String toString() {
		return "Admin [userId=" + userId + ", userPass=" + userPass + "]";
	}
 
}
