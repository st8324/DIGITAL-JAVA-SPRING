<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<input type="hidden" value="${isLogin }" id="isLogin">
	<input type="hidden" value="${id}" id="id">
	<script type="text/javascript">
		$(function(){
			var id = $('#id').val();
			var isLogin = $('#isLogin').val()
			if(isLogin == 'false' && id != '')
				alert(id+'가 없가나 비밀번호가 잘못 되었습니다.')
		})
	</script>

