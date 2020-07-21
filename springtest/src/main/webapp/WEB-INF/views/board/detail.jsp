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
		<div class="board-header detail">
			<span class="float-left">작성자:${board.writer}</span>
			<span>${board.registerDate}</span>
			<span class="float-right">조회:${board.views}</span>
		</div>
		<div class="board-title detail">${board.title}</div>
		<div class="board-content detail">${board.content}</div>
		<div class="float-right">
			<a href="<%=request.getContextPath()%>/board/list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button class="btn btn-outline-success">목록</button></a>
			<c:if test="${user != null }">
				<a href="<%=request.getContextPath()%>/board/register"><button class="btn btn-outline-success">등록</button></a>
				<c:if test="${user.id == board.writer}">
					<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}"><button class="btn btn-outline-success">수정</button></a>
					<a href="<%=request.getContextPath()%>/board/delete?num=${board.num}"><button class="btn btn-outline-success">삭제</button></a>
				</c:if>
			</c:if>
		</div>
	</c:if>
</c:if>