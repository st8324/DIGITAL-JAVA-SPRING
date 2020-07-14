<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${board eq null }">
	<h1>해당 게시물은 없는 게시물입니다.</h1>
</c:if>
<c:if test="${board ne null }">
	<c:if test="${board.isDel == 'Y'.charAt(0)}">
		<h1>해당 게시물은 삭제되었습니다.</h1>
	</c:if>
	<c:if test="${board.isDel == 'N'.charAt(0)}">
		<input type="text" value=${board.num} readonly>
		<br>
		<input type="text" value=${board.title} readonly>
		<br>
		<input type="text" value=${board.writer} readonly>
		<br>
		<input type="text" value=${board.registerDate} readonly>
		<br>
		<input type="text" value=${board.views} readonly>
		<br>
		<div>
			${board.content}
		</div>
		<a href="<%=request.getContextPath()%>/board/list"><button>목록</button></a>
		<a href="<%=request.getContextPath()%>/board/register"><button>등록</button></a>
		<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}"><button>수정</button></a>
	</c:if>
</c:if>