<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글 깨짐 방지 인코딩 설정 
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	boolean save = false;
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
			String sql = "insert T_BOARD  (TITLE, CONTENTS, REG_DATE) " +
				"VALUES (?, ?,NOW())";
			
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, contents);
			

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
		alert("완려 ");
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