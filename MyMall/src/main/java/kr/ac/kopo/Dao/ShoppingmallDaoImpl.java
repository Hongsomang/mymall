package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Shoppingmall;

@Repository
public class ShoppingmallDaoImpl implements ShoppingmallDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Shoppingmall> list() {
		// TODO Auto-generated method stub
		return sql.selectList("shoppingmall.list");
	}

	@Override
	public void add(Shoppingmall item) {
		// TODO Auto-generated method stub
		sql.insert("shoppingmall.add", item);
	}

}
