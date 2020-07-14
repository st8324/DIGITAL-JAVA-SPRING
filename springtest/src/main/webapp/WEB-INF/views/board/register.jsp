<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="<%=request.getContextPath()%>/board/register">
	<input type="text" name="title"><br>
	<input type="text" name="writer"><br>
	<textarea name="content"></textarea><br>
	<button type="submit">전송</button>
</form>