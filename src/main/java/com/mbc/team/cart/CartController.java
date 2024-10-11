package com.mbc.team.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	
	@RequestMapping(value = "/cart")
	public String cart(HttpServletRequest request, HttpSession hs) {
		try {
	        int itemnum = Integer.parseInt(request.getParameter("itemnum"));
	        String priceStr = request.getParameter("price");
	        String countStr = request.getParameter("count");
	        String product = request.getParameter("product");
	        String op1 = request.getParameter("op1");

	        // 빈 문자열 체크 및 기본값 설정
	        if (priceStr == null || priceStr.isEmpty()) {
	            throw new NumberFormatException("price는 비어있을 수 없습니다.");
	        }
	        if (countStr == null || countStr.isEmpty()) {
	            throw new NumberFormatException("count는 비어있을 수 없습니다.");
	        }

	        int price = Integer.parseInt(priceStr);
	        int count = Integer.parseInt(countStr);

	        // CartItem 객체 생성 (구조에 맞게 변경 필요)
	        CartItem item = new CartItem(itemnum, product, price, count);

	        // 세션에서 카트 가져오기
	        List<CartItem> cart = (List<CartItem>) hs.getAttribute("cart");
	        if (cart == null) {
	            cart = new ArrayList<>();
	        }

	        // 카트에 추가
	        cart.add(item);
	        hs.setAttribute("cart", cart); // 세션에 카트 저장

	        return "cart"; // cart 페이지로 이동
	    } catch (NumberFormatException e) {
	        // 예외 처리 로직 추가 (예: 에러 페이지로 리다이렉트)
	        System.err.println("잘못된 입력 값: " + e.getMessage());
	        return "error"; // 에러 페이지로 리다이렉트
	    }
	
}
}
