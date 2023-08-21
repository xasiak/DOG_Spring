<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
        <link rel="stylesheet" href="/resources/css/login.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
            <main id="main">
                <div id="login">
                        <div  id="sns"> <button class="loginform" id="naverbtn"> 네이버로 시작하기</button></div>
                        <div id="n">N</div>
                        <div class="loginform">
                            <div class="line"><hr></div>
                            <div id="or">또는</div>
                            <div class="line"><hr></div>
                        </div>
                        <form action="/member/login.do" method="post">
                        <div id="id">
                            <input class="loginform" type="text" name="member-email" id="id" placeholder="이메일을 입력하세요">
                        </div>
                        <div id="pw"> 
                            <input class="loginform" type="password" name="member-pw" id="pw" placeholder="비밀번호를 입력하세요">
                        </div>
                        <div id="keep"> 
                            <input type="checkbox">
                            로그인 상태유지
                        </div>
                        <div><button type="submit" id="loginbtn" class="loginform" >로그인</button></div>
                        </form>
                    </div>
                    <div id="login-footer">
                        <a href="#">회원가입</a>
                        <a href="#">ID/PW 찾기</a>
                    </div>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>