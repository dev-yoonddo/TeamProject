//로그인 했을때만 주문하기 페이지로 넘어가도록 하는 함수
function LoginOK() {
	var loginVal = confirm('로그인을 하셔야 이용이 가능합니다. 로그인 페이지로 가시겠습니까?');
	if (loginVal) {
		location.replace('loginForm.jsp');
	}
	else {
		location.replace('mainPage.jsp');
	}
}

//메인페이지 스크롤시 카테고리 영역은 고정되도록 하는 함수
function ScrollFix() {
	  $(document).ready(function(){
		   $(window).bind('scroll', function() {
		   var navHeight = $( window ).height() - 70;
				 if ($(window).scrollTop() > navHeight) {
					 $('.category').addClass('fixed');
				 }
				 else {
					 $('.category').removeClass('fixed');
				 }
			});
		});

}
