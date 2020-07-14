<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="<%=request.getContextPath()%>/board/register">
	<div class="board-header detail form-group">
		<input class="form-control" name="writer" placeholder="작성자">
	</div>
	<div class="board-title detail form-group">
		<input class="form-control" name="title" placeholder="제목">
	</div>
	<div class="board-content detail form-group">
		<textarea class="form-control modify" name="content">${board.content}</textarea>
	</div>
	<div class="float-right btn-groups">
		<a href="<%=request.getContextPath()%>/board/list"><button class="btn btn-outline-success" type="button">목록</button></a>
		<a href="#"><button class="btn btn-outline-success">등록</button></a>
	</div>
</form>