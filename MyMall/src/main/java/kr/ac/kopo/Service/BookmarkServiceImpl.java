package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.BookmarkDao;
import kr.ac.kopo.Model.Bookmark;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	BookmarkDao dao;



	@Override
	public void add(Bookmark item) {
		// TODO Auto-generated method stub
		dao.add(item);
	}


	@Override
	public void delete(Bookmark item) {
		// TODO Auto-generated method stub
		dao.delete(item);
	}




}
