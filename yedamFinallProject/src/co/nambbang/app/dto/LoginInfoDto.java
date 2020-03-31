package co.nambbang.app.dto;

public class LoginInfoDto {
	String id;
	String password;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "LoginInfoDto [id=" + id + ", password=" + password + "]";
	}
	
}
