<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
  <%
	//현재 페이지에 들어올 때 파라미터의 값을boardSeq 변수에담음  
	request.setCharacterEncoding("utf-8");
  String boardSeq = request.getParameter("boardSeq");
	if(boardSeq == null || boardSeq.isEmpty()) {
		out.println("<script>");
		out.println("alert('게시물 번호 없음 ')");
		out.println("history.back(-1)");
		out.println("</script>");
		return;
	}
	
	//필수로직 다성공하면 
	
		Connection connection = null;
		ResultSet rs = null;
		
		try {
			  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcUrl = "jdbc:mysql://localhost:3307/profile";
			String user = "root";
			String password = "1234";
			
			connection = DriverManager.getConnection(jdbcUrl,user,password);
			String sql = "select board_seq,title,contents,reg_date from T_BOARD WHERE BOARD_SEQ = " + boardSeq;			
			
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
%>
		<div class="card text-center">
		  <div class="card-header">
		  <%=rs.getString("BOARD_SEQ") %>
		  </div>
		  <div class="card-body">
		    <h5 class="card-title"><%=rs.getString("TITLE") %></h5>
		    <p class="card-text"><%=rs.getString("CONTENTS") %></p>
		    <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
		  </div>
		  <div class="card-footer text-muted">
		    <%=rs.getString("REG_DATE") %>
  		  </div>
		</div>
<%	
						
			}
%>
<%			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

%>	
  
	<a class="btn btn-primary" href="/board/list.jsp">목록 </a>
	<a class="btn btn-secondary" href="/board/form.jsp">수정  </a>
	<a class="btn btn-danger" href="/board/delete.jsp">삭제  </a>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>