<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	니가 뭘 알아

	<%
	//카드를 화면에 노출할지 여부
	boolean cardDisplay = true;
	if (cardDisplay) {
	%>
	<p>나의 이름은 호민김</p>
	<%
	}
	List<String> names = Arrays.asList("Servlet", "Spring", "Spring booot");
	int count = 0;
	for (String name : names) {
	count++;
	out.print("<h2>" + count + "</h2>");
	%>
	<h1>
		name :
		<%=name%></h1>
	<%
	}
	%>

</body>
</html>