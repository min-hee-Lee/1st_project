<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
	$('#update').click(function(){
		
		 var title = $('[name=notice_title]').val();
		    var content = $('[name=notice_content]').val();
		    
		    if (title.trim() === '' || content.trim() === '') {
		      alert('제목과 내용을 작성해주세요.');
		      return;
		    }
		    
		$('[name=notice_content]').val($('[name=notice_content]').val().replace(/\n/gi,'<br/>'));
		$('#frm').attr('action', 'update.do').submit();
	});
	
	
 	$('#cancle').click(function(){
		alert('취소합니다.')
		// dto의 값
		$('#notice_title').val('${dto.notice_title}');
		$('#notice_content').val('${dto.notice_content}');
	});
	 
	 
	// 뒤로가기 버튼
	$('#back').click(function(){
		history.go(-1);
	});
	
});
</script>

<div class="container">
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table class="table table-bordered mt-1">
			
			<tr>
				<th>작성자</th>
				<td colspan="3">
				<input type="text" name="easyuser_name" id="easyuser_name"
					value="관리자"  readonly="readonly"/></td>	 			
			</tr>
			
			<tr>
			  <th >등록일</th>
			  <td>${dto.write_date}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="notice_title" id="notice_title" 
					value="${dto.notice_title}" /></td>
			</tr>			

			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea name="notice_content" id="notice_content" rows="13" style="width:100%" > ${dto.notice_content} </textarea></td>
			</tr>

		</table>
		<div class="text-center mt-5 mb-5">
			<input type="hidden" name="num" value="${dto.num}" /> 
			<input type="hidden" name="currentPage" value="${currentPage}" /> 
			<input type="button" id="update" value="수정" /> 
			<input type="button" id="cancle" value="취소" /> 
			<input type="button" id="back" value="뒤로" />
		</div>	
	</form> 
 </div>




