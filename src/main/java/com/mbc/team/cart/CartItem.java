package com.mbc.team.cart;

public class CartItem {
	int itemnum;
	String id,product;
	int price,count;
	String image1,op1;
	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartItem(int itemnum, String id, String product, int price, int count, String image1, String op1) {
		super();
		this.itemnum = itemnum;
		this.id = id;
		this.product = product;
		this.price = price;
		this.count = count;
		this.image1 = image1;
		this.op1 = op1;
	}
	public int getItemnum() {
		return itemnum;
	}
	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getOp1() {
		return op1;
	}
	public void setOp1(String op1) {
		this.op1 = op1;
	}
	
	
}