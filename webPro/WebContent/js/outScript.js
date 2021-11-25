/**
 * 
 */

function proc(){
	var now = new Date();
	var vdiv = document.getElementsByTagName('div')[0];
	str = now.toLocaleDateString() + "<br>";
	str += now.toLocaleTimeString();
	
	vdiv.innerHTML = str;
	}
	
	function change(){
		var vdiv = document.getElementsByTagName('div')[0];
		//10진수 색상표현
		var cr = parseInt(Math.random()*256);
		var cg = parseInt(Math.random()*256);
		var cb = parseInt(Math.random()*256);
		
		//16진수 색상표현
		r16 = cr.toString(16);
		g16 = cg.toString(16);
		b16 = cb.toString(16);
		//console.log(cr, cg, cb);
		//vdiv.style.background = "rgb(" + cr + "," + cg + "," + cb + ")";
		vdiv.style.background = "#" + r16 + g16 + b16 ;
	}