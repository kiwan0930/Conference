<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script> 
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css " />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<script>
$(document).ready(function(){	
	 var table = $('#myTable').DataTable({
		  "language": {
		  	 "url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
		  },
		  "searching" :   false,
		  "paging": false,
		  "order" : [[ 5, "desc" ]],   
		  "deferRender" : true,
		  "orderClasses" : false,"deferRender" : true, "Processing": true
	 });
	 
	 
	 
	 $('#back').click(function(e){
		location = "<c:url value='/confList'/>"; 
	 });
	 
	 $('#onereboot').click(function(e){
		 if (confirm("「${confName}」受信機を再起動させますか?") == true){
			var param1 = $("#ipaddress").val();
			
			var url =  "<c:url value='/reboot'/>";
		    url= url+ "?ipaddress=" + param1
		    location = url;
		 }
	});
	 
	$('#oneshutdown').click(function(e){
		 if (confirm("「${confName}」受信機をシャットダウンさせますか?") == true){
			var param1 = $("#ipaddress").val();
			
			var url =  "<c:url value='/shutdown'/>";
		    url= url+ "?ipaddress=" + param1
		    location = url;
		 }
	});
	 
	 
	$('#delete').click(function(){
		if (confirm("「${confName}」受信機を削除しますか?") == true){
	        var param1 = $("#macaddr").val();
	        var param2 = $("#confname").val();
	        var url =  "<c:url value='/deleteConf'/>";
	        url= url+ "?confmacaddr=" + param1 +"&confname="+param2;
	        location = url;
		}
	});
	
});

</script>

<html>
<body>

<%@ include file="/WEB-INF/views/leftNavi.jsp" %>

	<main>

	<input type="hidden" id="macaddr" value="${macaddr}">
	<input type="hidden" id="confname" value="${confName}">
	<input type="hidden" id="ipaddress" value="${ipaddress}">
	

	<font size="5" style="float: left; color: white; ">Room Name : ${confName}から発見されたビーコンリスト </font>

	
	<table id="myTable" class="stripe" >
		<thead> 
			<tr> 	
				<th>ビーコンMacアドレス</th>
				
				<th>Major</th>
				<th>Minor</th>
				<th>Measured Power</th>
				<th>RSSI</th>
				<th>測定時間</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr align="center">								
					<td>${dto.beaconmac}</td>
				
					<td>${dto.major}</td>
					<td>${dto.minor}</td>
					<td>${dto.crssi}</td>
					<td>${dto.rssi}</td>
					<td><fmt:formatDate value="${dto.detectivetime}" pattern=" yyyy/MM/dd  HH:mm "/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	</main>
</body>
</html>
