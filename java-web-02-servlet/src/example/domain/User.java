package example.domain;

public class User {
	private String userSeq;
	private String userId;
	private String userName;
	private String password;
	private String joinDate;

	

	public String getUserSeq() {
		return userSeq;
	}



	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getJoinDate() {
		return joinDate;
	}



	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}



	@Override
	public String toString() {
		return super.toString();
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
