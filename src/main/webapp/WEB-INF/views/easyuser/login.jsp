<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
 <script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>
 <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css' />
 
<script>
  $(document).ready(function(){
	  let returnUrl = "${param.returnUrl}";
	  if(returnUrl != "")
		  alert(returnUrl + "요청한 페이지는 회원에게만 제공됩니다."); 
	  
	  
  });
  
  
</script>
 
     <div class="container mb-5">			
		<div class="avatar">
			<!-- <img src="../resources/images/avatar.png" alt="Avatar"> -->
			<i class="fa-solid fa-user-pen fa-3x"></i> <!-- font awesome에서 복사 -->
		</div>				
		<h4 class="text-center">Member Login</h4>	
		
			<form name="login" method="post"  action="login.do" >
				<div class="form-group">
					<input type="text" class="form-control" name="email" placeholder="Email"  id= "email" required="required">		
				</div>
				<div class="form-group mt-3">
					<input type="password" class="form-control" name="easyuser_pass" placeholder="Password" required="required">	
				</div>   
				
				     
				<div class="form-group text-center mt-5">
				    <!-- <input type="text" name="returnUrl" value="${param.returnUrl}" />  -->
 					<button type="submit" class="btn btn-dark btn-lg btn-block login-btn" >Login</button>
				</div>
			</form>
  </div>
     
  