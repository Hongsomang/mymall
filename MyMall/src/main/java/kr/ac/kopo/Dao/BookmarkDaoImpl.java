package kr.ac.kopo.Dao;



import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Bookmark;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	@Autowired
	SqlSession sql;



	@Override
	public void add(Bookmark item) {
		// TODO Auto-generated method stub
		sql.insert("bookmark.add", item);
	}



	@Override
	public void delete(Bookmark item) {
		// TODO Auto-generated method stub
		sql.delete("bookmark.delete", item);
	}



}
