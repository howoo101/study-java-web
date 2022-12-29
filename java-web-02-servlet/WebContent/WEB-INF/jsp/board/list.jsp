<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">등록일자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="board" items="${boardList}">
			<tr>
				<th scope="row">${board.boardSeq}</th>
				<td>
				<a href="/board/detail?boardSeq=${board.boardSeq}">
					${board.title}
				</a>
				</td>
				<td>${board.regDate}</td>
			</tr>
			</c:forEach>
			<!--게시물 데이터가 없는 경우   -->
			<tr>
				<c:if test="${boardList.size() == 0}">
					<td colspan="3">게시물이 존재하지 않습니다.</td>	
				</c:if>
			</tr>
			
			</table>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</body>
</html>