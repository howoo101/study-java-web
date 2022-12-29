<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
    //삭제가안된경우
	if("${save}") {
		alert('게시물 삭제가 성공하였습니다.');
		location.href = '/board/list';
	}
	else {
		// 삭제가된경우
		alert('게시물 삭제를 실패하였습니다.');
		history.back(-1);		
	}
	
	</script>
    
</body>
</html>	