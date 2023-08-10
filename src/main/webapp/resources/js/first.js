//좌우슬라이딩
setInterval(function () {
  let tg = document.querySelector("#slide1>ul");
  tg.style.top = "-100%";
  tg.style.transition = "0.6s";

  setTimeout(function () {
    let first = tg.querySelectorAll("li")[0];
    tg.appendChild(first);
    tg.style.top = "0";
    tg.style.transition = "none";
  }, 600);
}, 3000);

// 내 취향 여행보기 누르면 위에서 고른 info_theme에 맞는 정보들이 나온다.
$('.btn_black').click(function() {
  setTimeout(function() {
    $('#frm').attr('action', 'home.do').submit();
  }, 1000); // 1초 지연
});

// 다른 취향 보기 누르면 드롭다운의 선택들이 랜덤으로 선택되어 정보들이 나온다.
$('.btn_reload').click(function(event) {
  event.preventDefault(); // form의 submit 이벤트 막기
  
  const frm = document.querySelector('#frm');
  const selectElements = frm.querySelectorAll('select');
  selectElements.forEach((selectElement) => {
    const options = selectElement.options;
    const randomOptionIndex = Math.floor(Math.random() * options.length);
    options[randomOptionIndex].selected = true;
  });
  
  // 선택된 값을 가져와서 처리
  const infoType = frm.info_type.value;
  const infoTheme = frm.info_theme.value;
  console.log(`선택된 info_type: ${infoType}, 선택된 info_theme: ${infoTheme}`);

  setTimeout(function() {
    $('#frm').attr('action', 'home.do').submit();
  }, 1000); // 1초(1000밀리초) 대기 후 submit 실행
});


let currentIdx = 0;
let next_btn = document.querySelector('#slide_btn > #next');
let prev_btn = document.querySelector('#slide_btn > #prev');
let gallery_teel = document.querySelector('#gallery_teel');
let gallery_items = document.querySelectorAll('.gallery_item');
let slideCount = gallery_items.length;

function moveSlide(num){
  gallery_teel.style.marginLeft = -num * 350 + 'px';
  currentIdx = num;
}

// next(<) 버튼을 누르면 한 사진씩 이동된다.
next_btn.addEventListener('click', function(){
  if(currentIdx < slideCount -3){
   moveSlide(currentIdx + 1);
   //console.log(currentIdx);
   }else{
   moveSlide(0);  // 마지막 사진이면 다시 첫번째사진으로 돌아간다.
   }
});

// prev(>) 버튼을 누르면 한 사진씩 반대로 이동된다.
prev_btn.addEventListener('click', function(){
  if(currentIdx > 0){
    moveSlide(currentIdx - 1);
  }else{
    moveSlide(slideCount - 3); 
   }
});