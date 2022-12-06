package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Likes;

@Repository
public class LikesDaoImpl implements LikesDao {

	@Autowired
	SqlSession sql;

	@Override
	public int add(Likes item) {
		// TODO Auto-generated method stub
		return sql.insert("likes.add", item);
	}

	@Override
	public int delete(Likes item) {
		// TODO Auto-generated method stub
		return sql.delete("likes.delete", item);
	}

	@Override
	public void delete_shoppingmall(int shoppingmallId) {
		Likes item = new Likes();
		item.setShoppingmallId(shoppingmallId);
		sql.delete("likes.delete", item);
	}

	

	@Override
	public void delete_product(int shoppingmallId) {
		// TODO Auto-generated method stub
		sql.delete("likes.product_delete", shoppingmallId);
	}

}
