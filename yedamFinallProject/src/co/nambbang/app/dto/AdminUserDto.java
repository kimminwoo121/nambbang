package co.nambbang.app.dto;

public class AdminUserDto {
	private String uCtg1;
	private String uCtg2;
	private String uName1;
	private String uName2;
	private String sDate;
	private String eDate;
	private String uStat1;
	private String uStat2;
	private String sort;

	public AdminUserDto() {
		super();
	}

	public String getuCtg1() {
		return uCtg1;
	}

	public void setuCtg1(String uCtg1) {
		this.uCtg1 = uCtg1;
	}

	public String getuCtg2() {
		return uCtg2;
	}

	public void setuCtg2(String uCtg2) {
		this.uCtg2 = uCtg2;
	}

	public String getuName1() {
		return uName1;
	}

	public void setuName1(String uName1) {
		this.uName1 = uName1;
	}

	public String getuName2() {
		return uName2;
	}

	public void setuName2(String uName2) {
		this.uName2 = uName2;
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

	public String getuStat1() {
		return uStat1;
	}

	public void setuStat1(String uStat1) {
		this.uStat1 = uStat1;
	}

	public String getuStat2() {
		return uStat2;
	}

	public void setuStat2(String uStat2) {
		this.uStat2 = uStat2;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "AdminUserDto [uCtg1=" + uCtg1 + ", uCtg2=" + uCtg2 + ", uName1=" + uName1 + ", uName2=" + uName2
				+ ", sDate=" + sDate + ", eDate=" + eDate + ", uStat1=" + uStat1 + ", uStat2=" + uStat2 + ", sort="
				+ sort + "]";
	}

}
