package com.mbc.team.product;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

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
	
	String path = "C://team//team//src//main//webapp//image";

	@Autowired
	SqlSession sqlSession;


	@RequestMapping(value = "productin")
	public String lte1() {
		return "productinput";
	  }

	@RequestMapping(value = "productsave" , method = RequestMethod.POST)
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
	
	@RequestMapping(value = "productout")
	public String lte3(Model mo) {
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.outa();
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	@RequestMapping(value = "productdetail" , method = RequestMethod.GET)
	public String lte4(HttpServletRequest request , Model mo) { 
		int itemnum = Integer.parseInt(request.getParameter("itemnum"));
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ProductDTO dto = ps.detail(itemnum);
		mo.addAttribute("dto" , dto);
		
		return "productdetailview";
		}
	
	
	
	
	

	
	//카테고리2 출력 배트
	@RequestMapping(value = "arbat" , method = RequestMethod.GET)
	public String lte5(HttpServletRequest request , Model mo) {
		String cat2 = "알루미늄 배트";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "carbonbat" , method = RequestMethod.GET)
	public String lte6(HttpServletRequest request , Model mo) {
		String cat2 = "카본/컴포짓";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "woodbat" , method = RequestMethod.GET)
	public String lte7(HttpServletRequest request , Model mo) {
		String cat2 = "나무배트";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "pungbat" , method = RequestMethod.GET)
	public String lte8(HttpServletRequest request , Model mo) {
		String cat2 = "펑고배트";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "youngbat" , method = RequestMethod.GET)
	public String lte9(HttpServletRequest request , Model mo) {
		String cat2 = "유소년용 배트";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "trainingbat" , method = RequestMethod.GET)
	public String lte10(HttpServletRequest request , Model mo) {
		String cat2 = "트레이닝 배트";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "batgrip" , method = RequestMethod.GET)
	public String lte11(HttpServletRequest request , Model mo) {
		String cat2 = "배트그립";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "bataccessories" , method = RequestMethod.GET)
	public String lte12(HttpServletRequest request , Model mo) {
		String cat2 = "배트용품";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	
	
	//카테고리 별로 출력 글러브
	@RequestMapping(value = "pitcherallround" , method = RequestMethod.GET)
	public String lte13(HttpServletRequest request , Model mo) {
		String cat2 = "투수/올라운드";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "infielder" , method = RequestMethod.GET)
	public String lte14(HttpServletRequest request , Model mo) {
		String cat2 = "내야수";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "outfielder" , method = RequestMethod.GET)
	public String lte15(HttpServletRequest request , Model mo) {
		String cat2 = "외야수";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "catchersmitt" , method = RequestMethod.GET)
	public String lte16(HttpServletRequest request , Model mo) {
		String cat2 = "포수미트";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "youth" , method = RequestMethod.GET)
	public String lte17(HttpServletRequest request , Model mo) {
		String cat2 = "어린이/유소년용";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "glovecare" , method = RequestMethod.GET)
	public String lte18(HttpServletRequest request , Model mo) {
		String cat2 = "글러브 관리용품";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	

	
	
	//카테고리 별로 출력 야구공
	@RequestMapping(value = "hard-balls" , method = RequestMethod.GET)
	public String lte19(HttpServletRequest request , Model mo) {
		String cat2 = "경식구";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "soft-balls" , method = RequestMethod.GET)
	public String lte20(HttpServletRequest request , Model mo) {
		String cat2 = "연식구";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "snap-balls" , method = RequestMethod.GET)
	public String lte21(HttpServletRequest request , Model mo) {
		String cat2 = "스냅볼";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "ball-storage" , method = RequestMethod.GET)
	public String lte22(HttpServletRequest request , Model mo) {
		String cat2 = "야구공 보관함";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	
	
	
	//카테고리 별로 출력 보호장비
	@RequestMapping(value = "batter-helmets" , method = RequestMethod.GET)
	public String lte23(HttpServletRequest request , Model mo) {
		String cat2 = "타자헬멧";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "arm-guards" , method = RequestMethod.GET)
	public String lte24(HttpServletRequest request , Model mo) {
		String cat2 = "암가드";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "foot-guards" , method = RequestMethod.GET)
	public String lte25(HttpServletRequest request , Model mo) {
		String cat2 = "풋가드";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "hand-guards" , method = RequestMethod.GET)
	public String lte26(HttpServletRequest request , Model mo) {
		String cat2 = "핸드가드";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "face-masks" , method = RequestMethod.GET)
	public String lte27(HttpServletRequest request , Model mo) {
		String cat2 = "안면마스크";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "other-protective-gear" , method = RequestMethod.GET)
	public String lte28(HttpServletRequest request , Model mo) {
		String cat2 = "기타 보호장비";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	
	
	//카테고리 별로 출력 굿즈
	@RequestMapping(value = "keyring" , method = RequestMethod.GET)
	public String lte29(HttpServletRequest request , Model mo) {
		String cat2 = "키링";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "towel" , method = RequestMethod.GET)
	public String lte30(HttpServletRequest request , Model mo) {
		String cat2 = "타올";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "doll" , method = RequestMethod.GET)
	public String lte31(HttpServletRequest request , Model mo) {
		String cat2 = "인형";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "headbands-bracelets" , method = RequestMethod.GET)
	public String lte32(HttpServletRequest request , Model mo) {
		String cat2 = "슬리퍼";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	
	
	//카테고리 별로 출력 가방
	@RequestMapping(value = "backpacks" , method = RequestMethod.GET)
	public String lte33(HttpServletRequest request , Model mo) {
		String cat2 = "백팩";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "crossbody-bags" , method = RequestMethod.GET)
	public String lte34(HttpServletRequest request , Model mo) {
		String cat2 = "크로스백";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "wheeled-bags" , method = RequestMethod.GET)
	public String lte35(HttpServletRequest request , Model mo) {
		String cat2 = "휠가방";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "bat-bags" , method = RequestMethod.GET)
	public String lte36(HttpServletRequest request , Model mo) {
		String cat2 = "배트가방";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "ball-bags" , method = RequestMethod.GET)
	public String lte37(HttpServletRequest request , Model mo) {
		String cat2 = "볼가방";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	@RequestMapping(value = "other-bags" , method = RequestMethod.GET)
	public String lte38(HttpServletRequest request , Model mo) {
		String cat2 = "기타 가방";
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list = ps.arbat(cat2);
		mo.addAttribute("list" , list);
		return "productout";
	  }
	
	/////////////////////////////////////////
	
	
	
	
	
	
	
}
