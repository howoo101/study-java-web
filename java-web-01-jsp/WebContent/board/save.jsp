<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글 깨짐 방지 인코딩 설정 
	request.setCharacterEncoding("utf-8");
	String boardSeq = request.getParameter("boardSeq");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	boolean save = false;
	boolean update = false;
	//검증 (필수값) 
	boolean validate = true;
	String message = "제목을 입력해주세영ㅇㅇㅇㅇㅇㅇㅇㅇ";
	if (title == null || title.isEmpty()) {
		message = "제목을 입력해주세영ㅇㅇㅇㅇㅇㅇㅇㅇ";
		validate = false;
	}
	if (validate && contents == null || contents.isEmpty()) {
		message = "내용을 입력해주세영ㅇㅇㅇㅇㅇㅇㅇㅇ";
		validate = false;
	}
	//필수로직 다성공하면 
	if (validate) {
		Connection connection = null;
		PreparedStatement stmt = null;
		try {
			  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcUrl = "jdbc:mysql://localhost:3307/profile";
			String user = "root";
			String password = "1234";
			
			connection = DriverManager.getConnection(jdbcUrl,user,password);
			if(boardSeq != null || !boardSeq.isEmpty()) {
				String sql = "SELECT BOARD_SEQ, TITLE,CONTENTS,REG_DATE FROM T_BOARD " +
						"WHERE BOARD_SEQ = " + boardSeq;
				Statement stmt2 = connection.createStatement();
				ResultSet rs = stmt2.executeQuery(sql);
				
				while (rs.next()) {
					update = true;
				}
			}
			
			String sql = null;
					
			if(update) {
				sql = "UPDATE T_BOARD SET TITLE = ?, CONTENTS = ? WHERE BOARD_SEQ = ?";
				message = "게시물 업데이트를 완료 하였습니다.";
			}else {
				sql = "insert T_BOARD  (TITLE, CONTENTS, REG_DATE) " +
						"VALUES (?, ?,NOW())";
				message = "게시글이 등록을  완료 하였습니다.";
			}
			
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, contents);
			if(update) {
				stmt.setString(3,boardSeq);
			}

			int result = stmt.executeUpdate();
			if (result == 0) {
				message = "게시물 등록 중 오류가 발생하였습니다.";
			}else {
				save = true;		
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			message = "게시물 등록중 datase 오류 발생 ";
		}
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var save = <%= save %>;
	var massage = '<%= message %>';
	if(save) {
		alert("");
	location.href="/board/list.jsp";
	}else {
		alert("!!!!!");
		history.back(-1);
	}
</script>
<h1>등록화면 </h1>
<p>제목 : <%= title %> </p> 
<p>내용 : <%= contents %> </p>
</body>
</html>