<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/commons.css">
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<script>
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();

$(document).ready(function(){
  
  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
  
    //next slide  
  $('#next').click(function(){
    slideRight();
  });
  
  //previous slide
  $('#previous').click(function(){
    slideLeft();
  });
  
  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000); 
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
  );

});//DOCUMENT READY
  
/***********
 SLIDE LEFT
************/
function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
  
  //*> optional
  countSlides();
  pagination();
}

/************
 SLIDE RIGHT
*************/
function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}

/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
  
  
}
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class = "content">
		<!-- content  -->
		<!-- 캐러셀 시작 -->
		<div id="wrapper">
	      <div id="slider-wrap">
	          <ul id="slider">
	             <li>
						<img src="http://localhost:9000/daangn/pro_img/pro_img.jpg">
	             </li>
	             
	             <li>
						<img src="http://localhost:9000/daangn/pro_img/pro_img2.jpg">
	             </li>
	             
	             <li>
						<img src="http://localhost:9000/daangn/pro_img/pro_img3.jpg">
	             </li>
	          </ul>
	           <!--controls-->
	          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
	          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
	          <div id="counter"></div>
	          <div id="pagination-wrap">
	            <ul>
	            </ul>
	          </div>
	          <!--controls-->  
	      </div>
	   </div>
		<!-- 캐러셀 종료 -->
		<!-- 내용 section -->
		<section class = "p_content">
			<div class = profile>
				<img src = "http://localhost:9000/daangn/pro_img/profile_icon.png">
				<div>
					<a href = "#"><span>바니바니바니</span></a>
					<span>시흥시 정왕동</span>
				</div>
				<!-- 매너온도 표시 : 클릭시 해당 회원정보 페이지로 이동 -->
				<div>
					<span>36.5</span>
					<img src = "http://localhost:9000/daangn/pro_img/manner3.PNG">
					<span>매너온도</span>
				</div>
			</div>	
			<div class = "pro_content">
				<h1>의자,테이블 정리해요 각 만원!</h1>
				<span>가구/인테리어 ∙ 5일 전</span>
				<h3>10,000원</h3>
				<p>의자 8개<br>
				긴의자 1개<br>
				테이블 2개<br>
				<br>
				톡 주세요!</p>
				<span>채팅 20 ∙ 관심 13 ∙ 조회 413</span>
			</div>
		</section>
			
		<!-- 중고 추천 section -->
		<section class = "plist_r">
			<div class = "content">
				<div class = "content_t">
					<span>당근마켓 인기중고</span>
					<a href = "http://localhost:9000/daangn/product.do"><span>더 구경하기</span></a>
				</div>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
			</div>
		</section>
	</div><!-- div.content -->
	
	<!-- footer -->
	
</body>
</html>