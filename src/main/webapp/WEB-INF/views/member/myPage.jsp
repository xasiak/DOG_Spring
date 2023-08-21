<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정보수정</title>
		<link rel="stylesheet" href="/resources/css/myPage.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
		<div id="container">
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
			<main id="main">
				<h3>마이페이지</h3>
				<div id="modify">
					<div id="modifyform-t">
						<div id="pfp">
							<img id="pfp-img" src="/resources/images/icon/profile.png"
								alt="프로필">
						</div>
						<div id="file">
							<img id="camera" src="/resources/images/icon/camera.png" alt="카메라">
						</div>
					</div>
					<form action="/member/update.do" method="post">
						<div id="id">
							<input class="modifyform" type="text" name="member-email"
								id="member-email" value="${ member.memberEmail }" readonly>
						</div>
						<div id="pw">
							<input class="modifyform" type="password" name="member-pw"
								id="member-pw" placeholder="비밀번호">
						</div>
						<div id="pw-check">
							<input class="modifyform" type="password" id="member-pw-check"
								placeholder="비밀번호 확인">
						</div>
						<p class="title">이름</p>
						<div id="name">
							<input class="modifyform" type="text" name="member-name"
								id="member-name" value="${member.memberName }" placeholder="이름">
						</div>
						<p class="title">연락처</p>
						<div id="phone">
							<input class="modifyform" type="text" name="member-phone"
								id="member-phone" value="${member.memberPhone }"
								placeholder="연락처">
						</div>
						<div>
							<button type="submit" id="modifybtn" class="modifyform">수정하기</button>
						</div>
<!-- 						<input type="button" -->
<%-- 							onclick="location.href='/visit/bookList.do?user-email=${member.memberEmail }'" --%>
<!-- 							value="방문예약내역 조회"> -->
						<input type="button" value="방문예약내역 조회" onclick="window.open('/visit/bookList.do?user-email=${member.memberEmail }', '방문예약내역 조회', 'width=300, height=300, top=500, left=500',)">
					</form>
					<p id="p1">소셜 로그인</p>
					<div id="sns">
						<button class="modifyform" id="naverbtn">네이버 연결해제</button>
					</div>
					<div id="n">N</div>
					<div id="modify-footer">
						<a href="javascript:void(0)" onclick="checkDelete();">탈퇴하기</a>
					</div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
		<script type="text/javascript">
			var password = document.getElementById("member-pw");
			var check_password = document.getElementById("member-pw-check");
			function validatePassword() {
				if (password.value != check_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
					// setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
					check_password.setCustomValidity("비밀번호가 일치하지 않습니다.");
				} else { // 만일 두 인풋 필드값이 같을 경우
					// 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
					// 따라서 빈값을 주어 submit 처리되게 한다
					check_password.setCustomValidity('');
				}
			}
	
			password.onchange = validatePassword;
			check_password.onkeyup = validatePassword;
		</script>
		<script>
			// /member/delete.do?memberId='${sessionScope.memberId }'
			function checkDelete() {
				const memberEmail = '${sessionScope.memberEmail }';
				if (confirm("탈퇴하시겠습니까?")) {
					location.href = "/member/delete.do?memberEmail=" + memberEmail;
				}
			}
		</script>
	</body>
</html>