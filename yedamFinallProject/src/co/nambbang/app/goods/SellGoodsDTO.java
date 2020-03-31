package co.nambbang.app.goods;

public class SellGoodsDTO extends GoodsDTO{
	//상품판매등록
	private String sleId;
	private int sleQy;
	private int slePc;
	private String mnfcturDe;
	private String mnfcturDeYmd;
	private String mnfcturDeHh;
	private String mnfcturDeMm;
	private String mnfcturDeSs;
	
	private String sleBeginTime;
	private String sleBeginTimeHh;
	private String sleBeginTimeMm;
	private String sleBeginTimeSs;
	private String sleEndTime;
	private String sleEndTimeHh;
	private String sleEndTimeMm;
	private String sleEndTimeSs;
	private String goosSleResult;
	private String goosSleResultView;
	
	private String canclResn;
	private String canclDe;
	private String canclDeView;
	private String canclYn;
	
	public String getSleId() {
		return sleId;
	}
	public void setSleId(String sleId) {
		this.sleId = sleId;
	}
	public int getSleQy() {
		return sleQy;
	}
	public void setSleQy(int sleQy) {
		this.sleQy = sleQy;
	}
	public int getSlePc() {
		return slePc;
	}
	public void setSlePc(int slePc) {
		this.slePc = slePc;
	}
	public String getMnfcturDe() {
		return mnfcturDe;
	}
	public void setMnfcturDe(String mnfcturDe) {
		this.mnfcturDe = mnfcturDe;
	}
	public String getSleBeginTime() {
		return sleBeginTime;
	}
	public void setSleBeginTime(String sleBeginTime) {
		this.sleBeginTime = sleBeginTime;
	}
	public String getSleEndTime() {
		return sleEndTime;
	}
	public void setSleEndTime(String sleEndTime) {
		this.sleEndTime = sleEndTime;
	}
	public String getCanclResn() {
		return canclResn;
	}
	public void setCanclResn(String canclResn) {
		this.canclResn = canclResn;
	}
	public String getCanclDe() {
		return canclDe;
	}
	public void setCanclDe(String canclDe) {
		this.canclDe = canclDe;
	}
	public String getCanclYn() {
		return canclYn;
	}
	public void setCanclYn(String canclYn) {
		this.canclYn = canclYn;
	}
	public String getMnfcturDeYmd() {
		return mnfcturDeYmd;
	}
	public void setMnfcturDeYmd(String mnfcturDeYmd) {
		this.mnfcturDeYmd = mnfcturDeYmd;
	}
	public String getMnfcturDeHh() {
		return mnfcturDeHh;
	}
	public void setMnfcturDeHh(String mnfcturDeHh) {
		this.mnfcturDeHh = mnfcturDeHh;
	}
	public String getMnfcturDeMm() {
		return mnfcturDeMm;
	}
	public void setMnfcturDeMm(String mnfcturDeMm) {
		this.mnfcturDeMm = mnfcturDeMm;
	}
	public String getMnfcturDeSs() {
		return mnfcturDeSs;
	}
	public void setMnfcturDeSs(String mnfcturDeSs) {
		this.mnfcturDeSs = mnfcturDeSs;
	}
	public String getSleBeginTimeHh() {
		return sleBeginTimeHh;
	}
	public void setSleBeginTimeHh(String sleBeginTimeHh) {
		this.sleBeginTimeHh = sleBeginTimeHh;
	}
	public String getSleBeginTimeMm() {
		return sleBeginTimeMm;
	}
	public void setSleBeginTimeMm(String sleBeginTimeMm) {
		this.sleBeginTimeMm = sleBeginTimeMm;
	}
	public String getSleBeginTimeSs() {
		return sleBeginTimeSs;
	}
	public void setSleBeginTimeSs(String sleBeginTimeSs) {
		this.sleBeginTimeSs = sleBeginTimeSs;
	}
	public String getSleEndTimeHh() {
		return sleEndTimeHh;
	}
	public void setSleEndTimeHh(String sleEndTimeHh) {
		this.sleEndTimeHh = sleEndTimeHh;
	}
	public String getSleEndTimeMm() {
		return sleEndTimeMm;
	}
	public void setSleEndTimeMm(String sleEndTimeMm) {
		this.sleEndTimeMm = sleEndTimeMm;
	}
	public String getSleEndTimeSs() {
		return sleEndTimeSs;
	}
	public void setSleEndTimeSs(String sleEndTimeSs) {
		this.sleEndTimeSs = sleEndTimeSs;
	}
	public String getGoosSleResult() {
		return goosSleResult;
	}
	public void setGoosSleResult(String goosSleResult) {
		this.goosSleResult = goosSleResult;
	}
	public String getGoosSleResultView() {
		return goosSleResultView;
	}
	public void setGoosSleResultView(String goosSleResultView) {
		this.goosSleResultView = goosSleResultView;
	}
	public String getCanclDeView() {
		return canclDeView;
	}
	public void setCanclDeView(String canclDeView) {
		this.canclDeView = canclDeView;
	}
	@Override
	public String toString() {
		return "SellGoodsDTO [sleId=" + sleId + ", sleQy=" + sleQy + ", slePc=" + slePc + ", mnfcturDe=" + mnfcturDe
				+ ", mnfcturDeYmd=" + mnfcturDeYmd + ", mnfcturDeHh=" + mnfcturDeHh + ", mnfcturDeMm=" + mnfcturDeMm
				+ ", mnfcturDeSs=" + mnfcturDeSs + ", sleBeginTime=" + sleBeginTime + ", sleBeginTimeHh="
				+ sleBeginTimeHh + ", sleBeginTimeMm=" + sleBeginTimeMm + ", sleBeginTimeSs=" + sleBeginTimeSs
				+ ", sleEndTime=" + sleEndTime + ", sleEndTimeHh=" + sleEndTimeHh + ", sleEndTimeMm=" + sleEndTimeMm
				+ ", sleEndTimeSs=" + sleEndTimeSs + ", goosSleResult=" + goosSleResult + ", goosSleResultView="
				+ goosSleResultView + ", canclResn=" + canclResn + ", canclDe=" + canclDe + ", canclDeView="
				+ canclDeView + ", canclYn=" + canclYn + "]";
	}
	
}
