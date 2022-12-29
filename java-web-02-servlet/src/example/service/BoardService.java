package example.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import example.dao.BoardDao;
import example.domain.Board;

public class BoardService {
	private BoardDao boardDao = new BoardDao();
	
	public List<Board> selectBoardList(Map<String,Object> paramMap) throws SQLException  {
		return boardDao.selectBoardList(paramMap);
				
	}

	public Board selectBoard(String boardSeq) throws SQLException {
		return boardDao.selectBoard(boardSeq);
	}
}
