package kr.ac.kopo.Service;



public interface LikeService {

	boolean add(int shoppingmallId, String userId);

	boolean delete(int productId, String userId);

}
