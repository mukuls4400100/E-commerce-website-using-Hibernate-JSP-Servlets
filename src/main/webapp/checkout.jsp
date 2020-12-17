<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! Login first to access Checkout page");
        response.sendRedirect("login.jsp");
        return;
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Components/common_css_js.jsp"%>
        <%@include file="Components/common_modals.jsp"%>
        
    </head>
    <style>
        .container{
            max-width: 1540px;
        }
        .ban h3:after{content:" "; width:350px; height:4px; background:black; display:block; margin-top:20px; border-radius:3px;}
        .ban h2:after{content:" "; width:3px; height:450px; background:grey; display:block; margin-left:40px; border-radius:3px; text-align: right;}
    </style>
  
    <body>
        <%@include file="Components/navbar.jsp" %><br><br>
        <%-- show alert message--%>
        <div class="container"><br><%@ include file="Components/message.jsp"%></div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-6 ban">

                    <h3 class="line mb-4" >Order Summary</h3>
                    <div class="cart-body">

                    </div>    

                </div>
                <div class="col-md-1 ban">
                    <h2 class="" ></h2>
                </div>
                <div class="col-md-5 ban">

                    <h3 class="mb-4" >Your Details for Order</h3>
                    <form action="CheckoutServlet" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="user_email" value="<%=user.getUserEmail()%>" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" required/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter Name</label>
                            <input name="user_name"  type="name" value="<%=user.getUserName()%>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name" required/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter Phone Number</label>
                            <input name="user_phone" type="number" value="<%=user.getUserPhone()%>" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone Number" required/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Your shipping address</label>
                            <textarea name="user_address"  class="form-control" id="address" rows="3" placeholder="Enter your address" required/><%=user.getUserAddress()%></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-primary">Order Now</button>
                            <button class="btn btn-outline-success"><a href="index.jsp" style="color: green">Continue Shopping</a></button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
