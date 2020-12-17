<%@page import="com.mycompany.mycart.entities.User"%>

<%-- fetching user form database --%>
<%
    User user1 = (User) session.getAttribute("current-user");

%>

    

<nav class="navbar navbar-expand-lg custom-bg navbar-dark">
    <div class="container">
        
        <a class="navbar-brand" href="index.jsp" style="font-size: 22px; font-weight: bold;">SAHARA</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home&nbsp;&nbsp;</a>
                </li>
                
                <li class="nav-item active" style="padding-left: 680px;"><a class="nav-link" href="#!" data-toggle="modal" data-target="#cart" style="font-size:16px; min-width: 60px;"><i class="fa fa-cart-plus" style="font-size: 25px;"></i><span class="cart-items">(0)</span></a></li>
                <%-- displaying login and logout button --%>
                <%                    if (user1 == null) {
                %>
                <li class="nav-item active" style="padding-left: 10px;"><a class="nav-link mt-0" href="register.jsp" ><i class="fas fa-user"></i>&nbsp;Register</a></li>
                <li class="nav-item active " style="padding-left: 10px;"><a class="nav-link" href="login.jsp"><i class='fas fa-sign-in-alt'></i> Login</a></li>
                    <%
                    } else {
                    %>
                <li class="nav-item active " style="padding-left: 10px;"><a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"index.jsp"%>" style="min-width: 140px;">Hi <%= user1.getUserName()%></a></li>
                <li class="nav-item active" style="padding-left: 10px;"><a class="nav-link" href="LogoutServlet" style="min-width: 90px;"><i class="fas fa-sign-in-alt"></i>&nbsp;LogOut</a></li>
                    <%
                        }
                    %>

            </ul>
        </div> 
    </div>
</nav>



