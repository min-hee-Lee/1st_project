<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 
    <div class="gallery_info" id="gallery_info">
    <div class="gallery_tl" id="gallery_tl">
    <c:forEach items="${informationDtoList}" var="information" >
    <div class="gallery_item" id="gallery_item">
    <a href="review/list.do=${picture.info_title}"></a><img class="gallery_img" src="
    images/${information.pic_name}" width="300" height="300">
    <div>${information.info_title}</div>
    <div>${information.info_content}</div>
    <div>${information.info_date}</div>
    <div>${information.info_address}</div>
    <div>${information.entrance_fee}</div>
    <div>${information.services_time}</div>
    <div>${information.closed_time}</div>
    <div>${information.info_tel}</div>
    <div>${information.info_homepage}</div>
  </div>
     </c:forEach> 
		</div>
		</div> <!-- end gallery-scroll -->