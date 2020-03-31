package co.nambbang.app.goods;

import java.util.Date;
import java.util.List;

public class GoodsDTO {
	//상품등록
	private String goodsId;
	private String goodsName;
	private Date rgsde;
	private int netprc;
	private String goodsInfo;
	private String selerId;
	private String photoGroupId;
	private String goodsCl;
	private String rgsdeView;
	
	//사진등록
	private int photoNo;
	private String photoName;
	private byte[] photoFile;
	private String photoFileBlob;
	private Date writngDe;
	
	private int sellCnt;
	
	private List<GoodsDTO> photoList;

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Date getRgsde() {
		return rgsde;
	}

	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}

	public int getNetprc() {
		return netprc;
	}

	public void setNetprc(int netprc) {
		this.netprc = netprc;
	}

	public String getGoodsInfo() {
		return goodsInfo;
	}

	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}

	public String getSelerId() {
		return selerId;
	}

	public void setSelerId(String selerId) {
		this.selerId = selerId;
	}

	public String getPhotoGroupId() {
		return photoGroupId;
	}

	public void setPhotoGroupId(String photoGroupId) {
		this.photoGroupId = photoGroupId;
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

	public Date getWritngDe() {
		return writngDe;
	}

	public void setWritngDe(Date writngDe) {
		this.writngDe = writngDe;
	}

	public List<GoodsDTO> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<GoodsDTO> photoList) {
		this.photoList = photoList;
	}

	public String getPhotoFileBlob() {
		return photoFileBlob;
	}

	public void setPhotoFileBlob(String photoFileBlob) {
		this.photoFileBlob = photoFileBlob;
	}

	public String getGoodsCl() {
		return goodsCl;
	}

	public void setGoodsCl(String goodsCl) {
		this.goodsCl = goodsCl;
	}

	public String getRgsdeView() {
		return rgsdeView;
	}

	public void setRgsdeView(String rgsdeView) {
		this.rgsdeView = rgsdeView;
	}

	public int getSellCnt() {
		return sellCnt;
	}

	public void setSellCnt(int sellCnt) {
		this.sellCnt = sellCnt;
	}

}
