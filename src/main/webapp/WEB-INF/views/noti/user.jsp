<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<c:set var="contextPath" value="{$pageContext.request.contextPath}" />
<!-- /myapp프로젝트 경로 리턴 -->



<script>
	$(document).ready(function() {
		$('#insert').click(function() {
			$('#frm').attr('action', 'insert.do').submit();
		});

	});
</script>



<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">


			<div id="bodywrap">


				<h1>공지사항</h1>
				<br />


				<!-- 부트 스트랩 적용한 테이블 출력 -->
				<table class="table table-border mt-1">
					<tr>
						<th class="col-md-1 text-center">번호</th>
						<th class="col-md-7 text-center">제목</th>
						<th class="col-md-2 text-center">날짜</th>
						<th class="col-md-2 text-center">조회수</th>
					</tr>

					<tr>
						<c:forEach items="${aList}" var="dto">
							<tr>
								<td class="text-center">${dto.num}</td>

								<td class="pl-2 text-left"><c:url var="path"
										value="show.do">
										<c:param name="currentPage" value="${pv.currentPage}" />
										<c:param name="num" value="${dto.num}" />
									</c:url> <!-- 들여쓰기 작업 --> <!-- 리뷰글 쓰는 코드 삭제. 코드 없음--> <a href="${path}">
										${dto.notice_title}</a></td>

								<td class="text-center">${dto.write_date}</td>
								<td class="text-center">${dto.notice_count}</td>
							</tr>
						</c:forEach>
				</table>

				<!-- 부트 스트랩 테스트 끝. 적용 완료 -->




				<ul class="pagination justify-content-center mt-5 mb-5">

					<!-- 이전 출력 시작 -->
					<c:if test="${pv.startPage > 1}">
						<li class="page=item"><a class="page-link"
							href="user.do?currentPage=${pv.startPage - pv.blockPage}"> <i
								class="fas fa-chevron-left"></i></a></li>
					</c:if>
					<!-- 이전 출력 끝 -->

					<!--  페이지 출력 시작 -->
					<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">

						<li><c:choose>
								<c:when test="${i==pv.currentPage}">
									<a class="page-link page-item active"
										href="user.do?currentPage=${i}"> ${i}</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="user.do?currentPage=${i}">${i}</a>
								</c:otherwise>
							</c:choose></li>
					</c:forEach>
					<!--  페이지 출력 끝 -->

					<!-- 다음 출력 시작 -->
					<c:if test="${pv.endPage < pv.totalPage}">
						<li>
							<!-- 스타트 페이지 =1 --> <a class="page-link"
							href="user.do?currentPage=${pv.startPage + pv.blockPage}"> <i
								class="fas fa-chevron-right"></i></a>
						</li>
					</c:if>
					<!-- 다음 출력 끝 -->
				</ul>



				<div class="text-center mt-5 mb-5">
					<form name="frm" id="frm" method="get" action="insert.do"
						align="center">

						<!-- 일반 사용자는 공지를 등록 할 수 있는 버튼이 안보이고, 관리자만 보이도록 설정-->
						<c:if
							test="${(sessionScope.authInfo != null && sessionScope.authInfo.email=='admin@email.com')}">
							<input type="button" id="insert" value="등록" />
						</c:if>

					</form>
				</div>

			</div>

		</div>
	</div>
</div>


