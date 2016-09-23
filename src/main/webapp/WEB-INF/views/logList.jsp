
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/logout.jspf" %>

<script>
$(document).ready(function(){	
	 $('#myTable').DataTable({
		  "language": {
		  	 "url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
		  },
		  "order" : [[ 0, "desc" ]],	
		  "searching" :   false,
		  "paging": false
	 });
	 
	 $('#back').click(function(e){
			location = "<c:url value='/confList'/>"; 
	 });
 
	$('#deleteLog').click(function(){
		if (confirm("記録をクリアしますか?") == true){
	        var url =  "<c:url value='/delLog'/>";
	        location = url;
		}
	});
		
});
</script>

<html>

<body>
	<%@ include file="/WEB-INF/views/leftNavi.jsp" %>
	<main>

	<table id="myTable" class="display">
		<thead>
			<tr>
				<th>update_Time</th>
				<th>message</th>
				<th>raspberrypiMac</th>
				<th>hostname</th>
				<th>ipaddress</th>
				
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr align="center">
					<td><fmt:formatDate value="${dto.updatetime}" pattern="yyyy/MM/dd  HH:mm " /></td>
					<td>${dto.message}</td>
					<td>${dto.raspberrypimac}</td>
					<td>${dto.hostname}</td>
					<td>${dto.ipaddress}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</main>
</body>
</html>
