onload=function(){
	totalPrice();
}
function totalPrice(){
	document.getElementById('totalPrice').innerHTML=price;
}
let topping="";
let price=13000;
let dough=0;
let size=11000;
let cheese=2000;
let drink=0;
let toppings = 0;

function toppingPlus(){
	topping+=document.getElementsByName("product")[0].value+"/";
	document.getElementsByName("topping")[0].innerHTML=topping;
	console.log(document.getElementsByName("product")[0].value);
	price += parseInt((document.getElementById(document.getElementsByName("product")[0].value).value));
	console.log(price);
	toppings += parseInt((document.getElementById(document.getElementsByName("product")[0].value).value));
	totalPrice();
}
function resetTopping(){
	topping="";
	document.getElementsByName("topping")[0].innerHTML=topping;
	price -= toppings;
	toppings = 0;
	totalPrice();
}
// document.getElementsByName('exampleRadios').onclick=sizePrice();
function sizePrice(){
	price += document.querySelector('input[name="exampleRadios"]:checked').value - size;
	//console.log(document.querySelector('input[name="exampleRadios"]:checked').value);
	// console.log(document.getElementsByName('exampleRadios'):checked);
	size=document.querySelector('input[name="exampleRadios"]:checked').value;
	console.log(price);
	totalPrice();
}

function doughPrice(){
	price += document.querySelector('input[name="exampleRadios2"]:checked').value - dough;
	dough=document.querySelector('input[name="exampleRadios2"]:checked').value;
	console.log(price);
	totalPrice();
}
function cheesePrice(){
	price += document.querySelector('input[name="exampleRadios3"]:checked').value - cheese;
	cheese=document.querySelector('input[name="exampleRadios3"]:checked').value;
	console.log(price);
	totalPrice();
}
function beveragePrice(){
	// console.log(document.getElementsByName("beverage")[0].value)
	price += parseInt(document.getElementsByName("beverage")[0].value) - drink;
	drink = parseInt(document.getElementsByName("beverage")[0].value)
	console.log(price);
	totalPrice();
}

function orderAlert(){
	var returnValue = confirm('주문하신 정보가 맞는지 다시 확인해 주세요. 정말 이대로 주문하시겠습니까?');
	if (returnValue) {
		location.replace('successPage.jsp');
	}
	else {
		location.href('orderPage.jsp');
	}
}

