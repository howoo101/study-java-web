<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="example.ibatis.BaseSqlMapConfig"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapClient client = BaseSqlMapConfig.getInstance();
	System.out.println("client : " + client);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/common/header.jsp" %>
</body>
</html>