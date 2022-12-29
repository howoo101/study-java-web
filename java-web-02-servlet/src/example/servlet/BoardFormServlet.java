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

public class BoardFormServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String boardSeq = req.getParameter("boardSeq");
			if(boardSeq != null || !"".equals(boardSeq)) {
				Board board = boardService.selectBoard(boardSeq);
				req.setAttribute("board", board);
			}

			req.getRequestDispatcher("/WEB-INF/jsp/board/form.jsp")
			.forward(req, resp);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
