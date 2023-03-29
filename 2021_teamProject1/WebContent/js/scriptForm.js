//로그인 했을때만 페이지로 넘어가도록 하는 함수
function loginOK() {
	var loginVal = confirm('로그인시 이용이 가능합니다. 로그인 페이지로 이동하시겠습니까?');
	if (loginVal) {
		location.replace('loginPage.jsp');
	}
	else {
		location.replace('mainPage.jsp');
	}
}

//매장 찾기에서 선택되는 시/도에 따라 시/군/구 값이 다르게 출력되도록 하는 함수
function sidoCheck(e) {
	var sido_01 = ["시/구/군","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구"]
	var sido_02 = ["시/구/군","계양구","미추홀구","부평구"]
	var sido_03 = ["시/구/군","고양시", "광명시","구리시","남양주시","성남시","의정부시","하남시"]
	
	var target = document.getElementById("sigugun");
	
	if(e.value == "01"){
		var sigugun = sido_01;
	}else if(e.value == "02"){
		var sigugun = sido_02;
	}else if(e.value == "03"){
		var sigugun = sido_03;
	}
	
	target.options.length = 0;
	
	for (x in sigugun) {
		var opt = document.createElement("option");
		opt.value = sigugun[x];
		opt.innerHTML = sigugun[x];
		target.appendChild(opt);
	}
	

	//매장 위치 찾기에서 특정 지역을 검색했을 때 가게 정보가 나오도록 하는 스크립트
	$("#sigugun").change(function(){
		var result = $("#sigugun option:selected").index();
		console.log(result); 
		$('.default').hide();

		if(e.value == "01"){
			if(result == 1){
				$('.store').hide();
				$('.nostore').hide();
				$('#0101').show();
			}else if(result == 2){
				$('.store').hide();
				$('.nostore').hide();
				$('#0102').show();
			}else{
				$('.store').hide();
				$('.nostore').show();
			}
		}else if(e.value == "02"){
			if(result == 1){
				$('.store').hide();
				$('.nostore').hide();
				$('#0103').show();
			}else{
				$('.store').hide();
				$('.nostore').show();
			}
		}else if(e.value == "03"){
			if(result == 1){
				$('.store').hide();
				$('.nostore').hide();
				$('#0104').show();
			}else{
				$('.store').hide();
				$('.nostore').show();
			}
		}
	});   
}

//배경 깜빡이기 효과
var speed=500 

function flashit(){ 
	var flicker=document.getElementById? document.getElementById("evn") : document.all? document.all.myexample : "" 
	if (flicker){ 
		if (flicker.style.backgroundColor.indexOf("rgb(255, 165, 40)")!=-1) 
			flicker.style.backgroundColor="#FAFA96" 
		else 
			flicker.style.backgroundColor="rgb(255, 165, 40)" 


	}
} 
setInterval("flashit()", speed) 

//지점에서 상세보기 버튼을 클릭했을 때 정보를 보여주는 팝업창 띄우기
var target = document.querySelectorAll('.open_info');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn-black')
var targetID;

	// 팝업 열기
	for(var i = 0; i < target.length; i++){
	  target[i].addEventListener('click', function(){
	    targetID = this.getAttribute('href')
	    document.querySelector(targetID).style.display = 'block'
	  });
	}
	
	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
	  btnPopClose[j].addEventListener('click', function(){
	    this.parentNode.parentNode.style.display = 'none'
	  });
	}


function cmtAction(){
	document.getElementById('cmt-write').style.display = 'block'
	document.getElementById('cmt-write-btn').style.display = 'none'

}