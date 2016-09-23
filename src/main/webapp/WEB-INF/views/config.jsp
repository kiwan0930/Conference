<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('form').submit(function() {
			
			var confrssi = $.trim($('#confrssi').val());
	
			if (confrssi === '') {
				alert('confrssi is empty.');
				$("#confrssi").focus();
				return false;
			}
			
			var managerssi = $.trim($('#managerssi').val());
			if (managerssi === '') {
				alert('managerssi is empty.');
				$("#managerssi").focus();
				return false;
			}
			
			
			var rasp_id = $.trim($('#rasp_id').val());
			if (rasp_id === '') {
				alert('rasp_id is empty.');
				$("#rasp_id").focus();
				return false;
			}
			
			var rasp_pass = $.trim($('#rasp_pass').val());
			if (rasp_pass === '') {
				alert('rasp_pass is empty.');
				$("#rasp_pass").focus();
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
	<form action="setConfigVal" method="post" name="form">
		<div style="text-align: right">

			<table class="board_view">
				<caption>
					<font size="5"> <b> 環境設定 </b>
					</font>
				</caption>
				<tbody>
					<tr>
						<th scope="row">raspberryInfoRSSI</th>
						<td><input type="number" id="confrssi" name ="confrssi"  value="${configVal[0].confrssi}" style="width: 100%;"></td>
					</tr>
					<tr>

						<th scope="row">ManageRSSI</th>
						<td><input type="number" id="managerssi" name ="managerssi" value="${configVal[0].managerssi}" style="width: 100%;"></td>
					</tr>
					
					<tr>
						<th scope="row">rasp_id</th>
						<td><input type="text" id="rasp_id" name ="rasp_id" value="${configVal[0].rasp_id}" style="width: 100%;"></td>
					</tr>
					
					
					<tr>
						<th scope="row">rasp_pass</th>
						<td><input type="text" id="rasp_pass" name ="rasp_pass" value="${configVal[0].rasp_pass}" style="width: 100%;"></td>
					</tr>
					
				</tbody>
			</table>
			
			<br>
			<br>
			<input type="submit" id="sub" value="修正 " class="btn">
			<input type="button" class="btn" onclick="self.close()" value="キャンセル"> 
			

		</div>
	</form>
</body>
</html>
