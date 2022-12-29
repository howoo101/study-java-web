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

public class BoarDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");    
	    try {
			String boardSeq = req.getParameter("boardSeq");
			Board board = boardService.selectBoard(boardSeq);
			if(board != null) {
				boardService.deleteBoard(boardSeq);				
			}else {
				System.out.println("실패 ");
				req.getRequestDispatcher("/WEB-INF/jsp/board/list.jsp")
				.forward(req, resp);
			}
			
			req.setAttribute("save", "success");
			resp.setContentType("text/html;charset=utf-8");
			req.getRequestDispatcher("/WEB-INF/jsp/board/delete.jsp")
			.forward(req, resp);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
