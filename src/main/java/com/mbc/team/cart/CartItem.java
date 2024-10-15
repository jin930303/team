package com.mbc.team.cart;

public class CartItem {
	private int itemnum;
	private String product;
	private int price;
	private String op1;
	private int count;
	private String image1;
	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartItem(int itemnum, String product, int price, String op1, int count, String image1) {
		super();
		this.itemnum = itemnum;
		this.product = product;
		this.price = price;
		this.op1 = op1;
		this.count = count;
		this.image1 = image1;
	}
	public int getItemnum() {
		return itemnum;
	}
	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOp1() {
		return op1;
	}
	public void setOp1(String op1) {
		this.op1 = op1;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	
	
	
	
}