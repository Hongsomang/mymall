package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Shoppingmall;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Shoppingmall item) {
		// TODO Auto-generated method stub
		sql.insert("bookmark.add", item);
	}

}
