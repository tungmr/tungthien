package web.model;

public class User {

	private int idUser;
	private String name;
	private String userName;
	private String passwordUser;
	private String emailUser;
	private String phoneNumberUser;
	private int roleUser;
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int idUser,String name, String userName, String passwordUser, String emailUser, String phoneNumberUser,
			int roleUser) {
		super();
		this.idUser = idUser;
		this.name = name;
		this.userName = userName;
		this.passwordUser = passwordUser;
		this.emailUser = emailUser;
		this.phoneNumberUser = phoneNumberUser;
		this.roleUser = roleUser;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPasswordUser() {
		return passwordUser;
	}
	public void setPasswordUser(String passwordUser) {
		this.passwordUser = passwordUser;
	}
	public String getEmailUser() {
		return emailUser;
	}
	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	public String getPhoneNumberUser() {
		return phoneNumberUser;
	}
	public void setPhoneNumberUser(String phoneNumberUser) {
		this.phoneNumberUser = phoneNumberUser;
	}
	public int getRoleUser() {
		return roleUser;
	}
	public void setRoleUser(int roleUser) {
		this.roleUser = roleUser;
	}
	
	
}
