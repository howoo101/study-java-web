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

public class BoardFormServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String boardSeq = req.getParameter("boardSeq");
			if (boardSeq != null || !"".equals(boardSeq)) {
				Board board = boardService.selectBoard(boardSeq);
				req.setAttribute("board", board);
			}

			req.getRequestDispatcher("/WEB-INF/jsp/board/form.jsp").forward(req, resp);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		try {
			String boardSeq = req.getParameter("boardSeq");
			String title = req.getParameter("title");
			String contents = req.getParameter("contents");
			boolean validate = true;
			if (title == null || title.isEmpty()) {
				validate = false;
			}

			if (contents == null || contents.isEmpty()) {
				validate = false;
			}

			if (validate) {
				Board board = new Board();
				board.setTitle(title);
				board.setContents(contents);
			}

			Board board = boardService.selectBoard(boardSeq);
			if (board != null) {
				board.setTitle(title);
				board.setContents(contents);
				boardService.updateBoard(board);
				req.setAttribute("message", "수정 완료!");
			} else {
				board = new Board();
				board.setTitle(title);
				board.setContents(contents);
				boardService.insertBoard(board);
				req.setAttribute("message", "등록 완료!");
			}

			req.setAttribute("board", board);
			req.setAttribute("save", "success");
			resp.setContentType("text/html;charset=utf-8");
			req.getRequestDispatcher("/WEB-INF/jsp/board/save.jsp").forward(req, resp);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
