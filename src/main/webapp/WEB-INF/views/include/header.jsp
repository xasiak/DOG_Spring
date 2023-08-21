<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="icon">
    <a href="#"><img class="icon-img" src="/resources/images/icon/kakaotalk.png" alt="카카오톡"></a>
    <a href="#"><img class="icon-img" src="/resources/images/icon/youtube.png" alt="유튜브"></a>
    <a href="#"><img class="icon-img" src="/resources/images/icon/instagram.png" alt="인스타그램"></a>
    <a href="#"><img class="icon-img" src="/resources/images/icon/map.png" alt="지도"></a>
</div>
<header>
    <div id="header-layer1">
        <div id="header-layer1-t">
            <a href="/index.jsp"><img id="logo-img" src="/resources/images/icon/logo.png" alt=""></a>
        </div>
        <div id="header-layer1-b">
            <a href="/index.jsp"><h1 id="logo1">사랑하개</h1>
            <a href="/index.jsp"><p id="logo2">사랑하개는 사지 않고 입양하는 문화를 만듭니다.</p>
        </a>
        </div>
    </div>
    <div id="header-layer2">
            <ul id="top-menu">
				<c:if test="${sessionScope.memberEmail ne null}">
                <li><a href="/member/logout.do">로그아웃</a></li>
                <li><a href="/member/myPage.do?member-email=${memberEmail }">마이페이지</a></li>
        		</c:if>
        		<c:if test="${sessionScope.memberEmail eq null}">
                <li><a href="/member/login.do">로그인</a></li>
                <li><a href="/member/terms.do">회원가입</a></li>
        		</c:if>
                <li><a href="#">검색</a></li>
            </ul>
        </div>
</header>
<nav class="sticky" id="nav">
    <ul class="menu">
        <li>
            <a href="#">사랑하개 활동</a>
        </li>
        <li>
            <a href="/support/support.do">정기후원</a>
        </li>
        <li>
            <a href="#">입양</a>
            <ul class="depth_1">
                <li><a href="#">반려동물 정보</a></li>
                <li><a href="/adopt/guide.do">입양절차</a></li>
                <li><a href="#">보호중 아이들</a></li>
                <li><a href="/post/postlist.do">입양후기</a></li>
            </ul>
        </li>
        <li>
            <a href="#">보호소 방문</a>
            <ul class="depth_1">
                <li><a href="/visit/book.do">방문예약</a></li>
                <li><a href="/visit/location.do">상담문의&방문</a></li>
            </ul>
            </li>
        <li>
            <a href="#">제보/실종</a>
        </li>
    </ul>
</nav>