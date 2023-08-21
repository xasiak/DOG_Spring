<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>입양절차</title>
    <link rel="stylesheet" href="/resources/css/guide.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <main id="main">
            <div>
                <img id="dog-img" src="/resources/images/icon/dog_guide.png" alt="">
            </div>
            <div>
                <h2>입양안내</h2>
                <h4>함께하개는 올바른 입양문화를 지키겠습니다.</h4>
            </div>
            <div id="guide">
                <div id="guide-text">
                    <h3>1. 입양자격</h3>
                    <ul class="list">
                        <li>책임입양이 가능한 <span class="yellow">18세이상</span>  신원확인 가능한 성인</li>
                        <li><span class="yellow">경제적 능력</span>이 있고 <span class="yellow">반려동물을 사랑</span>하는 가정</li>
                        <li>입양 후 <span class="yellow">1년간 6회이내</span> 아이 생활사진 보내주실 수 있는 분</li>
                    </ul>
                    <h3>2. 입양절차</h3>
                    <ul class="list">
                        <li>보호중아이들 <span class="yellow">확인 후 문의</span></li>
                        <li>보호소 방문</li>
                        <li>책임분양계약 및 입양</li>
                    </ul>
                    <h3>3. 아이들을 위한 최소한의 사랑 책임비</h3>
                    <ul class="list" id="last-list">
                        <li>책임비는 수익목적재분양, 재유기파양, 생산출산업자입양, 식용도용, 재정능력 없는 <br> 가정을 필터링 하기 위한 <span class="yellow">최소한의 장치</span>입니다.</li>
                        <li>책임비는 <span class="yellow">유기동물보호 및 케어, 입양장려 캠페인, 유기견방지 캠페인</span> 등에 쓰여집니다.</li>
                    </ul>            
                </div>
            </div>
        </main>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    </div>
    </body>
</html>