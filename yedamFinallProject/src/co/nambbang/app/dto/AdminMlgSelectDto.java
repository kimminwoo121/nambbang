package co.nambbang.app.dto;

public class AdminMlgSelectDto {
	private String mName;
	private String sDate;
	private String eDate;
	
	
	public AdminMlgSelectDto() {
		super();
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	@Override
	public String toString() {
		return "AdminMlgSelectDto [mName=" + mName + ", sDate=" + sDate + ", eDate=" + eDate + "]";
	}
	
}
