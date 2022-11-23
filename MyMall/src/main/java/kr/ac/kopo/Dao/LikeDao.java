package kr.ac.kopo.Dao;

import kr.ac.kopo.Model.Likes;

public interface LikeDao {

	int add(int shoppingmallId, String userId);

	int delete(int productId, String userId);

	void delete_shoppingmall(int shoppingmallId);

	
	void delete_product(Likes item);

	

	

}
