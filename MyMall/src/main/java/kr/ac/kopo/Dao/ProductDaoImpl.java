package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int count(int shoppingmallId) {
		// TODO Auto-generated method stub
		return sql.selectOne("product.count", shoppingmallId);
	}

	@Override
	public void delete(int shoppingmallId) {
		sql.delete("product.delete", shoppingmallId);

	}

}
