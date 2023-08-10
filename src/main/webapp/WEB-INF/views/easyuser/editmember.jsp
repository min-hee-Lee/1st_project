<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <div class="container">
     <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">       
        <form class="validation-form" method="post" action="editmember.do" novalidate >
      
           <div class="row">              
	         <div class="mb-3">
	            <label for="email">이메일</label>
	            <input type="text" class="form-control" name="email" 
	            		pattern="[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}"
	            		value="${easyusersDTO.email}" required readonly="readonly">
	            <div class="invalid-feedback">
	              이메일을 형식에 맞게 입력해주세요.
	            </div>
	          </div>
	          
	          <div class="mb-3">
	            <label for="pass">비밀번호</label>
	            <a class="nav-link" href="${pageContext.request.contextPath}/easyuser/changepass.do"><input type="button" value="비밀번호 변경"></a>
	            <input type="password"  class="form-control" name="easyuser_pass" 
	            pattern="[a-zA-Z0-9]{8,15}"  placeholder="영문,숫자 8~15자" required>
	            <div class="invalid-feedback">
	              비밀번호를 형식에 맞게 입력해주세요.
	            </div>
	          </div>  
	          
	          
	          
	           <div class="mb-3">
	              <label for="name">이름</label>
	              <input type="text" class="form-control" name="easyuser_name"
	              pattern="[가-힣]{2,7}" value="${easyusersDTO.easyuser_name}" >
	              <div class="invalid-feedback">
	                이름을 형식에 맞게 입력해주세요.(한글 2~7자)
	              </div>
	            </div>           
	            
	           <div class="mb-3">
	              <label for="nick_name">닉네임</label>
	              <input type="text" class="form-control" name="nick_name"
	              pattern="[가-힣]{2,7}" value="${easyusersDTO.nick_name}" >
	              <div class="invalid-feedback">
	                닉네임을 형식에 맞게 입력해주세요.(한글 2~7자)
	              </div>
	            </div>    
	          
	                
	          <div class="mb-3">
	            <label for="phone_num">휴대전화 번호</label>
	            <input type="text" class="form-control" name="phone_num"  pattern="^010[0-9]{8}$" value="${easyusersDTO.phone_num}" required>
	            <div class="invalid-feedback">
	              휴대전화 번호를 형식에 맞게 입력해주세요.
	            </div>
	          </div>
	          
	          
	          <div class="mb-4 text-center"> 
	            <input type="hidden" name="easyuser_type" value="1" />
	            <button class="btn btn-dark btn-lg btn-block" type="submit">회원 수정</button>
	          </div>
	        </div>
	        
	      </form>
	      </div>	   
    </div>  
</div> 

  <script >   
  
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
   
  </script>