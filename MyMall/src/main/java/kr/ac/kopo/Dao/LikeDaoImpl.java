package kr.ac.kopo.Dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		
		
		return sql.insert("likes.delete",map);
	}

}
