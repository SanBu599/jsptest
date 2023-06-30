<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="id" name="id" size="25">
					<input type="checkbox" id="idChecked" name="idChecked">
				</td>
			</tr>
			<tr>
				<th>password</th>
				<td>
					<input type="text" id="pw" name="pw" size="30">
				</td>
			</tr>
			<tr>
				<th>관리자</th>
				<td rowspan="2" align="center">
					<button type="button" onclick="loginAf.jsp">로그인</button>
					<button type="button" onclick="add_custom.jsp">회원가입</button>
				</td>
			</tr>
			<tr>
				<th><input type="checkbox" id="auth" name="auth" value="auth"></th>
				
			</tr>
		</table>
	</div>
<script type="text/javascript">

let userId = $.cookie("userId")

if(userId != null){
	$("#id").val(userId);
	$("#idChecked").prop("checked",true);
}

$("#idChecked").click(function(){
	//alert("클릭")
	//alert($("#idChecked").is(":checked"));
	
	if($("#idChecked").is(":checked")==true){
		if($("#id").val().trim()==""){
			alert("이름을 입력해주세요");
			$("#idChecked").prop("checked",false);
		}else{
			$.cookie("userId",$("#id").val().trim(), {expires:7 ,path:'./'} );
			
		}
	}else{
		 $.removeCookie("userId", { path:'./'});
	}	
})

</script>	

	
	
</body>
</html>