<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 페이지가 이동되는 코드?, 스크립트를 이용한다. jquery 라이브러리 등록 필요. -->

<!-- 버튼 눌렀을 때  list.do로 이동 -->
<script>
	$(document).ready(
			function() {
				$('#btnList').click(function() {
					$('#frm').attr('action', 'list.do'); // 리스트 누르면 list.do로 이동
					$('#frm').submit();
				});

				// 넘겨줄때 줄이 바뀌어서 넘어가면 풀어줄때 줄바꿈을 해서 풀어야하는데 이게 문제가 된다.
				// 저장을 할 때 줄을 바꿔서 입력을 하고~
				$('#btnSave').click(
						function() {
							
							// 공백이면 알람 띄우기
							var reviewTitle = $('[name=review_title]').val().trim();
							var reviewContent = $('[name=review_content]').val().trim();
							if (!reviewTitle || !reviewContent) {alert('제목과 내용을 작성해주세요.');
								return;
							}

							// 엔터값을 br로 바꿔서 보내준다.
							// 리뷰_카운트로 이름을 바꿔야 하나.. 일단 의심을 해보기 리뷰 카운트로 하면 버튼이 안눌림
							$('[name=review_content]').val(
									$('[name=review_content]').val().replace(
											/\n/gi, '<br/>'));
							$('#frm').attr('action', 'write.do').submit();

						});

				// 첨부파일이 1gb 이상이면 알람창 띄우기
				$('#filepath').change(function() {
					console.log(this.files[0].size);
					if (this.files[0].size > 1000000000) { // 사이즈 숫자를 바꾸면 제한 용량이 바뀜. (동그라미 9개)
						alert('1GB 이하만 첨부할수 있습니다.');
						$('#filepath').val('');
						return false;
					}
				});
			});
</script>


<div class="container">
	<!-- 첨부파일이 있는 글쓰기면 반드시 post타입이랑 multipart/form-data 형식이여야 한다. -->
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">




		<%
		String info_title = request.getParameter("info_title");
		%>
		
		
		<h1>리뷰 쓰기</h1><br/><br/>
		<table class="table  table-bordere mt-1">



			<tr>
			<td width="20%" align="center">장소</td>
			<td><input type="hidden" name="info_title" value="<%=info_title%>" /> 
				<%=info_title%></td>
			</tr>

			<tr>
				<td width="20%" align="center">작성자</td>
				<td><input type="hidden" name="email" value="${sessionScope.authInfo.email}" /> 
				<input type="text" name="easyuser_name" size="30" maxlength="30" readonly="readonly"
					value="${sessionScope.authInfo.easyuser_name}" /> 	
			</tr>

			<!-- ref가 제목글이면 0, 제목글이 아니면 0이 아닌 값으로 넘어온다. -->
			<tr>
				<td width="20%" align="center">제목</td>
				<td><input type="text" name="review_title" size="40" /></td>
			</tr>

			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea name="review_content" rows="13"
						style="width: 100%"></textarea></td>
			</tr>

			<tr>
				<td width="20%" align="center">첨부파일</td>
				<td><input type="file" name="reviewFilename" id="filepath" />
			</tr>
		</table>

		<div class="text-center mt-5 mb-5">
			<input type="button" id="btnList" value="리스트" /> <input
				type="button" id="btnSave" value="저장" />
		</div>
	</form>
</div>


