package kr.ac.kopo.Dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Likes;
import kr.ac.kopo.Model.Product;

@Repository
public class LikeDaoImpl  implements LikeDao{
	
	
	
	@Autowired 
	SqlSession sql;
	
	@Override
	public int add(int productId, String userId) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("productId", productId);
		map.put("userId", userId);
		
		
		return sql.insert("likes.add",map);
	}

	@Override
	public int delete(int productId, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<>();
		map.put("productId", productId);
		map.put("userId", userId);
		map.put("shoppingmallId", null);
		
		return sql.delete("likes.delete",map);
	}

	@Override
	public void delete_shoppingmall(int shoppingmallId) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("productId", null);
		map.put("userId", null);
		map.put("shoppingmallId", shoppingmallId);
		System.out.println("dfdf"+shoppingmallId);
		sql.delete("likes.delete",map);
	}

	@Override
	public void delete_product(Likes item) {
		// TODO Auto-generated method stub
		
		sql.delete("likes.delete",item);
	}

	

}
