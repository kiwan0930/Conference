<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('form').submit(function() {
			
			var confname = $.trim($('#confname').val());
			if (confname === '') {
				alert('confname is empty.');
				$("#confname").focus();
				return false;
			}
				
			
			var nameArr = new Array();

			<c:forEach var="item" items="${list}">
				nameArr.push("${item.raspberrypimac}");
			</c:forEach>

			
			var confmacaddr = $.trim($('#confmacaddr').val());
			for (var i = 0; i < nameArr.length; i++) {
				if (confmacaddr == nameArr[i]) {
					alert("同じマックの会議室がありますので、ほかの名をつけてください。");
					$("#confmacaddr").focus();
					return false;
				}
			}

			if (confmacaddr === '') {
				alert('confmacaddr is empty.');
				$("#confmacaddr").focus();
				return false;
			}
			
	
			
			var confhostname = $.trim($('#confhostname').val());
			if (confhostname === '') {
				alert('confhostname is empty.');
				$("#confhostname").focus();
				return false;
			}
			
			
			var confipaddress = $.trim($('#confipaddress').val());
			if (confipaddress === '') {
				alert('confipaddress is empty.');
				$("#confipaddress").focus();
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
	<form action="confAdd" method="post" name="form">
		<div style="text-align: right">

			<table class="board_view">
				<caption>
					<font size="5"> <b> 受信機追加 </b>
					</font>
				</caption>
				<tbody>
					<tr>
						<th scope="row">受信機名</th>
						<td><input type="text" id="confname" name="confname" style="width: 100%;"></td>
					</tr>
					<tr>

						<th scope="row">受信機Macアドレス</th>
						<td><input type="text" id="confmacaddr" name="confmacaddr" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<th scope="row">受信機ホスト名</th>
						<td><input type="text" id="confhostname" name="confhostname" style="width: 100%;"></td>
					</tr>
					
					
					<tr>
						<th scope="row">受信機IPアドレス</th>
						<td><input type="text" id="confipaddress" name="confipaddress" style="width: 100%;"></td>
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
