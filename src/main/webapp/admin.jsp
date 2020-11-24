<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.category"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.userdao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>

<%-- authentication of user --%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin!! Please don't access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@include file="Components/common_css_js.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin page</title>
    </head>

    <style>
        .admin .card{
            border: 1px solid black;
        }
        .admin .card:hover{
            background-image: linear-gradient(to bottom right,#90caf9,white);
            cursor: pointer;
        }
        #bg:hover{
            background-image: linear-gradient(to bottom right,#90caf9,white);
            cursor: pointer;
        }
       
    </style>
    <body>
        <%@include file="Components/navbar.jsp" %><br><br><br>

        <div class="container mt-3">
            <%@include file="Components/message.jsp"%> 
        </div>

        <%-- start category-pannel --%>
        <div class="container my-5  z-depth-1 px-0 rounded " style="background-color: white; color: black">  
            <h3 class="text-center font-weight-bold mb-4 pb-3"><br>Counter</h3>

            <div class="row">

                <%-- current-users--%>
                <div class="col-md-4 mb-4" id="bg">
                    <div class="row" >
                        <div class="col-6 pr-0">
                            <h4 class="display-4 text-right mb-0 count-up" data-from="0" data-to="42" data-time="2000">42</h4>
                        </div>

                        <div class="col-6">
                            <p class="text-uppercase font-weight-normal mb-1">USERS</p>
                            <p class="mb-0"><img class="card-img-top" src="img/add-friend.png"
                                                 alt="" style="max-width: 70px;"> </p>
                        </div>
                    </div>
                </div>

                <%-- current-categories--%>
                <div class="col-md-4 mb-4" id="bg">
                    <div class="row" >
                        <div class="col-6 pr-0">
                            <h4 class="display-4 text-right mb-0 count1" data-from="0" data-to="3500" data-time="2000">3,500</h4>
                        </div>

                        <div class="col-6">
                            <p class="text-uppercase font-weight-normal mb-1">CATEGORIES</p>
                            <p class="mb-0"><img class="card-img-top" src="img/checklist.png"
                                                 alt="" style="max-width: 70px;"> </p>
                        </div>
                    </div>
                </div>

                <%-- current-products--%>
                <div class="col-md-4 mb-4"id="bg">
                    <div class="row" >
                        <div class="col-6 pr-0">
                            <h4 class="display-4 text-right">244</h4>
                        </div>

                        <div class="col-6">
                            <p class="text-uppercase font-weight-normal mb-1">PRODUCTS</p>
                            <p class="mb-0"><img class="card-img-top" src="img/package.png"
                                                 alt="" style="max-width: 70px;"> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- end category-pannel --%>

        <%-- start add-category-modal and product-modal--%>
        <div class="container admin">
            <div class="row mt-3">
                <div class="col-md-6">

                    <%-- add category card --%>
                    <div class="card" data-toggle="modal" data-target="#add-category">
                        <div  class="card-body text-center">
                            <div class="container">
                                <img src="img/cat.png" style="max-width: 125px;" class="img-fluid rounded">
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h1 class="text-uppercase text-mut">Add Category</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">

                    <%-- add product card --%>
                    <div class="card" data-toggle="modal" data-target="#add-product">
                        <div  class="card-body text-center">
                            <div class="container">
                                <img src="img/plus.png" style="max-width: 125px;" class="img-fluid rounded">
                            </div>
                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-mut">Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%-- end add-category-modal and product-modal--%>

        <!-- add category Modal -->
        <div class="modal fade" id="add-category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory"></input>
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title"></input>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" style="height:300px;" type="text" class="form-control" name="catDescription" placeholder="Enter category desciption"></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Add Category</button>
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                            </div>   
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!-- End category Modal -->

        <!-- add product Modal -->
        <div class="modal fade" id="add-product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <%-- start prduct form --%>
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"></input>
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter title of product" required/>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" style="height:250px;" type="text" class="form-control" name="pDesc" placeholder="Add product desciption"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter price of product" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product Discount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product Quantity" required/>
                            </div>

                            <!-- get categories -->
                            <%                                CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
                                List<category> list = categorydao.getCategories();
                            %>
                            <%-- getting dynamic values of categories from database --%>
                            <div class="form-group">
                                <select class="form-control" name="catId" id="">
                                    <%
                                        for (category c : list) {
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pPic">Choose picture of your product </label><br>
                                <input type="file" id="pPic" name="pPic" required/>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Add Product</button>
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                            </div> 
                        </form>
                        <%-- end product form --%>

                    </div>
                </div>
            </div>
        </div>


        <!-- End product Modal -->
    </body>
</html>
