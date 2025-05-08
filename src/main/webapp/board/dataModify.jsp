<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<<<<<<< HEAD
	<title>업로드 게시판 수정 화면2222222</title>
=======
	<title>업로드 게시판 수정 화면</title>
>>>>>>> 71b72e75371ea8e4615ed7b4a205912696f71ed8
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../js/jquery-3.7.1.js"></script>
  	<script src="../js/jquery-ui.js"></script>
</head>

	<script>
	function fn_delete(seqid,delname) {

		let dtoFile = "${dto.filename}"; // 전체
		let filename = dtoFile.replace(delname+"／","");

		$.ajax({
			type : "post",
			url  : "/dataBoardFileDelete",
			data : "seqid="+seqid+"&delname="+delname+"&filename="+filename,
			dataType : "text",
			success  : function(data){
				if(data == "ok") {
					alert("삭제완료");
					window.location.reload(); // 새로고침 함수
				} else {
					alert("삭제실패");
				}
			},
			error    : function(){
				alert("오류발생!!");
			}
		});
	}
	
	
	$(function(){

		$("#btn_list").click(function(){
			location = "/dataList";
		});
		
		$("#btn_submit").click(function() {
			
			let title = $("#title").val();
			title = $.trim(title);
			$("#title").val(title);

			let pass  = $("#pass").val();
			pass = $.trim(pass);
			$("#pass").val(pass);
			
			if( title == "" ) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
			if( pass == "" ) {
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			// let form = $("#frm").serialize();
			// {파일} 전송을 위한 폼설정
			let form = new FormData(document.getElementById('frm'));
			$.ajax({
				type : "post",
				url  : "/dataBoardUpdate",
				data : form,
				
				processData: false, // 전송데이터의 인식을 위한 세팅
				contentType: false, // 전송데이터의 인식을 위한 세팅
				
				dataType : "text",
				success  : function(data){
					if(data == "ok") {
						alert("수정완료");
						location = "/dataList";
					} else {
						alert("수정실패");
					}
				},
				error    : function(){
					alert("오류발생!!");
				}
			});

		});
	});
	</script>

<body>
</html>