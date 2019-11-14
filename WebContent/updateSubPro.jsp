<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
DAO sub_dao=DAO.getInstance();
int id = Integer.parseInt(request.getParameter("id"));
String name =request.getParameter("name");
int credit=Integer.parseInt(request.getParameter("credit"));
String lecturer=request.getParameter("lecturer");
String week=request.getParameter("week");
int start_hour=Integer.parseInt(request.getParameter("start_hour"));
int end_end=Integer.parseInt(request.getParameter("end_end"));
JoinVO vo = new JoinVO();
vo.setId(id);
vo.setName(name);
vo.setCredit(credit);
vo.setLecturer(lecturer);
vo.setWeek(week);
vo.setStart_hour(start_hour);
vo.setEnd_end(end_end);
int rs = sub_dao.updateSub(vo);
%>
<script type="text/javascript">
	<%if(rs == 1) { %>
		location.href = "index.jsp";
	<%} else {%>
	location.href = "index.jsp";
	<%}%>
		
		</script>
</body>
</html>