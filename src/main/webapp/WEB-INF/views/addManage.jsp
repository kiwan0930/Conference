<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('form').submit(function() {
			
			var managename = $.trim($('#managename').val());
			if (managename === '') {
				alert('managename is empty.');
				$("#managename").focus();
				return false;
			}
				
			
			var nameArr = new Array();

			<c:forEach var="item" items="${list}">
				nameArr.push("${item.raspberrypimac}");
			</c:forEach>

			
			var managemacaddr = $.trim($('#managemacaddr').val());
			for (var i = 0; i < nameArr.length; i++) {
				if (managemacaddr == nameArr[i]) {
					alert("同じマックの会議室がありますので、ほかの名をつけてください。");
					$("#managemacaddr").focus();
					return false;
				}
			}

			if (managemacaddr === '') {
				alert('managemacaddr is empty.');
				$("#managemacaddr").focus();
				return false;
			}
			
	
			
			var managehostname = $.trim($('#managehostname').val());
			if (managehostname === '') {
				alert('managehostname is empty.');
				$("#managehostname").focus();
				return false;
			}
			
			
			var manageipaddress = $.trim($('#manageipaddress').val());
			if (manageipaddress === '') {
				alert('manageipaddress is empty.');
				$("#manageipaddress").focus();
				return false;
			}

		});

		$('#back').click(function(e) {
			window.close();
		});

	});
</script>

<html>
<body>
	<form action="manageAdd" method="post" name="form">
		<div style="text-align: right">

			<table class="board_view">
				<caption>
					<font size="5"> <b> 鍵管理機追加 </b>
					</font>
				</caption>
				<tbody>
					<tr>
						<th scope="row">鍵管理機名</th>
						<td><input type="text" id="managename" name="managename" style="width: 100%;"></td>
					</tr>
					<tr>

						<th scope="row">鍵管理機Macアドレス</th>
						<td><input type="text" id="managemacaddr" name="managemacaddr" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<th scope="row">鍵管理機ホスト名</th>
						<td><input type="text" id="managehostname" name="managehostname" style="width: 100%;"></td>
					</tr>
					
					
					<tr>
						<th scope="row">鍵管理機IPアドレス</th>
						<td><input type="text" id="manageipaddress" name="manageipaddress" style="width: 100%;"></td>
					</tr>
					
				</tbody>
			</table>
			
			<br>
			<br>
			<input type="submit" id="sub" value="追加 " class="btn">
			<input type="button" class="btn" onclick="self.close()" value="キャンセル"> 
			

		</div>
	</form>
</body>
</html>
