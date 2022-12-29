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

	public void insertBoard(Board board) throws SQLException {
		BaseSqlMapConfig.getInstance()
				.insert("insertBoard",board);
		
	}

	public void updateBoard(Board board) throws SQLException {
		BaseSqlMapConfig.getInstance()
			.update("updateBoard",board);
	}

	public void deleteBoard(String boardSeq) throws SQLException {
		BaseSqlMapConfig.getInstance()
			.delete("deleteBoard",boardSeq);
	}
}
