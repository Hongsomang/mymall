package kr.ac.kopo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.ShoppingmallDao;
import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class ShoppingmallServiceImpl implements ShoppingmallService {

	@Autowired
	ShoppingmallDao dao;
	
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

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
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

}
