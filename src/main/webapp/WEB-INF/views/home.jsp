
<!-- 한글깨짐 방지 헤더 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 폰트 스타일 라이브러리 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- font-family: 'Do Hyeon', sans-serif; -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<!-- font-family: 'IBM Plex Sans KR', sans-serif; -->


<!DOCTYPE html>
<html>
<head>
<!-- meta~ 한글 깨짐 방지로 추가 -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Home</title>
	
	<script defer src="resources/js/first.js"></script>
	<link rel="stylesheet" href="resources/css/home.css"> 
</head>
<body>
	<div class="container">
			
			<div class="content0_area">
          <div id="index_01">
        <div id="slide1">
            <ul>
                <li><img src="./resources/images/cherryblossom.jpg" width="1300px" height="800px"></li>
                <li><img src="./resources/images/seoulHanriver.jpg" width="1300px" height="800px"></li>
                <li><img src="./resources/images/banpoHanriverBridge.jpg" width="1300px" height="800px"></li>
            </ul>
       </div>
    </div>
         
         </div>
			
			<div class="content1_area">
			

				<span class="iam">나는</span>
				
				<form action="" method="get" name='frm' id="frm">
					<select name="info_type"
						id="info_type">
						<option value="alone" selected="selected">나 홀로</option>
						<option value="kids">아이와 함께</option>
						<option value="parents">부모님과 함께</option>
						<option value="friends">친구와 함께</option>
					</select>
				
					<select name="info_theme"
						id="info_theme">
						<option value="Exhibition" selected="selected">문화 탐방을 하는</option>
						<option value="Nature">자연을 즐기는</option>
						<option value="Attraction">체험할 수 있는</option>
						<option value="History">역사를 알아가는</option>
						<option value="ETC">추천에 따라</option> 
					</select>
				</form>

				<span class="want"><br>여행을&nbsp;&nbsp; 즐기고&nbsp;&nbsp; 싶어요</span>

				<div class="main-sc2-btn">
					<div class="btn-type-round btn-reload">
						<input type="button" class="btn_reload" value="다른 취향 보기">
					</div>
					<div class="btn-type-round color--black btn-my-view">
						<input type="button" class="btn_black"
							value="&nbsp;&nbsp;&nbsp;내 취향 여행보기">
					</div>
				</div>
			
		
		</div> 

			<div class="content2_area">
			 <div class="slide_btn" id="slide_btn">
    <button class="prev" id="prev">&lt;</button>
		</div>	
    <div class="gallery_scroll" id="gallery_scroll">
    <div class="gallery_teel" id="gallery_teel">
    <c:forEach items="${pictureDtoList}" var="picture" >
    <div class="gallery_item" id="gallery_item">
    <a href="review/list.do?currentPage=1&info_title=${picture.info_title}"><img class="gallery_img" src="
    images/${picture.pic_name}" width="300" height="300"></a>
    <div>${picture.info_title}</div>
    <div>${picture.info_content}</div>
  </div>
     </c:forEach> 
		</div>
		</div> <!-- end gallery-scroll -->
			<div class="slide_btn" id="slide_btn" >
    <button class="next" id="next">&gt;</button>
		</div>
     </div>
    
</div> <!-- end container -->
</body>
</html>
