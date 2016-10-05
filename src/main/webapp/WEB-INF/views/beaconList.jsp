
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
