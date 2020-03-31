package co.nambbang.app.dto;

import java.util.Arrays;

public class UsersMyPageDto {

	private byte[] photoName; //사진
	private String photoString; //사진 문자로 변환
	
	private String goodsName; //상품이름
	private String orderQy;  //구매개수
	private String setleCode; //SC결제완료,CR환불신청,CC환불완료
	private String orderId;
	private int orderGroupNo; //주문그룹(주문별개)
	private String sleId; //판매등록 상품 ID;
	private String setleDe; //상품 결제 시간
	private int setleAmount; // 상품 결제 금액
	private double la;
	private double lo;
	private String cmpnm;
	
	
	
	
	
	public String getCmpnm() {
		return cmpnm;
	}
	public void setCmpnm(String cmpnm) {
		this.cmpnm = cmpnm;
	}
	public double getLa() {
		return la;
	}
	public void setLa(double la) {
		this.la = la;
	}
	public double getLo() {
		return lo;
	}
	public void setLo(double lo) {
		this.lo = lo;
	}
	public String getSetleDe() {
		return setleDe;
	}
	public void setSetleDe(String setleDe) {
		this.setleDe = setleDe;
	}
	
	public int getSetleAmount() {
		return setleAmount;
	}
	public void setSetleAmount(int setleAmount) {
		this.setleAmount = setleAmount;
	}
	public String getSleId() {
		return sleId;
	}
	public void setSleId(String sleId) {
		this.sleId = sleId;
	}
	public String getPhotoString() {
		return photoString;
	}
	public void setPhotoString(String photoString) {
		this.photoString = photoString;
	}
	public byte[] getPhotoName() {
		return photoName;
	}
	public void setPhotoName(byte[] photoName) {
		this.photoName = photoName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getOrderQy() {
		return orderQy;
	}
	public void setOrderQy(String orderQy) {
		this.orderQy = orderQy;
	}
	public String getSetleCode() {
		return setleCode;
	}
	public void setSetleCode(String setleCode) {
		this.setleCode = setleCode;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getOrderGroupNo() {
		return orderGroupNo;
	}
	public void setOrderGroupNo(int orderGroupNo) {
		this.orderGroupNo = orderGroupNo;
	}
	@Override
	public String toString() {
		return "UsersMyPageDto [photoName=" + Arrays.toString(photoName) + ", photoString=" + photoString
				+ ", goodsName=" + goodsName + ", orderQy=" + orderQy + ", setleCode=" + setleCode + ", orderId="
				+ orderId + ", orderGroupNo=" + orderGroupNo + ", sleId=" + sleId + ", setleDe=" + setleDe
				+ ", setleAmount=" + setleAmount + ", la=" + la + ", lo=" + lo + ", cmpnm=" + cmpnm + "]";
	}
	
}
