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
					<div id="name">${post.postWriter }</div>
					<h4>${post.postDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수
						${post.viewCount }</h4>
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
			<div id="post-btn">
			<button class="main-btn"
				onclick="location.href='/post/delete.do?postNo=${post.postNo}'">삭제</button>
			<button class="main-btn"
				onclick="location.href='/post/update.do?postNo=${post.postNo}'">수정</button>
			</div>
			<div id="list">▼&nbsp;&nbsp;제일 예쁜 보리♥</div>
			<a href="/post//postlist.do"><button id="list-btn">목록</button></a>
	<div id="reply-section" class="dynamic-height">
		<form action="/reply/add.do" method="post">
			<input type="hidden" name="refPostNo" value="${post.postNo }">
			<table>
				<colgroup>
			        <col style="width: 95%;">
			        <col style="width: 5%;">
			    </colgroup>
				<tr>
					<td><textarea rows="3" cols="110" name="replyContent"></textarea>
					</td>
					<td><input id="textarea-btn" type="submit" value="완료"></td>
				</tr>
			</table>
		</form>
		<!-- 댓글 목록 -->
		<div id="replyList" class="dynamic-height">
			<c:forEach var="reply" items="${rList}">
				<c:url var="delReplyUrl" value="/reply/delete.do">
					<c:param name="refPostNo" value="${reply.refPostNo}"></c:param>
					<c:param name="replyNo" value="${reply.replyNo}"></c:param>
					<c:param name="replyWriter" value="${reply.replyWriter}"></c:param>
				</c:url>
				<div class="reply">
					<div class="info">${reply.replyWriter}</div>
					<div class="content">${reply.replyContent}</div>
					<div class="date">${reply.rCreateDate}</div>
					<div class="actions">
						<a href="javascript:void(0);" onclick="showReplyModifyForm(this)">수정하기</a>
						<a href="javascript:void(0);" onclick="deleteReply('${delReplyUrl }');">삭제하기</a>
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
	</div>
	</main>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script type="text/javascript">
	const deleteReply = (delReplyUrl) => {
		location.href = delReplyUrl;
	}
	
	function showReplyModifyForm(obj) {
	    console.log("showReplyModifyForm 함수 호출됨");
	    obj.parentElement.parentElement.nextElementSibling.style.display = "";
	}
	
	
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
			var padding = 50;

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
		
		// 이메일 자르기
		var postWriterElement = document.getElementById('name');
        var postWriterValue = postWriterElement.textContent; // @를 포함한 원래의 문자열

        var atIndex = postWriterValue.indexOf('@'); // @의 인덱스 찾기
        var result = (atIndex !== -1) ? postWriterValue.substring(0, atIndex) : postWriterValue;

        postWriterElement.textContent = result; // @를 제외한 앞부분만 표시
	</script>
</body>
</html>