<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<script>
	$(document).ready(function() {
		$('#list').click(function() {
			$('#frm').attr('action', 'user.do').submit();
		});
		
		 $('#update').click(function(){
			$('#frm').attr('action', 'update.do').submit(); 
		});
		
		$('#delete').click(function(){
			$('#frm').attr('action', 'delete.do').submit(); 
		});
 

	});
</script>




<div class="container">

	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">


			<div id="bodywrap">
				<h1>공지사항</h1><br/>
				<table class="table  table-bordered">

					<tr>
						<th width="20%">작성일</th>
						<td>${dto.write_date}</td>

						<th width="20%">조회수</th>
						<td>${dto.notice_count}</td>
					</tr>

					<tr>
						<td>작성자</td>
						<td colspan="3">관리자</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">${dto.notice_title}</td>
					</tr>


					<tr>
						<td>내용</td>
						<td colspan="3">${dto.notice_content}</td>
					</tr>
				</table>

				<div class="text-center mt-5 mb-5">
					<form name="frm" id="frm" method="get">
					
					<!-- 수정, 삭제 히든 값 추가 -->
					<!-- 아래 주석 해제하면 삭제 부분도 안되고 리스트랑 수정도 오류가 발생됨.-->
						 <input type="hidden" name="num" value="${dto.num}" /> 
						<input type="hidden" name="currentPage" id="currentPage" value="${param.currentPage}" /> 
					

						<input type="button" id="list" value="리스트" />
						
						<!-- 관리자일때 아래 버튼이 보이도록 설정하기 -->
						<c:if test="${(sessionScope.authInfo != null && sessionScope.authInfo.email=='admin@email.com')}">
						<input type="button" id="update" value="수정" /> 
						<input type="button" id="delete" value="삭제" /> 
						</c:if>

					</form>
				</div>


			</div>
		</div>
	</div>
</div>