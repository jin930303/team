package com.mbc.team.cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface CartService {
	
	public int checkItem(CartItem cartItem);
	
	public void insert(CartItem cartItem);
	
	public void update(CartItem cartItem);

	public List<CartItem> selectitem(String id);

	

	public List<CartItem> getCartItems(String id);

	public void deleteCartItem(String id, int itemnum);

	public void deleteSelectItems(@Param("id") String id,@Param("items") List<Map<String, String>> items);

	

	




	
	
	

}
