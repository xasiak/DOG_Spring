<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입양후기</title>
    <link rel="stylesheet" href="/resources/css/postlist2.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <main id="main">
                <div>
                    <img id="dog-icon" src="/resources/images/icon/dog_guide.png" alt="">
                </div>
                <div>
                    <h2>입양후기</h2>
                    <h4>사지말고 입양하세요</h4>
                </div>
                <div>
                	<form action="/post/search.do" method="get" >
                		<select name="searchCondition">
								<option value="all" <c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="writer" <c:if test="${searchCondition == 'writer' }">selected</c:if>>작성자</option>
								<option value="title" <c:if test="${searchCondition == 'title' }">selected</c:if>>제목</option>
								<option value="content" <c:if test="${searchCondition == 'content' }">selected</c:if>>내용</option>
							</select>
							<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요"  value="${searchKeyword }">
							<input type="submit" value="검색">
                	</form>
                </div>
                <div id="posts">
                    <c:forEach  var="post" items="${pList }" varStatus="i">
                     <div class="post">
                        <div class="post-t">
                            <img class="dog-img" src="/resources/images/adopt/adopt1.png" alt="">
                        </div>
                        <div>
                            <div class="text-t"><a href="/post/post.do?postNo=${post.postNo }">${post.postTitle }</a></div>
                            <div class="text-b" id="text-b">
                                <div>♡${post.postLike }</div>
                                <div>${post.postDate } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 ${post.viewCount }</div>
                            </div>
                        </div>
                    </div>
<!-- 					<tr> -->
<%-- 						<td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td> --%>
<%-- 						<td>${notice.noticeWriter }</td> --%>
<%-- 						<td>${notice.noticeDate }</td> --%>
<%-- 						<td>${notice.viewCount }</td> --%>
<!-- 					</tr> -->
					</c:forEach>
                    
                </div>
                <div id="write">
	                <a href="/post/insert.do"><button>글작성</button></a>
                </div>
                <div>
	                <p id="p1">
	                	<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
	                		<c:url var="pageUrl" value="/post/postlist.do">
	                			<c:param name="page" value="${p }"></c:param>
	                		</c:url>
	                		<a href="${pageUrl }">${p }</a>&nbsp;
	                	</c:forEach>
	                </p>
                </div>
            </main>
             <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            </div>
</body>
</html>