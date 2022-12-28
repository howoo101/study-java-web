package example.dao;

import java.sql.SQLException;
import java.util.List;

import example.domain.Board;
import example.ibatis.BaseSqlMapConfig;

public class BoardDao {
	
	
	@SuppressWarnings("unchecked")
	public List<Board> selectBoardList() throws SQLException  {
		return BaseSqlMapConfig.getInstance()
				.queryForList("selectBoardList");
	}
}
