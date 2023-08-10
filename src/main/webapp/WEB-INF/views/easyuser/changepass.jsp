<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="container mb-5">			
						
		<h4 class="text-center">Change Password</h4>	
		
			<form name="login" method="post"  action="changepass.do" >
				<div class="form-group">
				    <label class="fw-bolder">현재 비밀번호: </label>
					<input type="password" class="form-control" name="currentPassword" placeholder="현재 비밀번호를 입력하세요" required="required">		
				</div>
				<div class="form-group mt-3">
				 <label class="fw-bolder">새 비밀번호: </label>
					<!-- <input type="password" class="form-control" name="newPassword" placeholder="newPassword" required="required">  -->					
				<input type="password"  class="form-control" name="newPassword" 
	            pattern="[a-zA-Z0-9]{8,15}"  placeholder="영문,숫자 8~15자" required>
	            <div class="invalid-feedback">
	              비밀번호를 형식에 맞게 입력해주세요.
	            </div>	
				</div>   				
				
				     
				<div class="form-group text-center mt-5">
 					<button type="submit" class="btn btn-dark btn-lg btn-block login-btn" >비밀번호 변경</button>
				</div>
			</form>
  </div>
     
    