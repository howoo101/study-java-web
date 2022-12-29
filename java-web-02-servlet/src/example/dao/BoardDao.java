package example.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import example.domain.Board;
import example.ibatis.BaseSqlMapConfig;

public class BoardDao {
	
	
	@SuppressWarnings("unchecked")
	public List<Board> selectBoardList(Map<String,Object> paramMap) throws SQLException  {
		return BaseSqlMapConfig.getInstance()
				.queryForList("selectBoardList",paramMap);
	}

	public Board selectBoard(String boardSeq) throws SQLException {
		return (Board)BaseSqlMapConfig.getInstance()
				.queryForObject("selectBoard",boardSeq);
		
	}
}
