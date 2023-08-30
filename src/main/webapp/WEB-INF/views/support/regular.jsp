<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정기후원</title>
	</head>
	<body>
	<div id="container">
	 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	 <main id="main">
	 <div>
		<h1>사랑하개 정기후원</h1>
		<p>정기후원은 정기적인 금액의 후원을 통해 사랑하개의 활동을 지지하는 후원입니다.<br>
		첫 결제 시 후원자님의 성함과 후원 일자가 기재된 후원증서를 보내드립니다.</p>
		<p>변경 및 취소 등 후원 관련 문의는 xasiak@naver.com으로 성함, 연락처와 함께 문의사항을 기재해주세요</p>
	 </div>
		<div>
		<p>(주)사랑하개<br>
		연락처 | 070-1111-2222</p>
		</div>
		<div>
		<h2>※회원정보</h2>
		<form action="/support/regular.do" method="post">
			<ul>
				<li>
					회원명 ※필수항목<br>
					<input type="text" name="supportName" placeholder="예: 홍길동"><br>
				</li>
				<li>
					휴대전화  ※필수항목<br>
					<input type="text" name="supportPhone">
				</li>
				<li>
					이메일  ※필수항목<br>
					<input type="text" name="supportEmail">@
					
				</li>
				<li>
					주소 ※필수항목<br>
					<input type="text" name="supportAddr">
					<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
				</li>
				<li>
					회원구분 ※필수항목<br>
					<select  name="type" id="support-type" required>
						<option value="정기후원">정기후원</option>
						<option value="일시후원">일시후원</option>
					</select>
				</li>
				<li>
					<button></button>
					<button></button>
				</li>
				<li>
					<button></button>
					<button></button>
				</li>
				<li>
					은행
					<select  name="support-bank" id="support-bank" required>
						<option value="정기후원">정기후원</option>
						<option value="일시후원">일시후원</option>
					</select>
				</li>
				<li>
					예금주명
				</li>
				<li>
					계좌번호
				</li>
				<li>
					생년월일 <span id="">※주민등록번호 앞 6자리</span>
				</li>
				<li>
					결제일(매월)
					※매월 해당일에 자동결제 됩니다.
					<button type="submit" value="05일"></button>
					<button type="submit" value="11일"></button>
					<button type="submit" value="18일"></button>
					<button type="submit" value="25일"></button>
				</li>
				<li>
					결제금액
					※최소 10,000원 이상 결제 가능합니다.
					<button type="submit" value="10,000원"></button>
					<button type="submit" value="50,000원"></button>
					<button type="submit" value="100,000원"></button>
					*원하시는 결제금액이 없으면 직접 입력해주세요.
					<input type="text" name="support-moeny">원
				</li>
			</ul>
				
                <div class="agree"> 
                    <input type="checkbox" name='term'>
                    개인정보수집 및 이용, 제공, 위탁 등에 동의<span id="color">(필수)</span>
                    <input type="checkbox" name='term'>
                    신청내역 확인 및 매월 자동결제에 동의<span id="color">(필수)</span>
                </div>
                <div>
                [전자서명]
                
                </div>
                
				
			
			
			
			
		</form>
		</div>
	 </main>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function sample4_execDaumPostcode(){
				new daum.Postcode({
					oncomplete : function(data){
						document.querySelector("#memberAddress")
		        		.value = "(" + data.zonecode + ") " + data.jibunAddress + ", " + data.buildingName;
					}
				}).open();
			}
		</script>
	</body>
</html>