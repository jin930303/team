package com.mbc.team.cart;

public class CartItem {
	private int itemnum;
	private String product;
	private int price;
	private int count;
	
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public CartItem(int itemnum, String product, int price, int count) {
		super();
		this.itemnum = itemnum;
		this.product = product;
		this.price = price;
		this.count = count;
	}

	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}
}