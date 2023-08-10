<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<c:set var="contextPath" value="{$pageContext.request.contextPath}" /><!-- /myapp프로젝트 경로 리턴 -->



<div class="container">
     <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">       
      


 <div id="bodywrap">
	


<p><a href="insert.do">공지사항</a></p>
<h1> <공지사항> </h1> 
<table>

<tr style="background-color:pink;">
	<th scope="col">number</th>
	<th scope="col">email</th>
	<th scope="col">title</th>
	<th scope="col">content</th>
	<th scope="col">date</th>
	<th scope="col">count</th>
	<th scope="col">update</th>
	<th scope="col">delete</th>
</tr>

<tr>
<c:forEach items="${aList}" var="dto">
 <tr>
  	<td width="100">${dto.num}</td> 
  	<td width="150">${dto.email}</td> 
  	<td width="430"><a href="show.do?num=${dto.num}">${dto.notice_title}</a></td> 
  	<td width="305">${dto.notice_content}</td> 
  	<td width="205">${dto.write_date}</td>
  	<td width="205">${dto.notice_count}</td>
  	<td width="175"><a href="update.do?num=${dto.num}">수정</a></td>
  	<td width="400"><a href="delete.do?num=${dto.num}&currentPage=${pv.currentPage}">삭제</a></td> 
 </tr>
 </c:forEach>
 </table>
 
 <ul class="pagination d-flex justify-content-center mt-5 mb-5">
 
 
    <!-- 이전 출력 시작 -->
       <c:if test="${pv.startPage>1}">
       	 <li class="page-item">
       	 <a class="page-link" href="list.do?currentPage=${pv.startPage-pv.blockPage}">Prev</a>
       	 <i class="fas fa-chevron-left"></i></li>
       </c:if>
    <!-- 이전 출력 끝 -->

    <!-- 페이지 출력 시작 -->
 
    <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
      <li>
	    <c:choose>
	     <c:when test="${i==pv.currentPage}">
	       <a class="page-link page-item active" href="list.do?currentPage=${i}">${i}</a>
	     </c:when>
	        <c:otherwise>
	         <a class="page-link" href="list.do?currentPage=${i}">${i}</a>
	        </c:otherwise>
	    </c:choose>             
      </li> 
      </c:forEach>
     <!-- 페이지 출력 끝 -->
     
     <!-- 다음 출력 시작 -->
     <c:if test="${pv.endPage < pv.totalPage}">
     <li>
     	<a class="page-link" href="list.do?currentPage=${pv.startPage + pv.blockPage}">Next</a>
         
     </li>
     </c:if>
     <!-- 다음 출력 끝 -->
     
</ul>
</div> 

  </div>	   
    </div>  
</div> 




