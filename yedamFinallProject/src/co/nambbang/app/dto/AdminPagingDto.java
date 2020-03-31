package co.nambbang.app.dto;

public class AdminPagingDto {
	private int getPage;
	private int start;
	private int end;
	private int lastPage;
	private int totalCnt;
	private int pageUnit;
	
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getGetPage() {
		return getPage;
	}
	public void setGetPage(int getPage) {
		this.getPage = getPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public AdminPagingDto() {
		super();
	}
	@Override
	public String toString() {
		return "AdminPagingDto [getPage=" + getPage + ", start=" + start + ", end=" + end + ", lastPage=" + lastPage
				+ ", totalCnt=" + totalCnt + "]";
	}
	

	
	
}
