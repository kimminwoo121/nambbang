package co.nambbang.app.dto;

public class AdminSelngAnalysisDto {
	private String sDate;
	private String eDate;
	
	public AdminSelngAnalysisDto() {
		super();
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
		return "AdminSelngAnalysisDto [sDate=" + sDate + ", eDate=" + eDate + "]";
	}
	
	
	
	
}
