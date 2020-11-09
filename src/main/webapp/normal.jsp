<%
    User user2 = (User) session.getAttribute("current-user");
    if (user2 == null) {
        session.setAttribute("message", "you are not logged in! Please don't access this page");
        response.sendRedirect("login.jsp");
        return;
    }

%>
<%@include file="Components/common_css_js.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>normal page</title>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>


    </body>
</html>
