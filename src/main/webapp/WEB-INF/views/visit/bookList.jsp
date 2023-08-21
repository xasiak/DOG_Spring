<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문예약 목록 조회</title>
	<link rel="stylesheet" href="/resources/css/bookList.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
		<div id="container">
		<main id="main">
			<h1>방문예약 목록</h1>
				<table>
					<tr>
						<th>이름</th>	
						<th>연락처</th>				
						<th>이메일</th>				
						<th>방문희망지점</th>				
						<th>방문희망 날짜</th>				
						<th>방문희망 시간</th>				
						<th>가장 우려하는 사항</th>				
						<th>주거형태</th>				
						<th>가구</th>				
					</tr>
				<tbody>
					<c:forEach  var="book" items="${vList }">
					<tr>
						<td>${book.bookUserName }</td>
						<td>${book.bookUserPhone }</td>
						<td>${book.bookUserEmail }</td>
						<td>${book.bookPoint }</td>
						<td>${book.bookDate }</td>
						<td>${book.bookTime }</td>
						<td>${book.bookConcern }</td>
						<td>${book.bookUserHouse }</td>
						<td>${book.bookUserHouseHold }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
		</div>
	</body>
</html>