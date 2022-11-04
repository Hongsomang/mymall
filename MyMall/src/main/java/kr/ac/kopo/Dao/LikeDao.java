package kr.ac.kopo.Dao;

public interface LikeDao {

	int add(int shoppingmallId, String userId);

	int delete(int productId, String userId);

	void delete_shoppingmall(int shoppingmallId);

}
