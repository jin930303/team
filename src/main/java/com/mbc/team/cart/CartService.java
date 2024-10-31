package com.mbc.team.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface CartService {
	
	public int checkItem(CartItem cartItem);
	
	public void insert(CartItem cartItem);
	
	public void update(CartItem cartItem);

	public List<CartItem> selectitem(String id);

	void deleteSelectItems(@Param("id") String id, @Param("items") List<String> items);

	public List<CartItem> getCartItems(String id);

	public void deleteCartItem(String id, int itemnum);

	

	




	
	
	

}
