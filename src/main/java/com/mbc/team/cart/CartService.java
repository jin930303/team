package com.mbc.team.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface CartService {

	public void insert(CartItem cartItem);

	public List<CartItem> selectitem(String id);

	void deleteSelectItems(@Param("id") String id, @Param("items") List<String> items);

	public void buydirectitem(Long itemnum, String id, String product, int price, int count, String op1, String image1);

	public List<CartItem> getCartItemsByUserId(String id);

	public void deleteCartItemByUserIdAndItemNum(String id, int itemnum);



	public void removeItemFromCart(Long itemnum, String id);

	
	
	

}
