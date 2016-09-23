<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"	href="<c:url value='/css/ui.css'/>" />
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#back').click(function(e) {
			window.close();
		});

	});
</script>

<html>
<body>
	<form action="keyMapAdd" method="post" name="form">
		<div style="text-align: right">

			<table class="board_view">
				<caption>
					<font size="5"> <b> キーマッチ追加</b>
					</font>
				</caption>
				<tbody>
					<tr>
						<th scope="row">受信機Macアドレス</th>
						<td>
							<select id="raspberrypimac" name="raspberrypimac"  style="width: 100%;">
								<c:forEach items="${confList}" var="dto"> <option value="${dto.raspberrypimac}">${dto.raspberrypimac}   ( ${dto.name} ) </option></c:forEach>
							</select> 
						</td>
					</tr>
					
					<tr>
						<th scope="row">ビーコンMacアドレス</th>
						<td>
							<select id="beaconmac" name="beaconmac"  style="width: 100%;">
								<c:forEach items="${keyList}" var="dto"> <option value="${dto.beaconmac}">${dto.beaconmac} ( ${dto.name} ) </option></c:forEach>
							</select> 
						</td>
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
