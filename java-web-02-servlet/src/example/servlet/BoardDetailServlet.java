package example.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.domain.Board;
import example.service.BoardService;

public class BoardDetailServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			//검색조건 
			String boardSeq = req.getParameter("boardSeq");
			Board board = boardService.selectBoard(boardSeq);
			req.setAttribute("board", board);
			req.getRequestDispatcher("/WEB-INF/jsp/board/detail.jsp")
			.forward(req, resp);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
