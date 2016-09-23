
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script> 
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css " />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<script>
$(document).ready(function(){	
	 $('#myTable').DataTable({
		  "language": {
		  	 "url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
		  },
		  "searching" :   false,
		  "paging": false,
		  "orderClasses" : false,"deferRender" : true, "Processing": true
	 });	 
});
</script>

<html>

<body>
	<table id="myTable" class="display" style="width: 650px;">
		<thead>
			<tr>
				<th>Beacon_macaddress</th>
				<th>uuid</th>
				<th>Major</th>
				<th>Minor</th>
				<th>txpower</th>
				<th>RSSI</th>

				<th>host macAddress</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr align="center">
					<td>${dto.macaddr}</td>
					<td>${dto.uuid }</td>
					<td>${dto.major}</td>
					<td>${dto.minor}</td>
					<td>${dto.txpower}</td>
					<td>${dto.rssi}</td>
					<td>${dto.confmacaddr }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
