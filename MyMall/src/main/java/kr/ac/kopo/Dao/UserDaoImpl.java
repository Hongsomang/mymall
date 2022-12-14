package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.Model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;

	@Override
	public void signup(User user) {
		// TODO Auto-generated method stub
		sql.insert("user.signup", user);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return sql.selectOne("user.login", user);
	}

	@Override
	public int checkId(String id) {
		// TODO Auto-generated method stub
		return sql.selectOne("user.ckeckId", id);
	}

}
