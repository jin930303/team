package com.mbc.team.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.team.Like.LikeDTO;
import com.mbc.team.login.LoginDTO;

@Controller
public class ProductController {
	
	String path = "C://team//team//src//main//webapp//image";

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "productin")
	public String lte1() {
		return "productinput";
	}

		@RequestMapping(value = "productsave", method = RequestMethod.POST)  //상품 정보 저장
		public String lte2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
			MultipartFile mf1 = mul.getFile("image1");
			String fname1 = mf1.getOriginalFilename();
			mf1.transferTo(new File(path + "//" + fname1));
			String cg_code = mul.getParameter("cg_code");
			String scg_code = mul.getParameter("scg_code");
			String product = mul.getParameter("product");
			int price = Integer.parseInt(mul.getParameter("price"));
			int sale = Integer.parseInt(mul.getParameter("sale"));
			MultipartFile mf2 = mul.getFile("dimage");
			String fname2 = mf2.getOriginalFilename();
			mf2.transferTo(new File(path + "//" + fname2));
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ps.inserta(fname1, cg_code, scg_code, product, price, fname2, sale);
			return "main";
		}
	
		@RequestMapping(value = "productout", method = RequestMethod.GET)  //상품 정보 출력
		public String lte3(Model mo, HttpServletRequest request) {
			HttpSession hs = request.getSession();
			LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
			String loginid=dto3.getId();
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ArrayList<ProductDTO> list = ps.outa();
			ArrayList<LikeDTO> like = ps.outb(loginid);
			mo.addAttribute("list", list);
			mo.addAttribute("like", like);
			System.out.println(like);
			return "productout";
		}
	
		@RequestMapping(value = "productdetail", method = RequestMethod.GET)  //상품정보 상세 정보
		public String lte4(HttpServletRequest request, Model mo) {
			int itemnum = Integer.parseInt(request.getParameter("itemnum"));
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ps.pview(itemnum);
			ProductDTO dto = ps.detail(itemnum);
			mo.addAttribute("dto", dto);
			return "productdetailview";
		}
		
		@RequestMapping(value = "searchItem", method = RequestMethod.GET)
		public String search(HttpServletRequest request, Model mo) {
		    String search = request.getParameter("query");
		    
		    System.out.println("검색어: " + search);  

		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.searchItem(search);
		    mo.addAttribute("list", list);
		    System.out.println("데이터 : " + list);
		    return "searchresult";
		}
		
	
		
		// 카테고리2 출력 배트
		@RequestMapping(value = "arbat", method = RequestMethod.GET)
		public String lte5(HttpServletRequest request, Model mo) {
		    String scg_code = "bat001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "carbonbat", method = RequestMethod.GET)
		public String lte6(HttpServletRequest request, Model mo) {
		    String scg_code = "bat002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "woodbat", method = RequestMethod.GET)
		public String lte7(HttpServletRequest request, Model mo) {
		    String scg_code = "bat003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "pungbat", method = RequestMethod.GET)
		public String lte8(HttpServletRequest request, Model mo) {
		    String scg_code = "bat004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "youngbat", method = RequestMethod.GET)
		public String lte9(HttpServletRequest request, Model mo) {
		    String scg_code = "bat005";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "trainingbat", method = RequestMethod.GET)
		public String lte10(HttpServletRequest request, Model mo) {
		    String scg_code = "bat006";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "batgrip", method = RequestMethod.GET)
		public String lte11(HttpServletRequest request, Model mo) {
		    String scg_code = "bat008";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "bataccessories", method = RequestMethod.GET)
		public String lte12(HttpServletRequest request, Model mo) {
		    String scg_code = "bat009";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		// 카테고리 별로 출력 글러브
		@RequestMapping(value = "pitcherallround", method = RequestMethod.GET)
		public String lte13(HttpServletRequest request, Model mo) {
		    String scg_code = "mitt001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "infielder", method = RequestMethod.GET)
		public String lte14(HttpServletRequest request, Model mo) {
		    String scg_code = "mitt002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "outfielder", method = RequestMethod.GET)
		public String lte15(HttpServletRequest request, Model mo) {
		    String scg_code = "mitt003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "catchersmitt", method = RequestMethod.GET)
		public String lte16(HttpServletRequest request, Model mo) {
		    String scg_code = "mitt004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "youth", method = RequestMethod.GET)
		public String lte17(HttpServletRequest request, Model mo) {
		    String scg_code = "mitt005";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "glovecare", method = RequestMethod.GET)
		public String lte18(HttpServletRequest request, Model mo) {
		    String scg_code = "mitt006";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

	
		
		// 카테고리 별로 출력 야구공
		@RequestMapping(value = "hard-balls", method = RequestMethod.GET)
		public String lte19(HttpServletRequest request, Model mo) {
		    String scg_code = "baseball001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "soft-balls", method = RequestMethod.GET)
		public String lte20(HttpServletRequest request, Model mo) {
		    String scg_code = "baseball002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		@RequestMapping(value = "snap-balls", method = RequestMethod.GET)
		public String lte21(HttpServletRequest request, Model mo) {
		    String scg_code = "baseball004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);		    
		    return "productout";
		}

		@RequestMapping(value = "ball-storage", method = RequestMethod.GET)
		public String lte22(HttpServletRequest request, Model mo) {
		    String scg_code = "baseball007";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("scg_code", scg_code);
		    mo.addAttribute("list", list);
		    return "productout";
		}

		// 카테고리 별로 출력 보호장비
		@RequestMapping(value = "batter-helmets", method = RequestMethod.GET)
		public String lte23(HttpServletRequest request, Model mo) {
		    String scg_code = "protect001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "arm-guards", method = RequestMethod.GET)
		public String lte24(HttpServletRequest request, Model mo) {
		    String scg_code = "protect002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "foot-guards", method = RequestMethod.GET)
		public String lte25(HttpServletRequest request, Model mo) {
		    String scg_code = "protect003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "hand-guards", method = RequestMethod.GET)
		public String lte26(HttpServletRequest request, Model mo) {
		    String scg_code = "protect004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "face-masks", method = RequestMethod.GET)
		public String lte27(HttpServletRequest request, Model mo) {
		    String scg_code = "protect005";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "other-protective-gear", method = RequestMethod.GET)
		public String lte28(HttpServletRequest request, Model mo) {
		    String scg_code = "protect006";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		// 카테고리 별로 출력 굿즈
		@RequestMapping(value = "keyring", method = RequestMethod.GET)
		public String lte29(HttpServletRequest request, Model mo) {
		    String scg_code = "goods001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "towel", method = RequestMethod.GET)
		public String lte30(HttpServletRequest request, Model mo) {
		    String scg_code = "goods002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "doll", method = RequestMethod.GET)
		public String lte31(HttpServletRequest request, Model mo) {
		    String scg_code = "goods003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "headbands-bracelets", method = RequestMethod.GET)
		public String lte32(HttpServletRequest request, Model mo) {
		    String scg_code = "goods004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		// 카테고리 별로 출력 가방
		@RequestMapping(value = "backpacks", method = RequestMethod.GET)
		public String lte33(HttpServletRequest request, Model mo) {
		    String scg_code = "bag001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "crossbody-bags", method = RequestMethod.GET)
		public String lte34(HttpServletRequest request, Model mo) {
		    String scg_code = "bag002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "wheeled-bags", method = RequestMethod.GET)
		public String lte35(HttpServletRequest request, Model mo) {
		    String scg_code = "bag004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "bat-bags", method = RequestMethod.GET)
		public String lte36(HttpServletRequest request, Model mo) {
		    String scg_code = "bag005";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "ball-bags", method = RequestMethod.GET)
		public String lte37(HttpServletRequest request, Model mo) {
		    String scg_code = "bag006";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "other-bags", method = RequestMethod.GET)
		public String lte38(HttpServletRequest request, Model mo) {
		    String scg_code = "bag009";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		
		// 카테고리 별로 출력 장갑
		@RequestMapping(value = "batting-gloves", method = RequestMethod.GET)
		public String lte39(HttpServletRequest request, Model mo) {
		    String scg_code = "glove001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "fielding-gloves", method = RequestMethod.GET)
		public String lte40(HttpServletRequest request, Model mo) {
		    String scg_code = "glove002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "base-running-gloves", method = RequestMethod.GET)
		public String lte41(HttpServletRequest request, Model mo) {
		    String scg_code = "glove003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "thermal-gloves", method = RequestMethod.GET)
		public String lte42(HttpServletRequest request, Model mo) {
		    String scg_code = "glove004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "youth-gloves", method = RequestMethod.GET)
		public String lte43(HttpServletRequest request, Model mo) {
		    String scg_code = "glove005";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		// 카테고리 별로 출력 야구화
		@RequestMapping(value = "integrated-spikes", method = RequestMethod.GET)
		public String lte44(HttpServletRequest request, Model mo) {
		    String scg_code = "shoes001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "turf-shoes", method = RequestMethod.GET)
		public String lte45(HttpServletRequest request, Model mo) {
		    String scg_code = "shoes003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "point-shoes", method = RequestMethod.GET)
		public String lte46(HttpServletRequest request, Model mo) {
		    String scg_code = "shoes004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "shoe-accessories", method = RequestMethod.GET)
		public String lte47(HttpServletRequest request, Model mo) {
		    String scg_code = "shoes006";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		// 카테고리 별로 출력 의류
		@RequestMapping(value = "t-shirts", method = RequestMethod.GET)
		public String lte48(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "undershirts", method = RequestMethod.GET)
		public String lte49(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "sliding-pants", method = RequestMethod.GET)
		public String lte50(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "long-short-pants", method = RequestMethod.GET)
		public String lte51(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "icing-wear", method = RequestMethod.GET)
		public String lte52(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes005";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "windbreakers", method = RequestMethod.GET)
		public String lte53(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes006";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "jackets", method = RequestMethod.GET)
		public String lte54(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes007";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "training-wear", method = RequestMethod.GET)
		public String lte55(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes008";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "hoodies", method = RequestMethod.GET)
		public String lte56(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes009";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "hats-belts-socks", method = RequestMethod.GET)
		public String lte57(HttpServletRequest request, Model mo) {
		    String scg_code = "clothes010";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		// 카테고리 별로 출력 기타용품
		@RequestMapping(value = "sunglasses", method = RequestMethod.GET)
		public String lte58(HttpServletRequest request, Model mo) {
		    String scg_code = "etc001";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "accessories", method = RequestMethod.GET)
		public String lte59(HttpServletRequest request, Model mo) {
		    String scg_code = "etc002";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "wristbands", method = RequestMethod.GET)
		public String lte60(HttpServletRequest request, Model mo) {
		    String scg_code = "etc003";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "rosin-bags", method = RequestMethod.GET)
		public String lte61(HttpServletRequest request, Model mo) {
		    String scg_code = "etc004";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		@RequestMapping(value = "bases", method = RequestMethod.GET)
		public String lte62(HttpServletRequest request, Model mo) {
		    String scg_code = "etc007";
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ArrayList<ProductDTO> list = ps.arbat(scg_code);
		    mo.addAttribute("list", list);
		    mo.addAttribute("scg_code", scg_code);
		    return "productout";
		}

		
		@RequestMapping(value = "productdelete", method = RequestMethod.GET)  //상품 정보 삭제
		public String lte63(@RequestParam(value = "itemnum", required = false) Integer itemnum, Model mo) {
		    ProductService ps = sqlSession.getMapper(ProductService.class);		    
		    // itemnum이 null이 아닐 경우에만 삭제
		    if (itemnum != null) {
		        ps.deleteProduct(itemnum); // 삭제 메소드 호출
		    }    
		    // 상품 목록을 다시 불러옴
		    ArrayList<ProductDTO> list = ps.outd();
		    mo.addAttribute("list", list);
		    return "productdeleteout"; // 삭제 후 보여줄 페이지
		}
		
		@RequestMapping(value = "/producteupdate")  //상품 정보 수정
		public String lte64(HttpServletRequest request,Model mo) {	
			int itemnum = Integer.parseInt(request.getParameter("itemnum"));
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ProductDTO dto = ps.update(itemnum);
			mo.addAttribute("dto", dto);
			return "productupdate";			
		}
		
		@RequestMapping(value = "productupdatesave", method = RequestMethod.POST) //상품 정보 수정목록
		public String lte65(MultipartHttpServletRequest mul , Model mo) throws IllegalStateException, IOException {
		    String path = "C:\\Users\\3-14\\git\\team\\src\\main\\webapp\\image"; 

		    String cg_code = mul.getParameter("cg_code");
		    String scg_code = mul.getParameter("scg_code");
		    String product = mul.getParameter("product");
		    int sale = Integer.parseInt(mul.getParameter("sale"));
		    int price = Integer.parseInt(mul.getParameter("price"));
		    
		    // itemnum 파라미터 가져오기
		    String itemnumStr = mul.getParameter("itemnum");
		    if (itemnumStr == null) {
		        throw new IllegalArgumentException("itemnum is required");
		    }
		    int itemnum = Integer.parseInt(itemnumStr); // null 체크 후 변환

		    // 이미지 파일 처리
		    MultipartFile mf1 = mul.getFile("image1");
		    String fname1 = null;
		    if (mf1 != null && !mf1.isEmpty()) {
		        fname1 = mf1.getOriginalFilename();
		        mf1.transferTo(new File(path + "//" + fname1));
		    }

		    MultipartFile mf2 = mul.getFile("dimage");
		    String fname2 = null;
		    if (mf2 != null && !mf2.isEmpty()) {
		        fname2 = mf2.getOriginalFilename();
		        mf2.transferTo(new File(path + "//" + fname2));
		    }

		    // 파일 이름이 null인 경우 기존 값을 유지하도록 처리
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    ps.productupdatesave(fname1, cg_code, scg_code, sale , product, price, fname2, itemnum);
		    ArrayList<ProductDTO> list = ps.outd();
		    mo.addAttribute("list", list);
		    return "productdeleteout";
		   }
		
		@RequestMapping(value = "bestitem" , method = RequestMethod.GET)  //조회수 높은 상품
		public String lte66(Model mo) {
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ArrayList<ProductDTO> list = ps.besta();
			mo.addAttribute("list", list);
			return "productout";
		}
		
		@RequestMapping(value = "newitem" , method = RequestMethod.GET)  //db에 최근등록순 상품
		public String lte67(Model mo) {
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ArrayList<ProductDTO> list = ps.newa();
			mo.addAttribute("list", list);
			return "productout";
		}

		@RequestMapping(value = "saleitem" , method = RequestMethod.GET)  //db에 최근등록순 상품
		public String lte68(Model mo) {
			ProductService ps = sqlSession.getMapper(ProductService.class);
			ArrayList<ProductDTO> list = ps.salea();
			mo.addAttribute("list", list);
			return "productout";
		}
		
		
		
		
}
