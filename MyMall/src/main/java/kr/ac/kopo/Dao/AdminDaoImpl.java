package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.Admin;


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
