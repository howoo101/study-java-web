<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><body>
</head>

<script>
	var save = "${save}";
	var massage = '${message}';
	if(save) {
		alert(message);
	location.href="/board/list";
	}else {
		alert("!!!!!");
		history.back(-1);
	}
</script>
<h1>등록화면 </h1>
<p>제목 : ${board.title} </p> 
<p>내용 : ${board.contents} </p>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>