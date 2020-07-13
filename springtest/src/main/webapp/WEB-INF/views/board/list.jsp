<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1 class="text-header">게시글</h1>
<table class="table table-hover">
	<thead class="thead-dark">
		<tr>
			<th width="8%">번호</th>
			<th width="55%">제목</th>
			<th width="10%">작성자</th>
			<th width="20%">작성일</th>
			<th width="10%">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${list.size() != 0}">
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.num}</td>
					<td>
						<a href="<%=request.getContextPath()%>/board/detail?num=${board.num}">
							${board.title}
						</a>
					</td>
					<td>${board.writer}</td>
					<td>${board.registerDate}</td>
					<td>${board.views}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
</table>
