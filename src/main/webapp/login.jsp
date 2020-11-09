<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <style>
        #login{
            background-image: linear-gradient(to bottom right, #2196f3, white); 
            width:100%;
            padding : 50px 0;
            border-radius:10px 0 0 10px;   
        }
        .carousel-inner{border-radius:0 10px 10px 0;}
        .carousel-caption{text-align:left; left:5%;}
        .login-sec{padding: 50px 30px; position:relative;}
        .login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
        .login-sec .copy-text i{color:#FEB58A;}
        .login-sec .copy-text a{color:#E36262;}
        .login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
        .login-sec h2:after{content:" "; width:100px; height:5px; background:#0d47a1; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
        .btn-login{font-weight:600;}
        .banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
        .banner-text h2{color:black; font-weight:600;}
        .banner-text h2:after{content:" "; width:100px; height:5px; background:black; display:block; margin-top:20px; border-radius:3px;}
        .banner-text p{color:black;}
    </style>    
    <body>
        <%-- Navigation bar--%>
        <%@include file="Components/navbar.jsp" %>
        <br><br><br><br><br>
        
        <%-- show alert message--%>
        <div class="container">
            <%@ include file="Components/message.jsp"%>
        </div>
        
        <section class="login-block" >
            <div class="container">
                <div class="row">
                    <div class="col-md-4 login-sec" id="login">
                        <div class="container">
                            <h2 class="text-center" style="color:black">Login Now</h2>

                            <%-- Create login form--%>
                            <form class="login-form" action="LoginServlet" method="post">

                                <div class="form-group ">
                                    <label for="exampleInputEmail1" class="text-uppercase"><b>Enter Email</b></label>
                                    <input name="user_email" type="text" class="form-control" placeholder="" required/>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="text-uppercase"><b>Password</b></label>
                                    <input name="user_password" type="password" class="form-control" placeholder="" required/>
                                </div>

                                <div class="form-check">
                                    <label class="form-check-label d-block mb-2">
                                        <input type="checkbox" class="form-check-input ">
                                        <small><b>Remember Me</b></small><br>
                                    </label>

                                    <a href="register.jsp" class="text-center d-block mb-2" style="color: black">if not register register here</a>

                                    <div class="container text-center">    

                                        <button type="submit" class="btn btn-outline-primary btn-login " style="color: black">Submit</button>
                                        <input type="reset" class="btn btn-outline-primary btn-login " style="color: black" value="Reset"/> 
                                    </div>
                                </div>
                            </form>
                            <%-- End login form--%>

                        </div>
                    </div>

                    <%-- create login carousel--%> 
                    <div class="col-md-8 banner-sec">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>New to SAHARA</h2>
                                            <p>Create an account. Get access to your Orders, Wishlist and Recommendations</p>
                                        </div>	
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>New to SAHARA</h2>
                                            <p>Create an account. Get access to your Orders, Wishlist and Recommendations</p>
                                        </div>	
                                    </div>
                                </div>
                            </div>	   

                        </div>
                    </div>
                    <%-- End login carousel--%>
                    
                </div>
        </section>
    </body>
</html>
