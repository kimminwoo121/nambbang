package co.nambbang.app.dto;

public class AdminMlgDto {	
	private int period;
	private int amount;
	private int percent;
	private int newUser;
	private int useSumAble;
	private int useMlgAble;	
	private String mDate;
	private String mName;
	private String sDate;
	private String eDate;
	
	public AdminMlgDto() {
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


	public String getmDate() {
		return mDate;
	}


	public void setmDate(String mDate) {
		this.mDate = mDate;
	}


	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getNewUser() {
		return newUser;
	}
	public void setNewUser(int newUser) {
		this.newUser = newUser;
	}
	public int getUseSumAble() {
		return useSumAble;
	}
	public void setUseSumAble(int useSumAble) {
		this.useSumAble = useSumAble;
	}
	public int getUseMlgAble() {
		return useMlgAble;
	}
	public void setUseMlgAble(int useMlgAble) {
		this.useMlgAble = useMlgAble;
	}


	@Override
	public String toString() {
		return "AdminMlgDto [period=" + period + ", amount=" + amount + ", percent=" + percent + ", newUser=" + newUser
				+ ", useSumAble=" + useSumAble + ", useMlgAble=" + useMlgAble + ", mDate=" + mDate + ", mName=" + mName
				+ ", sDate=" + sDate + ", eDate=" + eDate + "]";
	}


	
	
	
}
