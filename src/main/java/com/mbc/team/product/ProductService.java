package com.mbc.team.product;

import java.util.ArrayList;

public interface ProductService  {


	ArrayList<ProductDTO> outa();

	ProductDTO detail(int itemnum);

	ArrayList<ProductDTO> outmainbest();
	
	ArrayList<ProductDTO> outmainnew();

	ArrayList<ProductDTO> arbat(String scg_code);
	
	void inserta(String fname1, String cg_code, String scg_code, String product, int price, String fname2);

	void deleteProduct(Integer itemnum);

	ArrayList<ProductDTO> outd();

	ProductDTO update(int itemnum);

	void productupdatesave(String fname1, String cg_code, String scg_code, String product, int price, String fname2,
			int itemnum);

	void pview(int itemnum);

	ArrayList<ProductDTO> besta();

	ArrayList<ProductDTO> newa();

	

  

}
 