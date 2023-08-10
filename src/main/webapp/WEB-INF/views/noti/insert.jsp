<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<script>
	$(document).ready(
			function() {
				$('#btnList').click(function() {
					$('#frm').attr('action', 'user.do'); // 리스트 누르면 list.do로 이동
					$('#frm').submit();
				});

				
				$('#btnSave').click(function() {
					  var title = $('[name=notice_title]').val();
			            var content = $('[name=notice_content]').val();

			            if (title.trim() === '' || content.trim() === '') {
			                alert('제목과 내용을 작성해주세요.');
			                return false; // stop form submission
			            }
							$('[name=notice_content]').val(
									$('[name=notice_content]').val().replace(
											/\n/gi, '<br/>'));
							$('#frm').attr('action', 'insert.do').submit();

						});
			});
</script>


<div class="container">
	<!-- 첨부파일이 있는 글쓰기면 반드시 post타입이랑 multipart/form-data 형식이여야 한다. -->
	<form name="frm" id="frm" method="post">

		<table class="table  table-bordere mt-1">


			<tr>
				<td width="20%" align="center">제목</td>
				<td><input type="text" name="notice_title" size="40" /></td>
			</tr>

			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea name="notice_content" rows="13"
						style="width: 100%"></textarea></td>
			</tr>

		</table>
		

		<div class="text-center mt-5 mb-5">
			<input type="button" id="btnList" value="리스트" /> <input
				type="button" id="btnSave" value="저장" />
		</div>
	</form>
</div>


