function loginOK() {
	var loginVal = confirm('로그인을 하셔야 이용이 가능합니다. 로그인 페이지로 가시겠습니까?');
	if (loginVal) {
		location.replace('loginForm.jsp');
	}
	else {
		location.replace('mainPage.jsp');
	}
}