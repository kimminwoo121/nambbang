package co.nambbang.app.dto;

import java.util.Date;

public class NoticeDto {
	private int nNo;
	private String nSj;
	private String nCn;
	private Date nDe;
	private int nCnt;
	
	public NoticeDto() {
		super();
	}
	
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnSj() {
		return nSj;
	}
	public void setnSj(String nSj) {
		this.nSj = nSj;
	}
	public String getnCn() {
		return nCn;
	}
	public void setnCn(String nCn) {
		this.nCn = nCn;
	}
	public Date getnDe() {
		return nDe;
	}
	public void setnDe(Date nDe) {
		this.nDe = nDe;
	}
	public int getnCnt() {
		return nCnt;
	}
	public void setnCnt(int nCnt) {
		this.nCnt = nCnt;
	}
	
	
}
