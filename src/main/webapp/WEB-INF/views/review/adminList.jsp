<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!-- js 선언 -->
<script>
	$(document).ready(function() {
		$('.delete').click(function() {
			let frmdel= $(this).parent();
			
		// 관리자가 리뷰 글 지우는 코드 

			frmdel[0].setAttribute("action", 'adminDelete.do');
			frmdel[0].submit();
		});
	});
</script>



<table class="table table-border mt-1">
	<tr>
		<th class="col-md-1 text-center">번호</th>
		<th class="col-md-7 text-center">리뷰 이름</th>
		<th class="col-md-2 text-center">작성자</th>
		<th class="col-md-2 text-center">삭제</th>
	</tr>

	<!-- 테이블에 담긴것을 리스트에 넘겨준다. 이걸 forEach로 처리한다. -->
	<c:forEach items="${aList}" var="dto">
		<tr>
			<td class="text-center">${dto.num}</td>
			<td class="pl-2 text-left"><c:url var="path" value="view.do">
					<c:param name="currentPage" value="${pv.currentPage}" />
					<c:param name="num" value="${dto.num}" />
				</c:url> <!-- 들여쓰기 작업 --> <!-- 리뷰글 쓰는 코드 삭제. 코드 없음--> <a href="${path}">
					${dto.review_title}</a></td>
			<td class="text-center">${dto.easyusersDTO.easyuser_name}</td>


			<!-- ========= 현재 작업중인 부분 =============== -->
			<!-- 삭제 버튼 추가해야 함 -->
			<td class="text-center">
				<form name="frm" id="frm" method="get">
					<input type="hidden" name="num" value="${dto.num}" /> 
					<input type="hidden" name="currentPage" id="currentPage" value="${pv.currentPage}" />
					<input type="button" class="delete" value="삭제" />
				</form>
			</td>
			<!-- =================================== -->
		</tr>
	</c:forEach>

</table>

<!-- 아래에 추가 -->
<!-- 관리자용 url에 맞도록 url을 이동시킨다. -->
<ul class="pagination justify-content-center mt-5 mb-5">

	<!-- 이전 출력 시작 -->
	<c:if test="${pv.startPage > 1}">
		<li class="page=item"><a class="page-link"
			href="adminList.do?currentPage=${pv.startPage - pv.blockPage}"> <i
				class="fas fa-chevron-left"></i></a></li>
	</c:if>
	<!-- 이전 출력 끝 -->

	<!--  페이지 출력 시작 -->
	<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">

		<li><c:choose>
				<c:when test="${i==pv.currentPage}">
					<a class="page-link page-item active"
						href="adminList.do?currentPage=${i}"> ${i}</a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="adminList.do?currentPage=${i}">${i}</a>
				</c:otherwise>
			</c:choose></li>
	</c:forEach>
	<!--  페이지 출력 끝 -->

	<!-- 다음 출력 시작 -->
	<c:if test="${pv.endPage < pv.totalPage}">
		<li>
			<!-- 스타트 페이지 =1 --> <a class="page-link"
			href="adminList.do?currentPage=${pv.startPage + pv.blockPage}"> <i
				class="fas fa-chevron-right"></i></a>
		</li>
	</c:if>
	<!-- 다음 출력 끝 -->
</ul>
</div>








