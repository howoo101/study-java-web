package example.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import example.dao.BoardDao;
import example.dao.UserDao;
import example.domain.Board;
import example.domain.User;

public class UserService {
	private UserDao userDao = new UserDao();

	public User selectUser(User user) throws SQLException {
		
		return userDao.selectUser(user);
	}
	
}