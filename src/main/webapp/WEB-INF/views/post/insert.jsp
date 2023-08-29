<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <link rel="stylesheet" href="/resources/css/insert.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <main id="main">
                <div id="section">
                    <img id="dog-icon" src="/resources/images/icon/dog_guide.png" alt="">
                </div>
                <div>
                    <h2>게시물 작성</h2>
                </div>
                <div id="posts">
                    <form action="/post/insert.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="postWriter" value="${sessionScope.memberEmail }">
						<ul>
							<li class="form">
								<label>제목</label>
								<input type="text" name="postTitle">
							</li>
							<li>
<!-- 								<label>내용</label> -->
								<textarea rows="30" cols="100" name="postContent"> </textarea>
							</li>
							<li id="file">
								<label>첨부파일</label>
								<!-- String으로 받을 수 없고 변환작업 필요 -->
								<input type="file" name="uploadFile">
							</li>
						</ul>
						<div>
							<button type="submit">등록</button>
<!-- 							<input type="submit" > -->
						</div>
					</form>
                </div>
            </main>
             <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            </div>
</body>
</html>