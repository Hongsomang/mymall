package kr.ac.kopo.Dao;



import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	@Autowired
	SqlSession sql;



	@Override
	public void add(int shoppingmallId, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<>();
		map.put("userId", userId);
		map.put("shoppingmallId", shoppingmallId);
		System.out.println("dao"+ userId+" "+shoppingmallId);
		sql.insert("bookmark.add", map);
	}



}
