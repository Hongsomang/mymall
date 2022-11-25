package kr.ac.kopo.Dao;

import kr.ac.kopo.Model.Likes;

public interface LikesDao {

	
	

	void delete_shoppingmall(int shoppingmallId);

	
	void delete_product(int shoppingmallId);

	int add(Likes item);

	int delete(Likes item);

	

	

}
