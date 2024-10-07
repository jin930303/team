package com.mbc.team.product;

import java.util.ArrayList;

public interface ProductService  {


	ArrayList<ProductDTO> outa();

	void inserta(String fname1, String cat1, String cat2, String product, int price, String fname2);

	ProductDTO detail(int itemnum);

	ArrayList<ProductDTO> outmainbest();
	ArrayList<ProductDTO> outmainnew();

	ArrayList<ProductDTO> arbat(String cat2);

	

}
 