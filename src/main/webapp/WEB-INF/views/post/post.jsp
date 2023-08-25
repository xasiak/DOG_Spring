<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입양후기 게시물</title>
	<link rel="stylesheet" href="/resources/css/post.css">
	<link rel="stylesheet" href="/resources/css/reset.css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<main id="main">
			<div id="title">
				<input type="hidden" name="postNo" value="${post.postNo }">
               	<input type="hidden" name="postFileName" value="${post.postFileName }">
               	<input type="hidden" name="postFileRename" value="${post.postFileRename }">
               	<input type="hidden" name="postFilePath" value="${post.postFilePath }">
               	<input type="hidden" name="postFileLength" value="${post.postFileLength }">
				<h3>${post.postTitle }</h3>
				<div id="pfp">
					<img id="pfpimg" src="/resources/images/icon/profile-smile.png"
						alt="">
				</div>
				<div id="name">${writer } </div>
				<h4>${post.postDate } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 ${viewCount }</h4>
			</div>
			<div id="images">
				<div>
					<p>첨부파일</p>
					<img alt="첨부파일" src="../resources/nuploadFiles/${post.postFileRename }"><br>
					<a href="../resources/nuploadFiles/${post.postFileRename }" download>${post.postFileName }</a> 
				</div>
				<div>
					<p class="text">
						${post.postContent }
					</p>
				</div>
<!-- 				<div> -->
<!-- 					<img class="dog-img" src="/resources/images/review/review1.jpeg" -->
<!-- 						alt=""> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<p class="text"> -->
<!-- 						처음 집에 온 날, 모든게 바뀌고 낯설었던 날 <br>그래도 한번씩 돌아보면 저를 쳐다봐주었어욥 -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<img class="dog-img" src="/resources/images/review/review3.jpeg" -->
<!-- 						alt=""> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<p class="text"> -->
<!-- 						어느 순간부터 날 예쁜눈으로 바라봐주었습니당 <br>너무 예쁘지 않나용ㅠㅠ <br>진짜 -->
<!-- 						예뻐죽겠어요ㅠㅠ -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<img class="dog-img" src="/resources/images/review/review4.jpeg" -->
<!-- 						alt=""> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<p class="text"> -->
<!-- 						지금은 칭구들과 함께 낮잠도 자는 중입니당~~ <br>우리 아콩이 만나게 해준 <br>사랑하개 보호소 -->
<!-- 						너무 감사합니당♥ -->
<!-- 					</p> -->
<!-- 				</div> -->
			</div>
			<div id="list">▼&nbsp;&nbsp;제일 예쁜 보리♥</div>
			<a href="/post//postlist.do"><button>목록</button></a>
			<button onclick="location.href='/post/delete.do?postNo=${post.postNo}'">삭제</button>
			<button onclick="location.href='/post/update.do?postNo=${post.postNo}'">수정</button>

		</main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>