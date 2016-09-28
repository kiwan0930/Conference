<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/logout.jspf"%>

<meta charset="UTF-8">

<link rel="stylesheet" href="css/style.css">
<script>

$(document).ready(function() {
	
	$('#deleteBeaconList').click(function(){
		if (confirm("全ての測定ログを削除しますか?") == true){
			window.location = "<c:url value='/deleteBeaconList'/>";
		}
	});
	$('#reload').click(function(){
		window.location = "<c:url value='/confList'/>";
	});
	$('#reload2').click(function(){
		window.location = "<c:url value='/guest'/>";
	});
	
	$('#confadd').click(function(){
		var w = 700;		
		var h = 380;
        var left = Number((screen.width/2)-(w/2));
        var tops = Number((screen.height/2)-(h/2));

		window.open("<c:url value='/confAddView'/>","kiwan" , 'width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
		
	});
	$('#keyadd').click(function(){
		var w = 700;		
		var h = 440;
        var left = Number((screen.width/2)-(w/2));
        var tops = Number((screen.height/2)-(h/2));

		window.open("<c:url value='/keyAddView'/>", "kiwan" , 'width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
	});
	
	$('#keymapadd').click(function(){
		var w = 700;		
		var h = 260;
        var left = Number((screen.width/2)-(w/2));
        var tops = Number((screen.height/2)-(h/2));

		window.open("<c:url value='/keyMapAddView'/>","kiwan" , 'width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
	});
	
	
	$('#keymanageadd').click(function(){
		var w = 700;		
		var h = 260;
        var left = Number((screen.width/2)-(w/2));
        var tops = Number((screen.height/2)-(h/2));

		window.open("<c:url value='/keyManageAddView'/>","kiwan" , 'width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
	});
	
	
	$('#manageadd').click(function(){
		var w = 700;		
		var h = 400;
        var left = Number((screen.width/2)-(w/2));
        var tops = Number((screen.height/2)-(h/2));

		window.open("<c:url value='/manageAddView'/>","kiwan" , 'width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
	});
	
	$('#config').click(function(){
		var w = 700;		
		var h = 400;
        var left = Number((screen.width/2)-(w/2));
        var tops = Number((screen.height/2)-(h/2));

		window.open("<c:url value='/config'/>","kiwan" , 'width=' + w + ', height=' + h + ', top=' + tops + ', left=' + left);
	});
	
	
	$('#login').click(function(){
		window.location = "<c:url value='/login'/>";
	});
	
	
	$('.tooltip').tooltipster({
		   animation: 'grow',
		   animationDuration: 450,
		   delay: 200

	});
	
	$("#menu").eosMenu();

});

</script>


<nav class="menu" tabindex="0">

	<header class="avatar">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<img src="data:image/jpeg;base64,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" />
			<h2>${pageContext.request.userPrincipal.name}</h2>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_USER')">
			<img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSiZP4SJGGRduhRNOlfapWl57lpcfIdq0mCvunrvfUHbwC4aGgSog" />
			<h2>${pageContext.request.userPrincipal.name}</h2>
		</sec:authorize>
	</header>


	<div id="container1" style="overflow: hidden;">
		<div id="container2"
			style="overflow: auto; position: absolute; top: 274px; left: 0px; right: 0px; bottom: 0px;">
			<ul>
				<c:if test="${leftNaviVal == 0}">
					<div class="eos-menu" id="menu">
						<div class="eos-menu-content">
							<div class="eos-group-title"> 追加 <img style="float: right; transform: translateY(50%);" class="tooltip" title="追加する" src="img/question.png" width="17px" height="17px">
						</div>
						<div class="eos-group-content">
							<li class="eos-item"><a id="confadd"> 受信機追加 </a></li>
							<li class="eos-item"><a id="keyadd"> ビーコン鍵追加</a></li>
							<li class="eos-item"><a id="keymapadd"> キーマッチ追加</a></li>
							<li class="eos-item"><a id="manageadd"> 鍵管理機追加</a></li>
							<li class="eos-item"><a id="keymanageadd"> キーマネージ追加</a></li>
						</div>
						<div class="eos-group-title">削除</div>
						<div class="eos-group-content">
							<li class="eos-item"><a id="clear"> 全データ削除 </a></li>
							<li class="eos-item"><a id="deleteBeaconList"> ログ削除</a></li>
						</div>
							<div class="eos-group-title" id="reboot">全再起動</div>
							<div class="eos-group-title" id="shutdown">全シャットダウン</div>

							<div class="eos-group-title" id="log">メッセージ確認</div>
							<div class="eos-group-title" id="config">環境設定</div>
							<div class="eos-group-title" id="reload">リロード</div>

							<div class="eos-group-title" onclick="javascript:formSubmit()">LOGOUT</div>
						</div>
					</div>
				</c:if>


				<c:if test="${leftNaviVal == 1}">
					<div class="eos-menu" id="menu">
						<div class="eos-menu-content">

							<div class="eos-group-title" id="back">戻る</div>
							<div class="eos-group-title" id="delete">削除</div>

							<div class="eos-group-title" id="onereboot">再起動</div>
							<div class="eos-group-title" id="oneshutdown">シャットダウン</div>

							<div class="eos-group-title" onclick="javascript:formSubmit()">LOGOUT</div>
						</div>
					</div>


				</c:if>

				<c:if test="${leftNaviVal == 2}">
					<div class="eos-menu" id="menu">
						<div class="eos-menu-content">

							<div class="eos-group-title" id="back">戻る</div>
							<div class="eos-group-title" id="deleteLog">削除</div>

							<div class="eos-group-title" onclick="javascript:formSubmit()">LOGOUT</div>
						</div>
					</div>

				</c:if>

				<c:if test="${leftNaviVal == -1}">
					<div class="eos-menu" id="menu">
						<div class="eos-menu-content">
							<div class="eos-group-title" id="reload2">リロード</div>
							<div class="eos-group-title" onclick="javascript:formSubmit()">LOGOUT</div>
						</div>
					</div>

				</c:if>



			</ul>

		</div>
	</div>
</nav>

