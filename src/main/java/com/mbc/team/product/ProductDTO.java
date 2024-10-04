package com.mbc.team.product;

public class ProductDTO {
	String image1, cat1, cat2, product, dimage;
    int itemnum, price;
    
	public ProductDTO() {}

	public ProductDTO(String image1, String cat1, String cat2, String product, String dimage, int itemnum, int price) {
		super();
		this.image1 = image1;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.product = product;
		this.dimage = dimage;
		this.itemnum = itemnum;
		this.price = price;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getCat1() {
		return cat1;
	}

	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}

	public String getCat2() {
		return cat2;
	}

	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getDimage() {
		return dimage;
	}

	public void setDimage(String dimage) {
		this.dimage = dimage;
	}

	public int getItemnum() {
		return itemnum;
	}

	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}


}