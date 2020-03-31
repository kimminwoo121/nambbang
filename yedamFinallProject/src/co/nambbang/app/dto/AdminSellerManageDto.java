package co.nambbang.app.dto;

public class AdminSellerManageDto {
	private String sCtg1;
	private String sCtg2;
	private String sName1;
	private String sName2;
	private String sDate;
	private String eDate;		
	private String sStat1;
	private String sStat2;
	private String sort;
	
	
	public String getsCtg1() {
		return sCtg1;
	}
	public void setsCtg1(String sCtg1) {
		this.sCtg1 = sCtg1;
	}
	public String getsCtg2() {
		return sCtg2;
	}
	public void setsCtg2(String sCtg2) {
		this.sCtg2 = sCtg2;
	}
	public String getsName1() {
		return sName1;
	}
	public void setsName1(String sName1) {
		this.sName1 = sName1;
	}
	public String getsName2() {
		return sName2;
	}
	public void setsName2(String sName2) {
		this.sName2 = sName2;
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
	public String getsStat1() {
		return sStat1;
	}
	public void setsStat1(String sStat1) {
		this.sStat1 = sStat1;
	}
	public String getsStat2() {
		return sStat2;
	}
	public void setsStat2(String sStat2) {
		this.sStat2 = sStat2;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

	public AdminSellerManageDto() {
		super();
	}
	
	
	@Override
	public String toString() {
		return "AdminSellerManageDto [sCtg1=" + sCtg1 + ", sCtg2=" + sCtg2 + ", sName1=" + sName1 + ", sName2=" + sName2
				+ ", sDate=" + sDate + ", eDate=" + eDate + ", sStat1=" + sStat1 + ", sStat2=" + sStat2 + ", sort="
				+ sort + "]";
	}
	
	
	
		
	
	
}
