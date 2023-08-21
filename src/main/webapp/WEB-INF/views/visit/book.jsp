<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<title>방문예약 페이지</title>
    <link rel="stylesheet" href="/resources/css/book.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <main id="main">
        <section id="section">
            <h2>방문예약</h2>
            <form action="/visit/book.do" method="post">
            	<div id="form">
                    <ul id="form1" >
                        <li>
                            <span>이름</span> <input type="text" name="user-name" placeholder="  실명을 입력해주세요" required><br>
                        </li>
                        <li>
                            <span>연락처</span> <input type="text" name="user-phone" placeholder="  010-1234-5678" required> <br>
                        </li>
                        <li>
                            <span>이메일</span> <input type="text" name="user-email" value="${sessionScope.memberEmail }" required> <br>
                        </li>
                        <li class="select" >
                            <span>방문희망지점</span>
                            <select  name="point" id="select-point" required>
								<option value="seoul">서울본점</option>
								<option value="busan">부산점</option>
								<option value="incheon">인천</option>
							</select>
<!--                             <input type="text" name="user-place" placeholder="실명을 입력해주세요" required><br> -->
                        </li>
                        <li>
                            <span>방문희망 날짜</span>
<!--                             <input type="text" name="user-date" placeholder="010-1234-5678" required> <br> -->
                        	<input  type="date" name="select-date" id="select-date" required>
                        </li>
                        <li class="select" >
                            <span>방문희망 시간(12~20시까지 접수 가능)</span>
                     	   	<select name="select-time" id="select-time" required>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
							</select>
                        </li>
                    </ul>
                        <legend>가장 우려하는 사항</legend>
                        <ul id="form2">
                            <li>
                                <input type="radio" name="concerns" id="concerns" value="턱빠짐">
                                <label for="concerns">턱빠짐</label>
                            </li>
                            <li>
                                <input type="radio" name="concerns" id="concerns" value="크기">
                                <label for="concerns">크기</label>
                            </li>
                            <li>
                                <input type="radio" name="concerns" id="concerns" value="운동량">
                                <label for="concerns">운동량</label>
                        </li>
                        <li>
                            <input type="radio" name="concerns" id="concerns" value="배변훈련">
                            <label for="concerns">배변훈련</label>
                        </li>
                        <li>
                            <input type="radio" name="concerns" id="concerns" value="짖음(소음)">
                            <label for="concerns">짖음(소음)</label>
                        </li>
                        <li>
                            <input type="radio" id="concerns" value=""> 기타 : <input type="text" name="concerns" placeholder="" > <br>
                            <!-- <label for="concerns"></label> -->
                        </li>
                    </ul>
                        <legend>주거형태</legend>
                    <ul id="form3">
                        <li>
                            <input type="radio" name="house" id="house" value="아파트">
                            <label for="house">아파트</label>

                        </li>
                        <li>
                            <input type="radio" name="house" id="house" value="단독주택">
                            <label for="house">단독주택</label>

                        </li>
                        <li>
                            <input type="radio" name="house" id="house" value="원룸~투룸">
                            <label for="house">원룸~투룸</label>
                        </li>
                        <li>  
                            <input type="radio"  id="house"> 기타 : <input type="text" name="house" placeholder="" > <br>
                            <!-- <label for="house"></label> -->
                        </li>
                    </ul>
                        <legend>가구</legend>
                    <ul id="form4">
                        <li>
                            <input type="radio" name="house-hold" id="house-hold" value="1인가구">
                            <label for="family">1인가구</label>
                        </li>
                        <li>
                            <input type="radio" name="house-hold" id="house-hold" value="신혼부부">
                            <label for="family">신혼부부</label>
                        </li>
                        <li>
                            <input type="radio" name="house-hold" id="house-hold" value="3~4인 핵가족">
                            <label for="family">3~4인 핵가족</label>
                            
                        </li>
                        <li>
                            <input type="radio" name="house-hold" id="house-hold" value="5인 이상 대가족">
                            <label for="family">5인 이상 대가족</label>
                        </li>
                        <li>
                            <input type="radio" id="house-hold"> 기타 : <input type="text" name="house-hold" placeholder="" > <br>
                            <!-- <label for="family"></label> -->
                        </li>
                    </ul>
                </div>
	            <div id="button"><button type="submit" id="submitbtn" class="" >제출하기</button></div>
	            <div id="button"><button type="reset" id="resetbtn" class="" >초기화하기</button></div>
            </form>
            </section>
            </main>
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            </div>
        </body>
   </html>