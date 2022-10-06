package kr.ac.kopo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.ShoppingmallDao;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class ShoppingmallServiceImpl implements ShoppingmallService {

	@Autowired
	ShoppingmallDao dao;
	
	@Override
	public List<Shoppingmall> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void add(Shoppingmall item) {
		// TODO Auto-generated method stub
		dao.add(item);
	}

}
