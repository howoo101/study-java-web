package example.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import example.domain.Board;
import example.domain.User;
import example.ibatis.BaseSqlMapConfig;

public class UserDao {
	
	public User selectUser(User user) throws SQLException {
		return (User)BaseSqlMapConfig.getInstance()
				.queryForObject("selectUser",user);
		
	}

}
