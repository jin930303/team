package com.mbc.team.cart;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.team.login.LoginDTO;

@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;
	CartService cs;
	
	@RequestMapping(value = "/insertcart")
	public String cart(HttpSession hs,@ModelAttribute CartItem cartItem) {
		cs = sqlSession.getMapper(CartService.class);
		int existCount=cs.checkItem(cartItem);
		 
		if (existCount == 0) {
			 cs.insert(cartItem);
		    }
		else {
			cs.update(cartItem);
		}
		
		
		System.out.println(cartItem.getOp1());
		return "redirect:/productdetail?itemnum=" + cartItem.getItemnum();
	}

	@RequestMapping(value = "/cart")
	public String cart1(HttpServletRequest request, HttpSession hs, Model mo, HttpServletResponse response)
			throws IOException {

		hs = request.getSession();
		Boolean loginState = Boolean.TRUE.equals(hs.getAttribute("loginstate")); 

		if (loginState) {

			LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
			String id = dto3.getId();

			cs = sqlSession.getMapper(CartService.class);
			List<CartItem> items = cs.selectitem(id);
			mo.addAttribute("items", items);

			return "cart";
			
		} else {
	        // �α��� ���°� false�� ��� ��� �޽��� ���
	        sendAlertAndRedirect(response, "�α��� �� �̿����ּ���.", "/team/login");
	        return null;
	    }
	}
	 private void sendAlertAndRedirect(HttpServletResponse response, String message, String redirectUrl) throws IOException {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pww = response.getWriter();
	        pww.print("<script> alert('" + message + "');</script>");
	        pww.print("<script> location.href='" + redirectUrl + "';</script>");
	        pww.flush();
	    }

	@ResponseBody
	@RequestMapping(value = "/deleteitems", method = RequestMethod.POST)
	public String deleteSelectedItems(@RequestBody Map<String, List<Map<String, String>>> param, HttpSession hs) {
		 List<Map<String, String>> items = param.get("items");

		LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");

		if (dto3 == null) {
			return "�α��� �� �̿����ּ���.";
		}
		
		for (Map<String, String> item : items) {
	        System.out.println("������ ��ȣ: " + item.get("itemnum"));
	        System.out.println("īƮ ��ȣ: " + item.get("cartnum"));
	    }
		
		cs = sqlSession.getMapper(CartService.class);
		cs.deleteSelectItems(dto3.getId(), items);

		return "success";
	}

	@RequestMapping(value = "/buydirectitem", method = RequestMethod.POST)
	public String buydirectitem(HttpSession hs, Model mo,@ModelAttribute CartItem cartItem,HttpServletResponse response) throws IOException {
		
		Boolean loginState = Boolean.TRUE.equals(hs.getAttribute("loginstate"));
		if (loginState) {
			
			System.out.println("ItemNum: " +cartItem.getItemnum());
			System.out.println("Price: " + cartItem.getPrice());
			System.out.println("Product: " +cartItem.getProduct());
			System.out.println("Option: " +cartItem.getOp1());
			System.out.println("Count: " +cartItem.getCount());

			mo.addAttribute("itemnum",cartItem.getItemnum());
			mo.addAttribute("product",cartItem.getProduct());
			mo.addAttribute("count", cartItem.getCount());
			mo.addAttribute("op1", cartItem.getOp1());
			mo.addAttribute("price", cartItem.getPrice());
			return "buyproduct";
		}
		else {
	        // �α��� ���°� false�� ��� ��� �޽��� ���
	        sendAlertAndRedirect2(response, "�α��� �� �̿����ּ���.", "/team/login");
	        return null;
	    }
	}
	 private void sendAlertAndRedirect2(HttpServletResponse response, String message, String redirectUrl) throws IOException {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pww = response.getWriter();
	        pww.print("<script> alert('" + message + "');</script>");
	        pww.print("<script> location.href='" + redirectUrl + "';</script>");
	        pww.flush();
	    }

	@RequestMapping("/buy")
	public String buySelectedItems(@RequestParam("selectedItems") List<String> selectedItems, HttpSession hs,
			Model mo, HttpServletRequest request) {

		LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
		String id = dto3.getId();
		System.out.println("���̵� : " + id);
		cs = sqlSession.getMapper(CartService.class);
		List<CartItem> cart = cs.getCartItems(id);

		if (cart == null || selectedItems == null || selectedItems.isEmpty()) {
			mo.addAttribute("errorMessage", "������ ��ǰ�� �����ϴ�.");
			return "errorPage";
		}

		List<CartItem> purchasedItems = new ArrayList<>();
		int totalPrice = 0;

		for (CartItem item : cart) {
			if (selectedItems.contains(String.valueOf(item.getItemnum()))) {
				purchasedItems.add(item);
				totalPrice += item.getPrice() * item.getCount();
				System.out.println("ID: " + id + ", ItemNum: " + item.getItemnum());
				cs.deleteCartItem(id, item.getItemnum());
			}
		}

		mo.addAttribute("purchasedItems", purchasedItems);
		mo.addAttribute("totalPrice", totalPrice);

		return "purchaseConfirmation"; 
	}

}
