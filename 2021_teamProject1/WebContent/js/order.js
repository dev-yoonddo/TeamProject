onload=function(){
	totalPrice();
}

//선택된 값들의 총 합계
function totalPrice(){
	document.getElementById('totalPrice').innerHTML=price;
}

// 각 옵션의 기본값을 정하고 모두 더한 값을 price의 기본값으로 입력한다.
let topping="";
let price=13000;
let dough=0;
let size=11000;
let cheese=2000;
let drink=0;
let toppings = 0;

//추가 버튼을 눌렀을 때 선택한 토핑을 출력하고 price에 value값(가격)을 더한다.
function plusTopping(){
	topping+=document.getElementsByName("topping")[0].value+", ";
	document.getElementsByName("select-topping")[0].innerHTML=topping;
	console.log(document.getElementsByName("topping")[0].value);
	price += parseInt((document.getElementById(document.getElementsByName("topping")[0].value).value));
	console.log(price);
	toppings += parseInt((document.getElementById(document.getElementsByName("topping")[0].value).value));
	totalPrice();
}
//초기화 버튼을 눌렀을 때 선택한 토핑을 모두 지우고 price에서도 뺀다.
function resetTopping(){
	topping="";
	document.getElementsByName("select-topping")[0].innerHTML=topping;
	price -= toppings;
	toppings = 0;
	console.log(price);
	totalPrice();
}
// 선택된 size 옵션의 value값에서 size의 기본값을 뺀 값을 price에 더한다. 
function sizePrice(){
	price += document.querySelector('input[name="exampleRadios"]:checked').value - size;
	//console.log(document.querySelector('input[name="exampleRadios"]:checked').value);
	// console.log(document.getElementsByName('exampleRadios'):checked);
	size=document.querySelector('input[name="exampleRadios"]:checked').value;
	console.log(price);
	totalPrice();
}
//선택된 dough 옵션의 value값에서 dough의 기본값을 뺀 값을 price에 더한다.
function doughPrice(){
	price += document.querySelector('input[name="exampleRadios2"]:checked').value - dough;
	dough=document.querySelector('input[name="exampleRadios2"]:checked').value;
	console.log(price);
	totalPrice();
}
//선택된 cheese 옵션의 value값에서 cheese의 기본값을 뺀 값을 price에 더한다.
function cheesePrice(){
	price += document.querySelector('input[name="exampleRadios3"]:checked').value - cheese;
	cheese=document.querySelector('input[name="exampleRadios3"]:checked').value;
	console.log(price);
	totalPrice();
}
//선택된 drink 옵션의 value값에서 drink의 기본값을 뺀 값을 price에 더한다.
function beveragePrice(){
	price += parseInt(document.getElementsByName("beverage")[0].value) - drink;
	drink = parseInt(document.getElementsByName("beverage")[0].value)
	console.log(price);
	totalPrice();
}

//주문하기 버튼을 누르면 뜨는 알림창
function orderAlert(){
	var returnValue = confirm('주문하신 정보가 맞는지 다시 확인해 주세요. 정말 이대로 주문하시겠습니까?');
	if (returnValue) {
		location.replace('successPage.jsp');
	}
	else {
		location.href('orderPage.jsp');
	}
}

//스크롤 움직임에 따라 이미지도 같이 움직이기
//console.log(window.scrollY);
$(window).scroll(function() { 
	var position = $(window).scrollTop();
	if($(this).scrollTop() > 550) {	
	$(".pizzaimage").stop().animate({"top":(position-560)+"px"},1000); 
	}
	
});
