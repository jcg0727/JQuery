<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

 $(function() {
   $('#btnCode').on('click', function() {
      vdong = $('#dong').val().trim();
      if(vdong.length < 1){
         alert("동을 입력하세요");
         return false;
      }
      
      $.ajax({
         url : '/jqPro/SearchCode',
         data : {'dong' : vdong},
         success : function(res) {
            $('#rst').html(res);
         },
         error: function(xhr) {
            alert(xhr.status);
         },
         dataType : 'html'
      })
   })
})
</script>
</head>
<body>
  <div>
    <p>찾는 동을 입력하세요</p>
   <input type="text" id="dong">
   <input type="button" value="검색" id="btnCode">
   <br><br>
   <div id="rst"></div>
  </div>
</body>
</html>