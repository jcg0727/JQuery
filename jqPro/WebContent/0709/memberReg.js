/**
 * 
 */


function okpro(ele){
	vs = $(ele).parents('.form-group').find('.op');
	vs.empty();
	
	
	$('<img>' , {
		'src' : '',
		'width' : '25px',
		'height' : '25px'
	}).appendTo(vs);
}





function nopro(ele, str){
   
   vs = $(ele).parents('.form-group').find('.sp')
   vs.html(str).css('color', 'red')
   
   
}