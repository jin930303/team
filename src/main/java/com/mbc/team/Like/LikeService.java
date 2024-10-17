package com.mbc.team.Like;

import java.util.ArrayList;

public interface LikeService {
//1. 찜하기
	void like_insert(int itemnum, String id);

//2. 출력
	ArrayList<LikeDTO> like_product(String id);

//3. 찜 상품 삭제
	void like_items_delete(int likenum);

}
