package com.mbc.team;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.team.product.ProductDTO;
import com.mbc.team.product.ProductService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest requset, Model mo) {
		HttpSession hs= requset.getSession();
		hs.setAttribute("loginstate", false);
		hs.setAttribute("adminloginstate", false);
		ProductService ps=sqlsession.getMapper(ProductService.class);
	    ArrayList<ProductDTO>list=ps.outmainbest();
	    ArrayList<ProductDTO>list1=ps.outmainnew();
	    mo.addAttribute("list", list);
	    mo.addAttribute("list1", list1);
		return "main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model mo) {
		ProductService ps=sqlsession.getMapper(ProductService.class);
	    ArrayList<ProductDTO>list=ps.outmainbest();
	    ArrayList<ProductDTO>list1=ps.outmainnew();
	    mo.addAttribute("list", list);
	    mo.addAttribute("list1", list1);
	    return "main";
	}
}
