package com.mbc.team.Like;

public class LikeDTO {
	String id, image1, cg_code, scg_code, product, dimage;
	int likenum, itemnum, price , sale , saleprice;
	public LikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeDTO(String id, String image1, String cg_code, String scg_code, String product, String dimage,
			int likenum, int itemnum, int price, int sale, int saleprice) {
		super();
		this.id = id;
		this.image1 = image1;
		this.cg_code = cg_code;
		this.scg_code = scg_code;
		this.product = product;
		this.dimage = dimage;
		this.likenum = likenum;
		this.itemnum = itemnum;
		this.price = price;
		this.sale = sale;
		this.saleprice = saleprice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getCg_code() {
		return cg_code;
	}
	public void setCg_code(String cg_code) {
		this.cg_code = cg_code;
	}
	public String getScg_code() {
		return scg_code;
	}
	public void setScg_code(String scg_code) {
		this.scg_code = scg_code;
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
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
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
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
}