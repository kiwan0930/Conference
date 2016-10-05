<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/logout.jspf" %>



<script>

$(document).ready(function() {
	var table = $('#confTable').DataTable({
		"language" : {
			"emptyTable" : "データが登録されていません。",
			"info" : "_TOTAL_ 件中 _START_ 件から _END_ 件までを表示",
			 "infoEmpty" : "",
			  "infoFiltered" : "(_MAX_ 件からの絞り込み表示)",
			  "infoPostFix" : "",
			  "thousands" : ",",
			  "lengthMenu" : "1ページあたりの表示件数: _MENU_",
			  "loadingRecords" : "ロード中",
			  "processing" : "処理中...",
			  "search" : "検索",
			  "zeroRecords" : "該当するデータが見つかりませんでした。",
			  "paginate" : {
			    "first" : "先頭",
			    "previous" : "前へ",
			    "next" : "次へ",
			    "last" : "末尾"
			  }
		},
		"autoWidth": false,
		"paging" : false,
		"ordering" : false,
		"columnDefs": [{
							"targets": [ 0 ],
							"visible": false
					   }
		]
	});
	
	$('input.toggle-vis').on( 'click', function (e) {
        e.preventDefault();
        var column = table.column( $(this).attr('data-column') );
		column.visible( ! column.visible() );
 	});
	
	$('#keyTable').DataTable({
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
		},
		"autoWidth": false,
		"info": false,
		"ordering" : false,
		"searching" : false,
		"paging" : false	
	});



});


</script>

<html>
<body>
	<%@ include file="/WEB-INF/views/leftNavi.jsp" %>

	<main>
	<div style=" font-family: Hiragino Sans,ヒラギノ角ゴシック; font-weight: 900;">
		<div class="fontF" style="text-align: center"> <font size="7"><b>会議室利用状況</b></font> </div>
		
		<br>
	
	
	<!-- <a id="test" href="#test">Sample link</a> -->
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
				<c:forEach items="${confList}" var="dto" varStatus="status" >
					<tr align="center">
					
						<td><div class="fontF">${dto.raspberrypimac}</div></td>
						
						<td><div class="fontF">${dto.name}</div></td>

						<c:choose>
							<c:when test="${dto.status == 'true'}">
								<td><div style="color:red; font-family: Hiragino Sans,ヒラギノ角ゴシック; font-weight: 900;">使用中</div></td>
							</c:when>
							<c:otherwise>
								<td><div style="color:blue; font-family: Hiragino Sans,ヒラギノ角ゴシック; font-weight: 900;">空室</div></td>
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
		<!-- ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd -->

		<div style="text-align: center">
			<font size="7"><b>鍵貸出状況</b></font>
		</div>
		<br>

		<table id="keyTable" class="display">
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
					<td> <div class="fontF" >鍵の状況</div></td>
					<c:forEach items="${manageList}" var="dto">
						<c:choose>
							<c:when test="${dto.rssi > measureRSSI}">
								<td><div style="color:blue; font-family: Hiragino Sans,ヒラギノ角ゴシック; font-weight:900;"> 貸出可 </div></td>
							</c:when>
							<c:otherwise> 
								<td><div style="color:red; font-family: Hiragino Sans,ヒラギノ角ゴシック; font-weight: 900;">貸出中</div></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<br> 
		
		<div align="right" >update Time : <fmt:formatDate value="${confList[0].updatetime}" pattern="yyyy/MM/dd  HH:mm " /> </div>
		</div>
</main>

	
</body>
</html>
