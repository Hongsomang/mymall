package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Parsing;
import kr.ac.kopo.Model.Product;

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

	@Override
	public void add(List<Parsing> list) {
		// TODO Auto-generated method stub
		System.out.println("dfdfdfdf");
		
		for(int i=0;i<list.size();i++) {
			
			System.out.println(list.get(i).getName());
			sql.insert("product.add", list.get(i));
			
		}
	}

	@Override
	public List<Product> list(int shoppingmallId) {
		// TODO Auto-generated method stub
		return sql.selectList("product.list", shoppingmallId);
	}

}
