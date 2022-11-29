package kr.ac.kopo.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Model.User;

@Repository
public class ShoppingmallDaoImpl implements ShoppingmallDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Shoppingmall> list(Pager pager) {
		
		
		return sql.selectList("shoppingmall.list",pager);
	}
	/*@Override
	public List<Shoppingmall> list(Pager pager) {
		// TODO Auto-generated method stub
		return sql.selectList("shoppingmall.list",pager);
	}*/

	@Override
	public void add(Shoppingmall item) {
		// TODO Auto-generated method stub
		sql.insert("shoppingmall.add", item);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		sql.delete("shoppingmall.delete", id);
	}

	@Override
	public Shoppingmall item(int id) {
		// TODO Auto-generated method stub
		return sql.selectOne("shoppingmall.item", id);
	}

	@Override
	public void update(Shoppingmall item) {
		// TODO Auto-generated method stub
		System.out.println("dao :"+item.getName());
		System.out.println("dao: "+item.getImageFile());
		sql.update("shoppingmall.update", item);
	}

	@Override
	public List<Shoppingmall> admin_list(Pager pager) {
		// TODO Auto-generated method stub
		return sql.selectList("shoppingmall.admin_list", pager);
	}

	@Override
	public Shoppingmall total(Pager pager) {
		// TODO Auto-generated method stub
		return sql.selectOne("shoppingmall.total", pager);
	}




}
