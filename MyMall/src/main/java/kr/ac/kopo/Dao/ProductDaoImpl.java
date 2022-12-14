package kr.ac.kopo.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Crawling;
import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Pager.Pager;

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
		System.out.println("product"+shoppingmallId);
		sql.delete("product.delete", shoppingmallId);

	}

	@Override
	public void add(List<Crawling> list) {
		// TODO Auto-generated method stub
		System.out.println("dfdfdfdf");

		for (Crawling element : list) {

			System.out.println(element.getName());
			sql.insert("product.add", element);

		}
	}

	/*@Override
	public List<Product> list(int shoppingmallId,Pager pager) {
		// TODO Auto-generated method stub
		HashMap<String, Object>map=new HashMap<>();
		map.put("shoppingmallId", shoppingmallId);
		map.put("offset", pager.getOffset());
		map.put("perPager", pager.getPerPager());
		return sql.selectList("product.list", map);
	}*/

	@Override
	public int total(Pager pager) {
		// TODO Auto-generated method stub
		

		return sql.selectOne("product.total",pager);
	}

	

	@Override
	public List<Product> list( Pager pager) {
		
		return sql.selectList("product.list", pager);
	}



	@Override
	public List<Product> likeProduct(Pager pager) {
	
		return sql.selectList("product.likeProduct", pager);
	}

	@Override
	public int likeTotal(Pager pager) {
		
		return sql.selectOne("product.likeTotal", pager);
	}

	
	@Override
	public void directAdd(Product item) {
		// TODO Auto-generated method stub
		sql.insert("product.add",item);
	}

	@Override
	public Product item(Product item) {
		// TODO Auto-generated method stub
		return sql.selectOne("product.item",item);
	}

	@Override
	public void update(Product item) {
		// TODO Auto-generated method stub
		sql.update("product.update", item);
	}

	@Override
	public void itemDelete(int id) {
		// TODO Auto-generated method stub
		sql.delete("product.itemDelete",id);
	}

}
