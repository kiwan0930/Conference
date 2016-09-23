<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('form').submit(function() {
			
			var name = $.trim($('#name').val());
			if (name === '') {
				alert('name is empty.');
				$("#name").focus();
				return false;
			}
				
			
			var nameArr = new Array();

			<c:forEach var="item" items="${list}">
				nameArr.push("${item.beaconmac}");
			</c:forEach>

			
			var macaddr = $.trim($('#macaddr').val());
			for (var i = 0; i < nameArr.length; i++) {
				if (macaddr == nameArr[i]) {
					alert("同じマックの鍵がありますので、ほかのマックをつけてください。");
					$("#macaddr").focus();
					return false;
				}
			}

			if (macaddr === '') {
				alert('macaddr is empty.');
				$("#macaddr").focus();
				return false;
			}
			
	
			
			var uuid = $.trim($('#uuid').val());
			if (uuid === '') {
				alert('uuid is empty.');
				$("#uuid").focus();
				return false;
			}
			
			
			var major = $.trim($('#major').val());
			if (major === '') {
				alert('major is empty.');
				$("#major").focus();
				return false;
			}
			
			var minor = $.trim($('#minor').val());
			if (minor === '') {
				alert('minor is empty.');
				$("#minor").focus();
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
	<form action="keyAdd" method="post" name="form">
		<div style="text-align: right">

			<table class="board_view">
				<caption>
					<font size="5"> <b> ビーコン鍵追加 </b>
					</font>
				</caption>
				<tbody>
					<tr>
						<th scope="row">ビーコン名</th>
						<td><input type="text" id="name" name="name" style="width: 100%;"></td>
					</tr>
					<tr>

						<th scope="row">ビーコンMacアドレス</th>
						<td><input type="text" id="macaddr" name="macaddr" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<th scope="row">ビーコンUUID</th>
						<td><input type="text" id="uuid" name="uuid" style="width: 100%;"></td>
					</tr>
					
					
					<tr>
						<th scope="row">ビーコンMajor</th>
						<td><input type="number" id="major" name="major" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<th scope="row">ビーコンMinor</th>
						<td><input type="number" id="minor" name="minor" style="width: 100%;"></td>
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
