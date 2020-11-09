<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
    </head>
    <body>
        <%-- Navigation bar--%>
        <%@include file="Components/navbar.jsp" %>
        
        <%-- show alert message--%>
        <div class="container"><br><%@ include file="Components/message.jsp"%></div>
        
        
        <div class="container register">
            <div class="row">
                
                <%-- left-design --%>
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    <h3>Welcome</h3>
                    <h5><center>To</center></h1>
                        <h1 style="font-family: 'Monoton', cursive;"><center>SAHARA</center></h1>
                </div>
                <%-- End left-design--%>
                
                <%-- right-design form--%>
                <div class="col-md-9 register-right">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">Register here</h3>
                            
                            <%-- start registration-from--%>
                            <form action="RegisterServlet" method="post">
                                <div class="row register-form" >

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="user_name" class="form-control" id="name" placeholder="First Name *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="user_password" class="form-control" id="password" placeholder="Password *" value="" required/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" name="user_email" class="form-control" id="email" placeholder="Your Email *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" minlength="10" name="user_phone" id="phone" maxlength="10" class="form-control" placeholder="Your Phone *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control" name="user_address" placeholder="Enter your address" required></textarea>
                                        </div>
                                        <div class="container text-center" >
                                            <button class="btn btn-outline-primary">Register</button>
                                            <input type="reset" class="btn btn-outline-info" value="Reset"/>
                                        </div>
                                    </div>

                                </div>
                            </form>
                            <%-- end registration-from--%>
                             
                        </div>
                    </div>
                </div>
                <%-- End right-design form --%>
            </div>

        </div>
    </body>
</html>
