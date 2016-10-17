<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
			<img src="<c:url value='/img/logo.gif' />" />
	</header>


	<div id="container1" style="overflow: hidden;">
		<div id="container2"
			style="overflow: auto; position: absolute; top: 110px; left: 0px; right: 0px; bottom: 0px;">
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

