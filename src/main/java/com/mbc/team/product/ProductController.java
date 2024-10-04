package com.mbc.team.product;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProductController {
	
	String path = "C://project//teamproject//src//main//webapp//image";

	@Autowired
	SqlSession sqlSession;


	
	@RequestMapping(value = "/productin")
	public String lte1() {
		return "productinput";
	  }

	@RequestMapping(value = "/productsave" , method = RequestMethod.POST)
	public String lte2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
	    MultipartFile mf1 = mul.getFile("image1");
		String fname1 = mf1.getOriginalFilename();
		mf1.transferTo(new File(path+"//"+fname1));
		String cat1 = mul.getParameter("cat1");
		String cat2 = mul.getParameter("cat2");
		String product = mul.getParameter("product");
		int price = Integer.parseInt(mul.getParameter("price"));
	    MultipartFile mf2 = mul.getFile("dimage");
	    String fname2 = mf2.getOriginalFilename();
	    mf2.transferTo(new File(path+"//"+fname2));
		ProductService ps = sqlSession.getMapper(ProductService.class);
	    ps.inserta(fname1,cat1,cat2,product,price,fname2);   
		return "main";
	  }
	
	@RequestMapping(value = "/productout")
	public String lte3(Model mo) {
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.outa();
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	@RequestMapping(value = "/productdetail" , method = RequestMethod.GET)
	public String lte4(HttpServletRequest request , Model mo) { 
		int itemnum = Integer.parseInt(request.getParameter("itemnum"));
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ProductDTO dto = ps.detail(itemnum);
		mo.addAttribute("dto" , dto);
		return "productdetailview";
		}
	
}
