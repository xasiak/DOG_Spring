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
	                            <input type="text" id="member-email" class="joinform" name="member-email" placeholder="이메일" >
<!-- 	                            <input type="button" value="중복체크" class="emailSameCheck"> -->
	                            <button type="button" id="emailCheckBtn">중복체크</button>
	                        </div>
	                        
	                        <div id="pw"> 
							    <input type="password" id="member-pw" class="joinform" name="member-pw" placeholder="비밀번호">
							    <div class="error-message" id="pw-error"></div>
							</div>
	                       <div id="pw-check"> 
							    <input type="password" id="member-pw-check" class="joinform"  placeholder="비밀번호 확인">
							    <div class="error-message" id="pw-match-error"></div>
							</div>
	                        <p class="title" >이름</p>
	                       <div id="name">
							    <input type="text" id="member-name" class="joinform" name="member-name" placeholder="이름">
							    <div class="error-message" id="name-error"></div>
							</div>
	                        <p class="title">연락처</p>
	                        <div id="phone">
							    <input type="text" id="member-phone" class="joinform" name="member-phone" placeholder="연락처">
							    <div class="error-message" id="phone-error"></div>
							</div>
	                       <div class="button-container">
							    <button type="submit" class="joinform-button">가입</button>
							    <button type="reset" class="joinform-button">취소</button>
							</div>
						</form>
                    
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
        <script type="text/javascript">
        	// 비밀번호 중복 체크
// 	        var password = document.getElementById("member-pw");
// 	        var check_password = document.getElementById("member-pw-check");
// 	        function validatePassword(){
// 	        	  if(password.value != check_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
// 	        	    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
// 	        	    check_password.setCustomValidity("비밀번호가 일치하지 않습니다."); 
// 	        	  } 
// 	        	  else { // 만일 두 인풋 필드값이 같을 경우
// 	        	    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
// 	        	    // 따라서 빈값을 주어 submit 처리되게 한다
// 	        	    check_password.setCustomValidity(''); 
// 	        	  }
// 	        	}

//         	password.onchange = validatePassword;
//         	check_password.onkeyup = validatePassword;
			
const emailInput = document.getElementById("member-email");
const pwInput = document.getElementById("member-pw");
const pwCheckInput = document.getElementById("member-pw-check");
const nameInput = document.getElementById("member-name");
const phoneInput = document.getElementById("member-phone");

let isEmailChecked = false; // 이메일 중복 체크 상태를 나타내는 변수

// 이메일 입력 시 오류 메시지 초기화
emailInput.addEventListener("input", function() {
    document.getElementById("email-error").textContent = "";
    isEmailChecked = false; // 이메일이 변경되면 중복 체크 상태 초기화
});

// 비밀번호 입력 시 오류 메시지 초기화
pwInput.addEventListener("input", function() {
    document.getElementById("pw-error").textContent = "";
});

// 비밀번호 확인 입력 시 오류 메시지 초기화
pwCheckInput.addEventListener("input", function() {
    document.getElementById("pw-match-error").textContent = "";
});

// 이름 입력 시 오류 메시지 초기화
nameInput.addEventListener("input", function() {
    document.getElementById("name-error").textContent = "";
});

// 연락처 입력 시 오류 메시지 초기화
phoneInput.addEventListener("input", function() {
    document.getElementById("phone-error").textContent = "";
});

//중복 체크 버튼 클릭 시 이메일 중복 체크
document.getElementById("emailCheckBtn").addEventListener("click", function() {
    const email = emailInput.value;

    if (email === "") {
        alert("이메일을 입력하세요.");
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("GET", "/member/emailCheck.do?member-email=" + encodeURIComponent(email), true);

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = xhr.responseText;
                if (response === "available") {
                    alert("사용 가능한 이메일입니다.");
                    isEmailChecked = true; // 이메일 중복 체크 완료 상태로 설정
                } else {
                    alert("이미 사용 중인 이메일입니다.");
                }
            } else {
                alert("이메일 체크 중 오류가 발생했습니다.");
            }
        }
    };
    
    xhr.send();
});

// 폼 제출 시 유효성 검사
document.querySelector("form").addEventListener("submit", function(event) {
    event.preventDefault();

    const email = emailInput.value;

    if (!/\S+@\S+\.\S+/.test(email)) {
        document.getElementById("email-error").textContent = "유효한 이메일 주소를 입력하세요.";
        return;
    }

//     const xhr = new XMLHttpRequest();
//     xhr.open("GET", "/member/emailCheck.do?member-email=" + encodeURIComponent(email), true);

    if (!isEmailChecked) { // 이메일 중복 체크 확인 여부를 검사
        alert("이메일 중복 체크를 수행해야 합니다.");
        return;
    }

    validateOtherFields();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = xhr.responseText;
                if (response === "available") {
                    validateOtherFields();
                } else {
                    alert("이미 사용 중인 이메일입니다.");
                }
            } else {
                alert("이메일 체크 중 오류가 발생했습니다.");
            }
        }
    };
    
    xhr.send();
});

// 다른 필드들의 유효성 검사
function validateOtherFields() {
    const password = pwInput.value;
    const passwordCheck = pwCheckInput.value;
    const pwError = document.getElementById("pw-error");
    const pwMatchError = document.getElementById("pw-match-error");
    if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/.test(password)) {
        pwError.textContent = "비밀번호는 영문(대소문자)과 숫자, 특수 문자를 포함하여 8~20자여야 합니다.";
        return;
    } else if (password !== passwordCheck) {
        pwMatchError.textContent = "비밀번호가 일치하지 않습니다.";
        return;
    } else {
        pwError.textContent = "";
        pwMatchError.textContent = "";
    }
    
    const name = nameInput.value;
    const nameError = document.getElementById("name-error");
    if (!/^[가-힣]*$/.test(name)) {
        nameError.textContent = "한글만 입력 가능합니다.";
        return;
    } else {
        nameError.textContent = "";
    }

    const phone = phoneInput.value;
    const phoneError = document.getElementById("phone-error");
    if (!/^[0-9]{10,11}$/.test(phone)) {
        phoneError.textContent = "유효한 연락처를 입력하세요.";
        return;
    } else {
        phoneError.textContent = "";
    }

    document.querySelector("form").submit();
}
        </script>
    </body>
</html>