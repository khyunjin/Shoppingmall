<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   int user = new UserDAO().idCheck(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<title>ID 중복체크</title>
</head>
   <div align="center">
      <br/><b><%= id %></b>
      <%
         if (user == 0) {
            out.println("는 이미 존재하는 ID입니다.<p/>");
         } else {
            out.println("는 사용 가능 합니다.<p/>");
         }
      %>
      <a href="#" onClick="self.close()">닫기</a> 
   </div>
</body>
</html>