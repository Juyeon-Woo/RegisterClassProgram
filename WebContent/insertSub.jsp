<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link ref="stylesheet" href="style.css" type="text/css">
<meta charset="UTF-8">
<title>수강신청 도우미 사이트</title>
</head>
<body>
<%
DAO insertSub = DAO.getInstance();
ArrayList<lecVO> leclist = insertSub.getLecturer();
%>
<form action="insertSubPro.jsp" method="post" name="finish">
	
	<div class=header>
		<h2>수강신청 도우미 사이트</h2>
	</div>
	<div class=section>
		<h3>교과목 추가</h3>
		<table border="1">
			<tr>
				<td>교과목 코드</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				
				<td><select name="lecturer">
				<option value="">담당강사선택</option>
				<%for(lecVO l:leclist){ %>
				<option value="<%=l.getIdx()%>"><%=l.getName() %></option>
				<%} %>
				</select></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" id="credit" name="credit"></td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
				<input type="radio" name="days" value="1">월
				<input type="radio" name="days" value="2">화
				<input type="radio" name="days" value="3">수
				<input type="radio" name="days" value="4">목
				<input type="radio" name="days" value="5">금
				</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input type="text" id="start_hour" name="start_hour"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="text" id="end_end" name="end_end"></td>
			</tr>
		</table>
		<input type="button" value="목록" id="list" name="list" onclick="location.href='index.jsp'">
		<input type="submit" value="완료" id="finish" name="finish">
	</div>
	<div class=footer>
		<p>Copyright&copy; 2018 정보처리산업기사 All Right Reserved
	</div>
</body>
</html>