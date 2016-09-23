<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/logout.jspf"%>
<!-- <meta http-equiv="refresh" content ="5"> -->


<script>
	$(document)
			.ready(
					function() {
						var table = $('#confTable')
								.DataTable(
										{
											"language" : {
												"url" : "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
											},
											"autoWidth" : false,
											"paging" : false,

											"columnDefs" : [ {
												"targets" : [ 0 ],
												"visible" : false
											} ],

											"orderClasses" : false,
											"deferRender" : true,
											"Processing" : true

										});

						$('input.toggle-vis').on(
								'click',
								function(e) {
									e.preventDefault();
									var column = table.column($(this).attr(
											'data-column'));
									column.visible(!column.visible());
								});

						$('#keyTable')
								.DataTable(
										{
											"language" : {
												"url" : "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
											},
											"autoWidth" : false,
											"info" : false,
											"ordering" : false,
											"searching" : false,
											"paging" : false,
											"orderClasses" : false,
											"deferRender" : true,
											"Processing" : true

										});

						$('#shutdown')
								.click(
										function() {
											if (confirm("全受信機をシャットダウンさせますか?") == true) {
												window.location = "<c:url value='/allShutdown'/>";
											}
										});

						$('#reboot')
								.click(
										function() {
											if (confirm("全受信機を再起動させますか") == true) {
												window.location = "<c:url value='/allReboot'/>";
											}
										});
						$('#log').click(function() {
							window.location = "<c:url value='/logList'/>";
						});

						$('#clear').click(function() {
							if (confirm("全データを削除しますか?", "asdf") == true) {
								window.location = "<c:url value='/clear'/>";
							}
						});
						
						$('#showmenu').click(function() {
						    var hidden = $('.sidebarmenu').data('hidden');
						    $('#showmenu').text(hidden ? 'Hide Menu' : 'Show Menu');
						    if(hidden){
						        $('.sidebarmenu').animate({
						            left: '0px'
						        },500)
						    } else {
						        $('.sidebarmenu').animate({
						            left: '-200px'
						        },500)
						    }
						    $('.sidebarmenu,.image').data("hidden", !hidden);

						    });
				
					});
</script>

<html>
<body>

	<%@ include file="/WEB-INF/views/leftNavi.jsp"%>

	<main>

	<div style="text-align: center">
		<font size="7" color="white"><b>会議室利用状況</b></font>
	</div>

	<br>

	<table id="confTable" class="display">
		<thead>
			<tr>
				<th>Macアドレス</th>
				<th>会議室</th>
				<th>状況</th>
				<th>利用開始時刻</th>
				<th>利用終了時刻</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach items="${confList}" var="dto" varStatus="status">
				<tr align="center">
					<td>${dto.raspberrypimac}</td>

					<td><a href="/conference/confBeaconList?macaddr=${dto.raspberrypimac}&name=${dto.name}&ipaddress=${dto.ipaddress}">${dto.name}</a></td>

					<c:choose>
						<c:when test="${dto.status == 'true'}">
							<td><div style="color: red; font-family: Hiragino Sans, ヒラギノ角ゴシック; font-weight: 900;">使用中</div></td>
						</c:when>
						<c:otherwise>
							<td><div style="color: blue; font-family: Hiragino Sans, ヒラギノ角ゴシック; font-weight: 900;">空室</div></td>
						</c:otherwise>
					</c:choose>

					<td><fmt:formatDate value="${dto.starttime}" pattern="yyyy/MM/dd  HH:mm " /></td>
					<td><fmt:formatDate value="${dto.endtime}" pattern="yyyy/MM/dd  HH:mm " /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<br>
	<br>

	<div style="text-align: center">
		<font size="7" color="white"><b>鍵貸出状況</b></font>
	</div>
	<br>

	<table id="keyTable" class="cell-border">
		<thead>
			<tr>
				<th>ビーコン鍵</th>

				<c:forEach items="${manageList}" var="dto">
					<th>${dto.beaconname}</th>
				</c:forEach>
			</tr>
		</thead>

		<tbody>
			<tr align="center">
				<td><div style="font-family: Hiragino Sans, ヒラギノ角ゴシック; font-weight: 900;">鍵の状況</div></td>
				<c:forEach items="${manageList}" var="dto">
					<c:choose>
						<c:when test="${dto.rssi > measureRSSI}">
							<td><div style="color: blue; font-family: Hiragino Sans, ヒラギノ角ゴシック; font-weight: 900;">貸出可</div></td>
						</c:when>
						<c:otherwise>
							<td><div style="color: red; font-family: Hiragino Sans, ヒラギノ角ゴシック; font-weight: 900;">貸出中</div></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<br>
	
	<div align="right" style="color: white; font-family: Hiragino Sans, ヒラギノ角ゴシック;">
		update Time : <fmt:formatDate value="${confList[0].updatetime}" pattern="yyyy/MM/dd  HH:mm " />
	</div>
	
	</main>




</body>
</html>
