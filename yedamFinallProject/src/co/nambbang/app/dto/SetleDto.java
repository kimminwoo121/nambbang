package co.nambbang.app.dto;

public class SetleDto {
	private Long setleNo;
	private String orderMn;
	private String setleConfmCode;
	private int setleAmount;
	private int mlgUseAmount;
	private int orderGroupNo;
	private String orderTelno;
	
	public Long getSetleNo() {
		return setleNo;
	}
	public void setSetleNo(Long setleNo) {
		this.setleNo = setleNo;
	}
	public String getOrderMn() {
		return orderMn;
	}
	public void setOrderMn(String orderMn) {
		this.orderMn = orderMn;
	}
	public String getSetleConfmCode() {
		return setleConfmCode;
	}
	public void setSetleConfmCode(String setleConfmCode) {
		this.setleConfmCode = setleConfmCode;
	}
	public int getSetleAmount() {
		return setleAmount;
	}
	public void setSetleAmount(int setleAmount) {
		this.setleAmount = setleAmount;
	}
	public int getMlgUseAmount() {
		return mlgUseAmount;
	}
	public void setMlgUseAmount(int mlgUseAmount) {
		this.mlgUseAmount = mlgUseAmount;
	}
	public int getOrderGroupNo() {
		return orderGroupNo;
	}
	public void setOrderGroupNo(int orderGroupNo) {
		this.orderGroupNo = orderGroupNo;
	}
	public String getOrderTelno() {
		return orderTelno;
	}
	public void setOrderTelno(String orderTelno) {
		this.orderTelno = orderTelno;
	}
	
	public SetleDto(Long setleNo, String orderMn, String setleConfmCode, int setleAmount, int mlgUseAmount,
			int orderGroupNo, String orderTelno) {
		super();
		this.setleNo = setleNo;
		this.orderMn = orderMn;
		this.setleConfmCode = setleConfmCode;
		this.setleAmount = setleAmount;
		this.mlgUseAmount = mlgUseAmount;
		this.orderGroupNo = orderGroupNo;
		this.orderTelno = orderTelno;
	}
	public SetleDto() {
		super();
	}

	
}
