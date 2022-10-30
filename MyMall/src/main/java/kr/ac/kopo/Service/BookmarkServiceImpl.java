package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.BookmarkDao;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	
	@Autowired
	BookmarkDao dao;



	



	@Override
	public void add(int shoppingmallId, String userId) {
		// TODO Auto-generated method stub
		dao.add(shoppingmallId,userId);
	}
	
	
	

}
