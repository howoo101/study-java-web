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
		<form action="/board/save" method="post">
			<input type="hidden" name="boardSeq" 
				value="${board.boardSeq}" />
			<div class="mb-3">
				<label for="title" class="form-label">제목</label>
				<input type="text" class="form-control"
					name="title" id="title" value="${board.title}" placeholder="게시글의 제목">
			</div>
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label>
				<textarea class="form-control" 
					name="contents" 
					id="contents"
					rows="3">${board.contents}</textarea>
			</div>
			<button type="submit" class="btn btn-primary">등록하기</button>
		</form>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</body>
</html>
