<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
        <link rel="stylesheet" href="/resources/css/index.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
   	 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   	 	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    </head>
    <body>
        <div id="container">
           <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
            <main id="main">
                <section id="main-layer1">
                    <a href="#"><img id="maintop-img" src="/resources/images/main.png" alt=""></a>
                </section>
                <section class="main-layer" id="main-layer2" data-aos="fade-up">
                    <div id="main2-text">
                        <h2>보호중 아이들</h2>
                        <h3>아이들에게 따뜻한 손을 내밀어주세요.<button class="more" type="button" onclick="location.href='#'">더보기</button></h3>
                        
                    </div>
                    <div id="dogs-img">
                        <div class="main-img"><img class="img" src="/resources/images/protection/아이좋아.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection2.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection3.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection4.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection5.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection6.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection7.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection8.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection9.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/protection/protection10.png" alt=""></div>
                    </div>
                </section>
                <section class="main-layer" id="main-layer3"  data-aos="fade-up">
                    <div id="main3-text" >
                        <a href="#"><h2>함께하는 환경</h2></a>
                        <a href="#"><h3>'사랑하개는 아이들이 좋아하는 환경을 만들기 위해 세심하게 신경을 기울입니다.<button class="more" type="button" onclick="location.href='#'">더보기</button></h3></a>
                    </div>
                    <div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment1.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment2.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment3.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment4.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment5.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment6.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment7.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment8.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment9.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/environment/environment10.png" alt=""></div>
                    </div>
                </section>
                <section class="main-layer" id="main-layer4"  data-aos="fade-up">
                    <div id="main4-text">
                        <a href="#"><h2>입양사진 및 후기</h1></a>
                        <a href="#"><h3>우리 아이들의 행복뿜뿜 즐거운 생활! 함께하개는 아이를 극진히 사랑할 가족과 이어줍니다.<button class="more" type="button" onclick="location.href='/post/postlist.do'">더보기</button></h3></a>
                    </div>
                    <div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt1.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt2.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt3.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt4.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt5.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt6.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt7.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt8.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt9.png" alt=""></div>
                        <div class="main-img"><img class="img" src="/resources/images/adopt/adopt10.png" alt=""></div>
                    </div>
                </section>
            </main>
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
    <script>
  		AOS.init();
	</script>
    </body>
</html>