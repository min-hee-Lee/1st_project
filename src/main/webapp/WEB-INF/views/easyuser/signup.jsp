<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <div class="container">
     <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">       
        <form class="validation-form" method="post" action="signup.do" novalidate >
      
           <div class="row">              
            <div class="mb-3">
               <label for="email">이메일</label>
               <input type="text" class="form-control" name="email" 
                     pattern="[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}"
                     placeholder="예) you@example.com" required>
               <div class="invalid-feedback">
                 이메일을 형식에 맞게 입력해주세요.
               </div>
             </div>


               <div class="mb-3">
               <label for="easyuser_pass">비밀번호</label>
               <input type="password" id="pw" class="form-control" name="easyuser_pass" 
               pattern="[a-zA-Z0-9]{8,15}"  placeholder="영문,숫자 8~15자" required>
               <div class="invalid-feedback">
                 비밀번호를 형식에 맞게 입력해주세요.
               </div>
               <div class="chk"></div>
               <span id="chkPw"></span>
               </div>
             </div>  
             
             
            <div class="mb-3">
               <label for="passChk">비밀번호 확인</label>
               <input type="password" id="pwChk" class="form-control" onkeyup="isSame();"
               pattern="[a-zA-Z0-9]{8,15}" placeholder="영문,숫자 8~15자" required>
            <div class="invalid-feedback">
                 비밀번호가 일치하지 않습니다.
               </div> 
               <div class="chk"></div>
                <span id="same"></span>
               </div>
             </div>
              
             
              <div class="mb-3">
                 <label for="easyuser_name">이름</label>
                 <input type="text" class="form-control" name="easyuser_name" 
                 pattern="[가-힣]{2,7}" placeholder="예) 홍길동 " required>
                 <div class="invalid-feedback">
                   이름을 형식에 맞게 입력해주세요.(한글 2~7자)
                 </div>
               </div>  
             
             
             

               
           
    <div class="mb-3">
       
            <label for="nick_name">닉네임</label>
            <input type="text" class="form-control" name="nick_name" id='nick_name'
                 pattern="[가-힣]{2,7}" placeholder="예) 귀염둥이 " required>
            <button type="button" id="check_nickname">중복확인</button>
           <!--  <div id="nickname_feedback"></div> -->

    </div>







               <div class="mb-3">
               <label for="phone_num">휴대전화 번호</label>
               <input type="text" class="form-control" name="phone_num"  pattern="^010[0-9]{8}$" placeholder="예)01012345678" required>
               <div class="invalid-feedback">
                 휴대전화 번호를 형식에 맞게 입력해주세요.
               </div>
             </div>
             
             
                <div class="mb-3">
               <label for="birth">생년월일</label>
               <input type="text" class="form-control" name="birth"  pattern="[0-9]{8}" placeholder="예)20100806" required>
               <div class="invalid-feedback">
                 생년월일을 형식에 맞게 입력해주세요.
               </div>
             </div>
             
             
             
                 <div class="form-group">
                   <label for="sex">성별 </label>
                    <input type="radio" name="sex" value="M">남
                    <input type="radio" name="sex" value="F">여
                 </div>
             
             
             
   
             <hr class="mb-4">
             <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" id="aggrement" required>
               <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
             </div>
             <div class="mb-4">
             <input type="hidden" name="easyuser_type" value="1" />
              <button class="btn btn-dark btn-lg btn-block" type="submit">가입 완료</button>
              </div>
           </div>
           
         </form>
         </div>      
    </div>  
</div> 

  <script >   
  

  function isSame(){
      
      var pw = document.getElementById("pw").value;
      var confirmPw = document.getElementById("pwChk").value;

      if(pw != "" && confirmPw != ""){
          
          if(pw == confirmPw){
              document.getElementById("same").innerHTML = '패스워드 일치';
              document.getElementById("same").style.color = 'blue';
              PW_SAME = true;
          } else {
              document.getElementById("same").innerHTML = '패스워드 불일치';
              document.getElementById("same").style.color = 'red';
              PW_SAME = false;
          }

      } else {
          document.getElementById("same").innerHTML = '';
      }

  }
  
  
  
  $(document).ready(function(){ 
  $('#check_nickname').click(function() {
      var nick_name = $('#nick_name').val();
      console.log(nick_name);
      $.ajax({
          type: "GET",
          url: "../easyuser/checkNickname.do",  
          data: {'nick_name': nick_name},
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          success: function(res) {
             if(res.chk=="1"){                
               alert(nick_name +"(은)는 이미 존재하는 닉네임입니다.");
               $('#nick_name').val('');
             }else{
                alert(nick_name +"(은)는 사용 가능한 닉네임입니다.");
             }
          },
          error: function(xhr, status, error) {
              alert("An error occurred: " + status + " " + error);
              return;
          }
      });
  });
  
  });
  
  
  
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
 