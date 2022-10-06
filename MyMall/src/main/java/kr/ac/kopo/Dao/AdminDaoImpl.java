package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Admin;
import kr.ac.kopo.Model.Shoppingmall;


@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return sql.selectOne("admin.login", admin);
	}

	

}
