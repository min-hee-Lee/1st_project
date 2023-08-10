<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
	$('#update').click(function(){
		
		// 공백일때 알람띄우기
		if ($('#review_title').val().trim() !== '' && $('#review_content').val().trim() !== '') {
		    // replace new lines with <br> tags in content
		    $('[name=review_content]').val($('[name=review_content]').val().replace(/\n/gi,'<br/>'));
		    /* $('#frm').attr('action', 'update.do').submit(); */
		    $('#frm').attr('action', 'update.do').submit();
		   /*  history.go(-1); */
		  } else {
		    alert('제목과 내용을 작성해주세요.');
		  }
		});
	
	
	// 멤버 코드 추가하면 수정해야 하는 부분 
	$('#cancle').click(function(){
		alert('취소합니다.')
		// dto의 값
		$('#easyuser_name').val('${dto.easyusersDTO.easyuser_name}');
		$('#review_title').val('${dto.review_title}');
		$('#review_content').val('${dto.review_content}');
	});
	
	// 뒤로가기 버튼
	$('#back').click(function(){
		history.go(-1);
	});
	
});
</script>

<div class="container">
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
	
	<h1>리뷰</h1><br/>
		<table class="table table-bordered mt-1">
		
		<tr>
				<th>장소</th>
				<td colspan="3">${dto.info_title}</td>
			</tr>
		
			<tr>
				<th>작성자</th> <!-- 멤버 코드 수정해야 하는 부분 -->
				<td colspan="3"><input type="text" name="easyuser_name" id="easyuser_name"
					value="${dto.easyusersDTO.easyuser_name}"  readonly="readonly"/></td>				
			</tr>
			
			<tr>
			  <th >등록일</th>
			  <td>${dto.write_date}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="review_title" id="review_title" 
					value="${dto.review_title}" /></td>
			</tr>			

			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea name="review_content" id="review_content" rows="13" style="width:100%" > ${dto.review_content} </textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input type="file" name="reviewFilename" /> <span>${fn:substringAfter(dto.route_name, "_") }</span>
				</td>
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




