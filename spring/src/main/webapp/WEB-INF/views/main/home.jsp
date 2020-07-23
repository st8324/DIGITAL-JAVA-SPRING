<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${user == null}">
<h1 class="text-header">
	로그인
</h1>
<form  action="<%=request.getContextPath()%>/" method="post">
	<div class="form-group">
		<input class="form-control" type="text" name="id" placeholder="아이디">
	</div>
	<div class="form-group">
		<input class="form-control" type="password" name="pw" placeholder="비밀번호">
	</div>
	<button class="btn btn-success col-12">로그인</button>
</form>
</c:if>
<button id="ajax">버튼</button>
<script>
	$(function(){
		$('#ajax').click(function(){
			$.ajax({
		        async:true,
		        type:'POST',
		        data:JSON.stringify({"id":"123", "num":"456"}),
		        url:"<%=request.getContextPath()%>/test2",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
					console.log(data['res']);
		        }
		    });	
		})
		
	})
</script>