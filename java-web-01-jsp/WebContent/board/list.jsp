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
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호 </th>
      <th scope="col"> 제목 </th>
      <th scope="col"> 내용 </th>
      <th scope="col"> 등록일자 </th>
    </tr>
  </thead>
  <tbody>
  <%
	//한글 깨짐 방지 인코딩 설정 
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	//필수로직 다성공하면 
	
		Connection connection = null;
		ResultSet rs = null;
		
		try {
			  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcUrl = "jdbc:mysql://localhost:3307/profile";
			String user = "root";
			String password = "1234";
			
			connection = DriverManager.getConnection(jdbcUrl,user,password);
			String sql = "select board_seq,title,contents,reg_date from T_BOARD";			
			
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
%>
			<tr>
				<th scope="row"><%=rs.getString("BOARD_SEQ") %></th>
				<td> 
					<a href="/board/detail.jsp?boardSeq=<%=rs.getString("BOARD_SEQ") %>">						
					<%=rs.getString("TITLE") %>						</a>
				</td>
		
				<td><%=rs.getString("CONTENTS") %>
				</td>
				<td><%=rs.getString("REG_DATE") %></td>
			</tr>	
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

  </tbody>
</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</body>
</html>