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
	public int add(Likes item) {
		// TODO Auto-generated method stub
		return sql.insert("likes.add",item);
	}

	@Override
	public int delete(Likes item) {
		// TODO Auto-generated method stub
		return sql.delete("likes.delete",item);
	}

	@Override
	public void delete_shoppingmall(int shoppingmallId) {
		Likes item=new Likes();
		item.setShoppingmallId(shoppingmallId);
		System.out.println("dfdf"+item.getShoppingmallId());
		sql.delete("likes.delete",item);
	}

	@Override
	public void delete_product(Likes item) {
		// TODO Auto-generated method stub
		
		sql.delete("likes.delete",item);
	}




	

}
