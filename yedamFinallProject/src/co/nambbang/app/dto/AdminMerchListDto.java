package co.nambbang.app.dto;

public class AdminMerchListDto {
	private String mCtg="";
	private String mId="";
	private String selId="";
	private String sDate="";
	private String eDate="";
	private String sTime="";
	private String eTime="";
	private String mStat="";
	private String sort="";
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getmCtg() {
		return mCtg;
	}
	public void setmCtg(String mCtg) {
		this.mCtg = mCtg;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getSelId() {
		return selId;
	}
	public void setSelId(String selId) {
		this.selId = selId;
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
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String getmStat() {
		return mStat;
	}
	public void setmStat(String mStat) {
		this.mStat = mStat;
	}
	@Override
	public String toString() {
		return "AdminMerchListDto [mCtg=" + mCtg + ", mId=" + mId + ", selId=" + selId + ", sDate=" + sDate + ", eDate="
				+ eDate + ", sTime=" + sTime + ", eTime=" + eTime + ", mStat=" + mStat + "]";
	}
	
	
	
}
