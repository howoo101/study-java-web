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
import example.domain.User;
import example.service.BoardService;
import example.service.UserService;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardService();
	private UserService userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			boolean validate = true;
			if (id == null || id.isEmpty()) {
				validate = false;
			}

			if (password == null || password.isEmpty()) {
				validate = false;
			}

			if (validate) {
				User user = new User();
				user.setUserId(id);
				user.setPassword(password);
				try {
					User selectUser = userService.selectUser(user);
					if(selectUser != null) {
						req.getSession().setAttribute("login_user", selectUser);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		
			req.setAttribute("save", "success");
			resp.setContentType("text/html;charset=utf-8");
			req.getRequestDispatcher("/WEB-INF/jsp/board/list.jsp").forward(req, resp);

		
	}
}
