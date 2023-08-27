<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div id="content-section" class="dynamic-height">
				<div id="title">
					<input type="hidden" name="postNo" value="${post.postNo }">
					<input type="hidden" name="postFileName"
						value="${post.postFileName }"> <input type="hidden"
						name="postFileRename" value="${post.postFileRename }"> <input
						type="hidden" name="postFilePath" value="${post.postFilePath }">
					<input type="hidden" name="postFileLength"
						value="${post.postFileLength }">
					<h3>${post.postTitle }</h3>
					<div id="pfp">
						<img id="pfpimg" src="/resources/images/icon/profile-smile.png"
							alt="">
					</div>
					<div id="name">${writer }</div>
					<h4>${post.postDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수
						${viewCount }</h4>
				</div>
				<div class="post-img-container">
					<div class="post-img">
						<img class="img" src="/resources/images/adopt/adopt1.png" alt="">
					</div>
					<div class="post-img">
						<img class="img" src="/resources/images/adopt/adopt2.png" alt="">
					</div>
					<div class="post-img">
						<img class="img" src="/resources/images/adopt/adopt3.png" alt="">
					</div>
					<div class="post-img">
						<img class="img" src="/resources/images/adopt/adopt4.png" alt="">
					</div>
					<div class="post-img">
						<img class="img" src="/resources/images/adopt/adopt5.png" alt="">
					</div>
				</div>

				<button id="prevButton">&lt;</button>
				<button id="nextButton">&gt;</button>

				<p class="text">${post.postContent }</p>
			</div>
			<div id="list">▼&nbsp;&nbsp;제일 예쁜 보리♥</div>
			<a href="/post//postlist.do"><button>목록</button></a>
			<button class="formBtn"
				onclick="location.href='/post/delete.do?postNo=${post.postNo}'">삭제</button>
			<button class="formBtn"
				onclick="location.href='/post/update.do?postNo=${post.postNo}'">수정</button>
	</div>
	<div id="reply-section" class="dynamic-height">
		<form action="/reply/add.do" method="post">
			<input type="hidden" name="refPostNo" value="${post.postNo }">
			<table width="800" border="1">
				<tr>
					<td><textarea rows="3" cols="110" name="replyContent"></textarea>
					</td>
					<td><input type="submit" value="완료"></td>
				</tr>
			</table>
		</form>
		<!-- 댓글 목록 -->
		<div id="replyList">
			<c:forEach var="reply" items="${rList}">
				<div class="reply">
					<div class="info">${reply.replyWriter}</div>
					<div class="content">${reply.replyContent}</div>
					<div class="date">${reply.rCreateDate}</div>
					<div class="actions">
						<a href="javascript:void(0);"
							onclick="showReplyModifyForm(this, '${reply.replyContent}')">수정하기</a>
						<a href="#">삭제하기</a>
					</div>
				</div>
				<div id="replyModifyForm" style="display: none;">
					<form action="/reply/update.do" method="post">
						<input type="hidden" name="replyNo" value="${reply.replyNo}">
						<input type="hidden" name="refPostNo" value="${reply.refPostNo}">
						<input type="text" size="50" name="replyContent"
							value="${reply.replyContent}">
						<button type="submit">완료</button>
					</form>
				</div>
			</c:forEach>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		function showModifyPage() {
			const PostNo = "${post.postNo }";
			location.href = "/post/modify.do?postNo=" + postNo;
		}
		function showPostList() {
			location.href = "/post/postlist.do";
		}

		// 동적으로 높이 조절하는 함수
		function adjustMainHeight() {
			var mainDiv = document.querySelector('.dynamic-height');
			var contentHeight = mainDiv.clientHeight; // 실제 내용의 높이

			// 조절하고자 하는 여백 값(예: 100px)을 더해줄 수도 있습니다.
			var padding = 100;

			mainDiv.style.height = contentHeight + padding + 'px';
		}

		// 페이지 로드 후 실행
		window.onload = function() {
			adjustMainHeight();
		}

		//이미지 슬라이드
		document.addEventListener('DOMContentLoaded', function() {
			var currentIndex = 0;
			var postImages = document.querySelectorAll('.post-img');
			var prevButton = document.getElementById('prevButton');
			var nextButton = document.getElementById('nextButton');

			function updateImageDisplay() {
				for (var i = 0; i < postImages.length; i++) {
					postImages[i].classList.remove('active');
				}
				postImages[currentIndex].classList.add('active');
			}

			prevButton.addEventListener('click', function() {
				currentIndex = (currentIndex - 1 + postImages.length)
						% postImages.length;
				updateImageDisplay();
			});

			nextButton.addEventListener('click', function() {
				currentIndex = (currentIndex + 1) % postImages.length;
				updateImageDisplay();
			});

			updateImageDisplay();
		});
	</script>
</body>
</html>