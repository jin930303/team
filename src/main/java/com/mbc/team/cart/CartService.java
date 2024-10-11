package com.mbc.team.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


@Service
public class CartService {
	
	public void addToCart(HttpSession hs,CartItem item) {
		List<CartItem> cart= (List<CartItem>) hs.getAttribute("cart"); 
		if(cart ==null) {
			cart= new ArrayList<>();
		}
		cart.add(item);
		hs.setAttribute("cart", cart);
	}
	
	public List<CartItem> getCart(HttpSession hs){
		List<CartItem> cart=(List<CartItem>) hs.getAttribute("cart");
		return cart != null ? cart : new ArrayList<>();
	}
}
