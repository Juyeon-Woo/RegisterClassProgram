<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
<meta charset="UTF-8">
<title>수강신청 도우미 사이트</title>
<%
request.setCharacterEncoding("UTF-8");
DAO dao_sub=DAO.getInstance();
String id=request.getParameter("id");
JoinVO vo = dao_sub.getSubid(id);

ArrayList<lecVO> leclist = dao_sub.getLecturer();
%>
</head>
<body>

	<form action="updateSubPro.jsp" method="post" name="update">
	<div class=header>
		<h2>수강신청 도우미 사이트</h2>
	</div>
	<div class=section>
		<h3>교과목 수정</h3>
		<table border="1">
			<tr>
				<td>교과목 코드</td>
				<td><input type="text" name="id" id="id" value="<%=vo.getId() %>"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" id="name" value="<%=vo.getName()%>"></td>
			</tr>
				
			<tr>
				<td>담당강사</td>
				
				<td>
				<select name="lecturer">
				<option value="">담당강사선택</option>
				
				<%for(lecVO l:leclist){ 
				if(l.getName().equals((vo.getLecturer()))){
				%>
				<option value="<%=l.getIdx()%>" selected><%=l.getName() %></option>
				<%}else{ %>
				<option value="<%=l.getIdx()%>" ><%=l.getName() %></option>
				<%}} %> 
				
				</select>
				</td> 
			
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit" id="credit" value="<%=vo.getCredit()%>"></td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
				 
				<input type="radio" name="days" value="<%=vo.getWeek() %>"
				<%if(vo.getWeek().equals("1")){%>
				checked 
				<%} %>
				>월
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("2")){ %>checked<%} %>
				>화
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("3")){ %>checked<%} %>
				>수
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("4")){ %>checked<%} %>
				>목
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("5")){ %>checked<%} %>>금</td> 
	
			</tr>
			
			<tr>
				<td>시작</td>
				<td><input type="text" name="start_hour" id="start_hour" value="<%=vo.getStart_hour()%>"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="text" name="end_end" id="end_end" value="<%=vo.getEnd_end()%>"></td>
			</tr>
		</table>
		
		<input type="button" value="목록" class="list" name="list" onclick="location.href='index.jsp'">
		<input type="button" value="취소" class="cancel" name="cancel" onclick="location.href='index.jsp'">
		<input type="submit" value="완료" class="finish" name="update" id="update">
	</div>
	<div class=footer>
		<p>Copyright&copy; 2018 정보처리산업기사 All Right Reserved
	</div>
	</form>
</body>
</html>