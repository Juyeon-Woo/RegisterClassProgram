<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
JoinVO vo = new JoinVO();
vo.setId(id);
int rs = sub_dao.deleteSub(vo);
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