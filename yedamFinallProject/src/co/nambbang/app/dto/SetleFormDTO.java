package co.nambbang.app.dto;

public class SetleFormDTO {
	//주문에 대한 판매id , 상품이름,  주문수량 ,  판매가격 , 상품이미지
	private String sleId;
	private String goodsName;
	private int orderQy;
	private int slePc;
	private String photoFile;
	
	
	
	public SetleFormDTO(String sleId, String goodsName, int orderQy, int slePc, String photoFile) {
		super();
		this.sleId = sleId;
		this.goodsName = goodsName;
		this.orderQy = orderQy;
		this.slePc = slePc;
		this.photoFile = photoFile;
	}


	public String getPhotoFile() {
		return photoFile;
	}


	public void setPhotoFile(String photoFile) {
		this.photoFile = photoFile;
	}


	public SetleFormDTO() {
		super();
	}
	
	
	public String getSleId() {
		return sleId;
	}
	public void setSleId(String sleId) {
		this.sleId = sleId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getOrderQy() {
		return orderQy;
	}
	public void setOrderQy(int orderQy) {
		this.orderQy = orderQy;
	}
	public int getSlePc() {
		return slePc;
	}
	public void setSlePc(int slePc) {
		this.slePc = slePc;
	}
	
	
	

}
