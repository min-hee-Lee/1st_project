<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


   <div class="text-center mt-5 mb-5">
		<form name="frm" id="frm" method="get">
			<input type="hidden" name="num" value="${dto.num}" /> 
			<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" /> 
			<c:if test="${dto.ref !=0 }">
				<input type="hidden" name="ref" value="${dto.ref}" /> 
				<input type="hidden" name="re_step" value="${dto.re_step}" /> 
				<input type="hidden" name="re_level" value="${dto.re_level}" /> 
			</c:if>
			
			
		</form>
	</div>


    