package co.nambbang.app.dto;

public class AdminSetleManageDto {
	private String sCtg="";
	private String sCtg2="";
	private String name1="";
	private String name2="";
	private String sDate="";
	private String eDate="";
	private String time="";
	private String sort="";
	private String stat="";
	
	
	public AdminSetleManageDto() {
		super();
	}


	public String getsCtg() {
		return sCtg;
	}


	public void setsCtg(String sCtg) {
		this.sCtg = sCtg;
	}


	public String getsCtg2() {
		return sCtg2;
	}


	public void setsCtg2(String sCtg2) {
		this.sCtg2 = sCtg2;
	}


	public String getName1() {
		return name1;
	}


	public void setName1(String name1) {
		this.name1 = name1;
	}


	public String getName2() {
		return name2;
	}


	public void setName2(String name2) {
		this.name2 = name2;
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


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getStat() {
		return stat;
	}


	public void setStat(String stat) {
		this.stat = stat;
	}


	@Override
	public String toString() {
		return "AdminSetleManageDto [sCtg=" + sCtg + ", sCtg2=" + sCtg2 + ", name1=" + name1 + ", name2=" + name2
				+ ", sDate=" + sDate + ", eDate=" + eDate + ", time=" + time + ", sort=" + sort + ", stat=" + stat
				+ "]";
	}
	
	
}
