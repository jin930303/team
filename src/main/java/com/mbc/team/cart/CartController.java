package com.mbc.team.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(value = "/insertcart")
	public String cart(HttpServletRequest request, HttpSession hs) {

		String itemnumStr = request.getParameter("itemnum");
		String priceStr = request.getParameter("price");
		String countStr = request.getParameter("count");
		String product = request.getParameter("product");
		String op1 = request.getParameter("op1");
		String image1 = request.getParameter("image1");
		String id = request.getParameter("id");

		int itemnum = Integer.parseInt(itemnumStr);
		int price = Integer.parseInt(priceStr);
		int count = Integer.parseInt(countStr);

		// CartItem 객체 생성 및 값 설정
		CartItem cartItem = new CartItem();
		cartItem.setItemnum(itemnum);
		cartItem.setId(id);
		cartItem.setProduct(product);
		cartItem.setPrice(price);
		cartItem.setCount(count);
		cartItem.setImage1(image1);
		cartItem.setOp1(op1);

		// CartService 호출하여 CartItem 객체 전달
		CartService cs = sqlSession.getMapper(CartService.class);
		cs.insert(cartItem); // CartItem 객체 전달

		return "redirect:/productdetail?itemnum=" + itemnum; // 장바구니 페이지로 이동

	}

	@RequestMapping(value = "/cart")
	public String cart1(HttpServletRequest request, HttpSession hs, Model mo, HttpServletResponse response)
			throws IOException {

		hs = request.getSession();
		Boolean loginState = (Boolean) hs.getAttribute("loginstate");

		if (loginState != null && loginState) {

			LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
			String id = dto3.getId();

			CartService cs = sqlSession.getMapper(CartService.class);
			List<CartItem> items = cs.selectitem(id);
			mo.addAttribute("items", items);

			return "cart";
		} else {
			// 로그인 상태가 아닌 경우
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww = response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주세요.');</script>");
			pww.print("<script> location.href='/team/login';</script>");
			pww.flush();
			return null;
		}

	}

	@ResponseBody
	@RequestMapping(value = "/deleteitems", method = RequestMethod.POST)
	public String deleteSelectedItems(@RequestBody Map<String, List<String>> param, HttpSession hs) {
		List<String> items = param.get("items"); // JSON에서 "items"를 추출
		
		LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");

		if (dto3 == null) {
			return "로그인 후 이용해주세요.";
		}
		System.out.println("아이템 : " + items);
		System.out.println("아이디 : " + dto3.getId());
		CartService cs = sqlSession.getMapper(CartService.class);
		cs.deleteSelectItems(dto3.getId(), items); // id와 items를 매퍼로 전달

		return "success";
	}
	
	@RequestMapping(value = "/buydirectitem", method = RequestMethod.POST)
	public String buydirectitem(@RequestParam("itemnum") Long itemnum, 
	                            @RequestParam("count") int count,
	                            @RequestParam("op1") String op1,
	                            @RequestParam("product") String product,
	                            @RequestParam("image1") String image1, 
	                            @RequestParam("price") int price, 
	                            HttpSession hs, Model model) {
		 
		System.out.println("ItemNum: " + itemnum);
		    System.out.println("Price: " + price);
		    System.out.println("Product: " + product);
		    System.out.println("Option: " + op1);
		    System.out.println("Count: " + count);

	    LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");


	    String id = dto3.getId();  // 사용자 ID 가져오기
	    System.out.println("사용자 ID: " + id);

	   
//	    CartService cs = sqlSession.getMapper(CartService.class);
//	    
//	   
//	    cs.buydirectitem(itemnum, id, product, price, count, op1, image1);
	    

	    // 구매 정보 모델에 추가
	    model.addAttribute("itemnum", itemnum);
	    model.addAttribute("product", product);
	    model.addAttribute("count", count);
	    model.addAttribute("op1", op1);
	    model.addAttribute("price", price);
	    
	    // 구매 확인 페이지로 이동
	    return "buyproduct";
	}


	@RequestMapping("/buy")
	
    public String buySelectedItems(@RequestParam("selectedItems") List<String> selectedItems, HttpSession hs,Model mo) {
		
		LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
		String id= dto3.getId();
	    System.out.println("아이디 : " +id);
		CartService cs = sqlSession.getMapper(CartService.class);
	    List<CartItem> cart = cs.getCartItemsByUserId(id);

	    // 장바구니 또는 선택된 아이템이 없을 경우 처리
	    if (cart == null || selectedItems == null || selectedItems.isEmpty()) {
	        mo.addAttribute("errorMessage", "선택한 상품이 없습니다.");
	        return "errorPage";
	    }
	    
	    
	    List<CartItem> purchasedItems = new ArrayList<>();
	    int totalPrice = 0;

	    // 선택된 상품만 구매 처리
	    for (CartItem item : cart) {
	        if (selectedItems.contains(String.valueOf(item.getItemnum()))) {
	            purchasedItems.add(item);
	            totalPrice += item.getPrice() * item.getCount();
	            System.out.println("ID: " + id + ", ItemNum: " + item.getItemnum());
	            cs.deleteCartItemByUserIdAndItemNum(id, item.getItemnum());
	        }
	    }
	    
	    // 구매된 상품과 총 금액을 모델에 담아 뷰로 전달
	    mo.addAttribute("purchasedItems", purchasedItems);
	    mo.addAttribute("totalPrice", totalPrice);

	    return "purchaseConfirmation";  // Tiles에 설정된 뷰 이름
	}
	
}
