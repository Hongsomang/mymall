package kr.ac.kopo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.Dao.BookmarkDao;
import kr.ac.kopo.Dao.LikesDao;
import kr.ac.kopo.Dao.ProductDao;
import kr.ac.kopo.Dao.ShoppingmallDao;
import kr.ac.kopo.Model.Bookmark;
import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Model.User;

@Service
public class ShoppingmallServiceImpl implements ShoppingmallService {

	@Autowired
	ShoppingmallDao dao;

	@Autowired
	ProductDao productDao;
	
	@Autowired
	BookmarkDao bookmarkDao;
	
	@Autowired
	LikesDao likeDao;
	
	@Override
	public List<Shoppingmall> list(Pager pager) {
		// TODO Auto-generated method stub
		return dao.list(pager);
	}

	@Override
	public void add(Shoppingmall item) {
		// TODO Auto-generated method stub
		dao.add(item);
	}

	@Transactional
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Bookmark item=new Bookmark();
		item.setShoppingmallId(id);
		
		bookmarkDao.delete(item);
		likeDao.delete_shoppingmall(id);
		productDao.delete(id);
		dao.delete(id);
	}

	@Override
	public Shoppingmall item(int id) {
		// TODO Auto-generated method stub
		return dao.item(id);
	}

	@Override
	public void update(Shoppingmall item) {
		// TODO Auto-generated method stub
		dao.update(item);
	}

	@Override
	public List<Shoppingmall> admin_list(Pager pager) {
		
		return dao.admin_list(pager);
	}

	@Override
	public Shoppingmall total(Pager pager) {
		// TODO Auto-generated method stub
		return dao.total(pager);
	}






}
