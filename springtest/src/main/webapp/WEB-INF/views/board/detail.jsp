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
			<span class="float-right btn-like"><i class="far fa-thumbs-up"></i></span>
			<span class="float-right text-like">추천:${board.up}</span>
			<span class="float-right">조회:${board.views}</span>
		</div>
		<div class="board-title detail">${board.title}</div>
		<div class="board-content detail">${board.content}</div>
		<c:if test="${board.file != null }">
			<a href="<%=request.getContextPath()%>/board/download?fileName=${board.file}">${board.oriFile}</a>
		</c:if>
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
<input type="hidden" id="num" value="${board.num }">
<script>
$(function(){
	$('.btn-like').click(function(){
		var num = $('#num').val();
		$.ajax({
	        async:true,
	        type:'POST',
	        data:num,
	        url:"<%=request.getContextPath()%>/board/up",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){
		        //로그인한 회원이면
		        if(data['isUser']){
			        //게시글의 추천수가 0보다 크면 => 추천수를 증가시켜야하면
			        //=> 처음 추천을 누른다면
			        if(data['up'] > 0){
				        $('.text-like').text('추천:'+data['up'])
				    }
				    //이미 추천을 눌렀다면
				    else{
					    alert('이미 추천한 게시물입니다.')
					}
			    }
			    //로그인하지 않았으면
			    else{
				    alert('추천은 로그인을 해야 가능합니다.');
				}
	        }
	    });
	})
})
</script>