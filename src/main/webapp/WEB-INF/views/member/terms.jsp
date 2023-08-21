<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<title>회원가입 페이지</title>
        <link rel="stylesheet" href="/resources/css/terms.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
            <main id="main">
                <div id="joinform">
                        <div class="agree"> 
                            <input type="checkbox" name='term' value='selectall' onclick='selectAll(this)'/>
                            이용약관, 개인정보 수집 및 이용에 모두 동의합니다.
                        </div>
                        <div class="agree"> 
                            <input type="checkbox" name='term'>
                            이용약관 동의<span id="color">(필수)</span>
                        </div>
                        <div class="terms">
                            제1조 목적

                            <br>본 이용약관은 “사랑하개 통합요양보호센터”(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.
                            <br>
                            <br>제2조 용어의 정의
                            <br>
                            <br>본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.
                            <br>
                            <br>① 회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.
                            <br>② 이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.
                            <br>③ 회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
                            <br>④ 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.
                            <br>⑤ 운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.
                            <br>⑥ 해지 : 회원이 이용계약을 해약하는 것을 말합니다.
                            <br>
                            <br>제3조 약관외 준칙
                            <br>
                            <br>운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.
                            <br>
                            <br>제4조 이용계약 체결
                            <br>
                            <br>① 이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.
                            <br>② 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청시 본 약관을 읽고 아래에 있는 "동의합니다"를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.
                            <br>
                            <br>제5조 서비스 이용 신청
                            <br>
                            <br>① 회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID,비밀번호, 닉네임 등)를 제공해야 합니다.
                            <br>② 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.
                            <br>

                        </div>
                        <div class="agree"> 
                            <input type="checkbox" name='term'>
                            개인정보 수집 및 이용 동의<span id="color">(필수)</span>
                        </div>
                        <div class="terms">
                            <br>1. 개인정보 수집목적 및 이용목적
                            <br>
                            <br>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
                            <br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
                            <br>
                            <br>나. 회원 관리
                            <br>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
                            <br>
                            <br>2. 수집하는 개인정보 항목 : 이름, 로그인ID , 비밀번호 , 주소, 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보
                            <br>
                            <br>3. 개인정보의 보유기간 및 이용기간
                            <br>
                            <br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

                        </div>
                        </div>
                        <div id="join-footer">
                            <div><button id="cancel" class="btn" >취소</button></div>
                            <div><a href="/member/register.do"><button id="join" class="btn" >가입하기</button></a></div>
                        </div>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
        <script type="text/javascript">
        function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('term');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
        </script>
    </body>
</html>