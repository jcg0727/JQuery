/**
 * 
 */

//리터럴 배열 생성
function proc1(){
	fruit = ['apple', 'banana' , 'peach' , 'grape'];
	
	str = "";
	for(i=0; i<fruit.length;i++){
		str += fruit[i] + " ";
	}
	document.getElementById('rst1').innerHTML = str;
}

//생성자 배열 생성
function proc2(){
	fruit = new Array();
	fruit[0] = '자두';
	fruit[1] = '사과';
	fruit[2] = '딸기';
	
	/*str = "";
	for(i=0; i<fruit.length;i++){
		str += fruit[i] + " ";
	}
	document.getElementById('rst2').innerHTML = str;*/
	print('rst2')
}

//생성자 배열 생성1
function proc3(){
    fruit = new Array("참외", "오렌지", "바나나", "딸기");
	/*str = "";
	for(i=0; i<fruit.length;i++){
		str += fruit[i] + " ";
	}
	document.getElementById('rst3').innerHTML = str;*/
	print('rst3')
}


function print(rst){
	str = "";
	for(i=0; i<fruit.length;i++){
		str += fruit[i] + " ";
	}
	document.getElementById(rst).innerHTML = str;
}