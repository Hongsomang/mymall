package kr.ac.kopo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.AdminDao;
import kr.ac.kopo.Model.Admin;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	AdminDao dao;
	
	@Override
	public boolean login(Admin admin) {
		
		Admin item =dao.login(admin);
		if(item != null) {
			return true;
		}
		else {
			return false;
		}
		
	}

	

}
