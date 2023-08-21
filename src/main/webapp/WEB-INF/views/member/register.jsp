<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
        <link rel="stylesheet" href="/resources/css/register.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
            <main id="main">
                <div id="join">
                    <div id="joinform-t">
                        <div id="pfp">
                            <img id="pfp-img" src="/resources/images/icon/profile.png" alt="프로필">
                        </div>
                        <div id="file">
                            <img id="camera" src="/resources/images/icon/camera.png" alt="카메라">
                        </div>
                    </div>
                        <div  id="sns"> <button class="joinform" id="naverbtn"> 네이버로 시작하기</button></div>
                        <div id="n">N</div>
                        <div >
                            <div class="line"><hr></div>
                            <div id="or">또는</div>
                            <div class="line"><hr></div>
                        </div>
                        <form action="/member/register.do" method="post">
	                        <div id="id">
	                            <input type="text" id="member-email" class="joinform" name="member-email" placeholder="이메일">
	                        </div>
	                        <div id="pw"> 
	                            <input type="password" id="member-pw" class="joinform" name="member-pw" placeholder="비밀번호">
	                        </div>
	                        <div id="pw-check"> 
	                            <input type="password" id="member-pw-check" class="joinform"  placeholder="비밀번호 확인">
	                        </div>
	                        <p class="title" >이름</p>
	                        <div id="name">
	                            <input type="text" id="member-name" class="joinform" name="member-name" placeholder="이름">
	                        </div>
	                        <p class="title">연락처</p>
	                        <div id="phone">
	                            <input type="text" id="member-phone" class="joinform" name="member-phone" placeholder="연락처">
	                        </div>
	                        <div><button type="submit" id="joinbtn" class="joinform" >가입하기</button></div>
						</form>
<!--                         <div> -->
<!-- 						<ul> -->
<!-- 							<li> -->
<!-- 								<input type="text" id="member-email" class="joinform" name="member-email" placeholder="이메일"> 기능을 위한 id, 쿼리스트링 생성을 위한 name -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<input type="password" id="member-pw" class="joinform" name="member-pw" placeholder="비밀번호"> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<label for="member-name">이름</label><br> -->
<!-- 								<input type="text" id="member-name" class="joinform" name="member-name" placeholder="이름"> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<label for="member-phone">전화번호</label><br> -->
<!-- 								<input type="text" id="member-phone" class="joinform" name="member-phone" placeholder="연락처"> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 						<input class="btn" type="submit" value="가입하기"> -->
<!-- 						<input class="btn" type="reset" value="취소"> -->
						
<!--                         <button id="joinbtn" class="joinform" >가입하기</button></div> -->
<!--                     </div> -->
                    
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
        <script type="text/javascript">
	        var password = document.getElementById("member-pw");
	        var check_password = document.getElementById("member-pw-check");
	        function validatePassword(){
	        	  if(password.value != check_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
	        	    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
	        	    check_password.setCustomValidity("비밀번호가 일치하지 않습니다."); 
	        	  } 
	        	  else { // 만일 두 인풋 필드값이 같을 경우
	        	    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
	        	    // 따라서 빈값을 주어 submit 처리되게 한다
	        	    check_password.setCustomValidity(''); 
	        	  }
	        	}

        	password.onchange = validatePassword;
        	check_password.onkeyup = validatePassword;
//         	const password = document.querySelector("#member-pw").value;
//         	const pwCheck = document.querySelector("#member-pw-check").value;
//         	if(password == pwCheck) {
//         		alert("same");
//         	}else{
//         		alert("different");
//         	}
        </script>
    </body>
</html>