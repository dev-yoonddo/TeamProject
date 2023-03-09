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
//일정 시간마다 색상 랜덤하게 바꾸기

var colorlist = ["#505050","#828282","#3C3C8C","#3B3051"];
var cnt = 0;

document.getELementBYId("content").onload=function randomColor(){
	if(cnt == 3) cnt=0;
	content.style.color = colorlist[cnt++];
	setTimeout("randomColor()", 500);
}
