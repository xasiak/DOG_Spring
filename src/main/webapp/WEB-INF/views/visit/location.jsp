<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상담문의&방문 페이지</title>
        <link rel="stylesheet" href="/resources/css/location.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
            <main id="main">
                <div id="title">
                    <div>
                        <img id="dog-img" src="/resources/images/icon/dog.png" alt="">
                    </div>
                    <div>
                        <h2>상담문의&방문</h2>
                    </div>
                </div>
                    <div id="">
                        <div class="info">
                            <div class="info-l">
                                <div class="info-t">사랑하개 서울본점 오시는 길</div>
                                <div class="info-b">
                                    서울특별시 마포구 매봉산로 31 (상암동) 에스플렉스센터 지하1층
                                    <br>02-2124-2839
                                </div>
                            </div>
                            <div id="map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.1322748478615!2d126.88739027635596!3d37.57550282361306!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9913571fc981%3A0xadfa05faccc7b978!2z7JeQ7Iqk7ZSM66CJ7Iqk7IS87YSw!5e0!3m2!1sko!2skr!4v1685827243890!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                        <div class="info">
                            <div class="info-l">
                                <div class="info-t">사랑하개 부산점 오시는 길</div>
                                <div class="info-b">
                                    부산광역시 강서구 제도로 726
                                    <br>051-293-9779
                                </div>
                            </div>
                            <div id="map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d203.8226123098953!2d128.9170442825746!3d35.177519701458245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568c1bb90305339%3A0x45048be8e99d5f6a!2z7IKs64uo67KV7J24IO2VmOyWgOu5hOuRmOq4sA!5e0!3m2!1sko!2skr!4v1685829139596!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                        <div class="info">
                            <div class="info-l">
                                <div class="info-t">사랑하개 인천점 오시는 길</div>
                                <div class="info-b">
                                    인천광역시 부평구 체육관로 40 (삼산동, 신영프라자)
                                    <br>032-330-0075
                                </div>
                            </div>
                            <div id="map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d665.3575629079509!2d126.73582106751125!3d37.508111755393024!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7da654a8c503%3A0xe6694b92a0ac4223!2z7J247LKc6rSR7Jet7IucIOu2gO2Pieq1rCDssrTsnKHqtIDroZwgNDA!5e0!3m2!1sko!2skr!4v1685829662207!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                	</div>
             </main>
             <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            </div>
        </body>
    </html>