<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="<%=request.getContextPath()%>/board/register" method="post" >
	<div class="form-group">
		<label>게시글 제목</label>
		<input type="text" class="form-control" name="title">
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" name="writer" value="${user.id}" readonly>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="5" name="content"></textarea>
	</div>
	<button>등록</button>
</form>

