
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sahara</title>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <%
            out.println(FactoryProvider.getFactory());
        %>
    </body>
</html>
