package co.nambbang.app.dto;

import java.util.Date;
import java.util.List;


public class sellerDTO {
	private String sid;
	private String pw;
	private String sname;
	private String lc;
	private String name;
	private String no;
	private String photoGroupId;
	private String photo;
	private String open;
	private String close;
	private String start;
	private String sns;
	private String intrcn;
	private String grade;
	private String status;
	
	//사진등록
	int photoNo;
	String photoName;
	byte[] photoFile;
	String photoFileBlob;
	Date writngDe;
	
	List<sellerDTO> photoList;
	
	public sellerDTO() {
		super();
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getPhotoGroupId() {
		return photoGroupId;
	}

	public void setPhotoGroupId(String photoGroupId) {
		this.photoGroupId = photoGroupId;
	}

	public List<sellerDTO> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<sellerDTO> photoList) {
		this.photoList = photoList;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public byte[] getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(byte[] photoFile) {
		this.photoFile = photoFile;
	}

	public String getPhotoFileBlob() {
		return photoFileBlob;
	}

	public void setPhotoFileBlob(String photoFileBlob) {
		this.photoFileBlob = photoFileBlob;
	}

	public Date getWritngDe() {
		return writngDe;
	}

	public void setWritngDe(Date writngDe) {
		this.writngDe = writngDe;
	}

	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getLc() {
		return lc;
	}

	public void setLc(String lc) {
		this.lc = lc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getIntrcn() {
		return intrcn;
	}

	public void setIntrcn(String intrcn) {
		this.intrcn = intrcn;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "sellerDTO [id=" + sid + ", sname=" + sname + ", lc=" + lc + ", name=" + name + ", no=" + no + ", photo="
				+ photo + ", open=" + open + ", close=" + close + ", start=" + start + ", " + "sns=" + sns + ", intrcn="
				+ intrcn + ", grade=" + grade + ", status=" + status + "]";
	}

}
