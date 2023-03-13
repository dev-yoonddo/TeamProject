//로그인 했을때만 페이지로 넘어가도록 하는 함수
function loginOK() {
	var loginVal = confirm('로그인시 이용이 가능합니다. 로그인 페이지로 이동하시겠습니까?');
	if (loginVal) {
		location.replace('loginForm.jsp');
	}
	else {
		location.replace('mainPage.jsp');
	}
}
