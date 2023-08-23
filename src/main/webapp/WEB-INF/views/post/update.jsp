<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
    <link rel="stylesheet" href="/resources/css/update.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <main id="main">
                <div id="title">
                    <h2>게시물 수정</h2>
                </div>
                <div id="posts">
                    <form action="/post/update.do" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="postNo" value="${post.postNo }">
                	<input type="hidden" name="postFileName" value="${post.postFileName }">
                	<input type="hidden" name="postFileRename" value="${post.postFileRename }">
                	<input type="hidden" name="postFilePath" value="${post.postFilePath }">
                	<input type="hidden" name="postFileLength" value="${post.postFileLength }">
						<ul>
							<li class="form">
								<label>제목</label>
								<input type="text" name="postTitle" value="${post.postTitle }">
							</li>
							<li class="form">
								<label>작성자</label>
								<input type="text" name="postWriter" value="${post.postWriter }">
							</li>
							<li>
<!-- 								<label>내용</label> -->
								<textarea rows="30" cols="100" name="postContent">${post.postContent }</textarea>
							</li>
							<li id="file">
								<label>첨부파일</label>
								<!-- String으로 받을 수 없고 변환작업 필요 -->
								<a href="../resources/nuploadFiles/${post.postFileName }" download>${post.postFileName }</a> 
								<input type="file" name="uploadFile">
							</li>
						</ul>
						<div>
							<button type="submit">수정</button>
							<button type="reset">취소</button>
						</div>
					</form>
                </div>
            </main>
             <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            </div>
</body>
</html>