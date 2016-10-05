<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>



<html>
<head>
<title>Login Page</title>



</head> 
<body onload='document.loginForm.username.focus();' bgcolor="#eeeeee" style="overflow:hidden;"> 

	<div id="login-box" align="center">
	
		 <img style=" border-radius: 50%; width: 170px" src="<c:url value='/img/admin.png' />" />
	
		<br>	<br>

		<c:if test="${not empty error}">
			<div style="font-family:verdana;" class="error">${error} </div>
		</c:if>
		<c:if test="${not empty msg}">
			<div style="font-family:verdana;" class="msg">${msg}</div>
		</c:if>

		
		<form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>

		<table> 
		     <tr>
				<td><div> ID : </div></td>
				<td><input type='text' name='username'  style=" width:220px; height: 30; float: right;"></td>
			</tr>
			 <tr>
			 	<td><div>PassWord : </div></td>
				<td><input type='password' name='password' style=" width:220px; height: 30; float: right;"  /></td>
			</tr>
	
		</table>
		<br>
		
	<input style="float:left; font-size:14pt;height:32; border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#111111; border:3px solid #000000;vertical-align:middle" name="submit" class="btn" type="submit" value="LogIn" />
	
	<input style="float:right; font-size:14pt;height:34; border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#111111; border:3px solid #000000;vertical-align:middle"  type="reset"  value="RESET">

	
		</form>
	</div>

</body>
</html>