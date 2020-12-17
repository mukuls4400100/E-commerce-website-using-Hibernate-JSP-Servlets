
<%@page import="com.mycompany.mycart.entities.category"%>
<%@page import="com.mycompany.mycart.userdao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.product"%>
<%@page import="com.mycompany.mycart.userdao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sahara</title>
        <style>
            .category_block li:hover {
                background-color: #007bff;
            }
            .category_block li:hover a {
                color: #ffffff;
            }
            body {
                overflow: hidden; /* Hide scrollbars */
            }
            div.scroll{

                height: 860px;
                overflow: scroll;
                overflow-x:hidden;
            }
            div.active{
                background-color: lightblue;
            }
            .discount-label{
                font-size: 12px!important;
                font-style: italic!important;
                text-decoration: line-through!important;
            }
            .discount-labe{
                font-size: 20px!important;
                color: green!important;
                
            }
            .shadow{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)!important;  
            }
            .card-style:hover{
                background-image: linear-gradient(to bottom right,#bbdefb,white);
                cursor: pointer;
            }
        </style>
        

    </head>
    <body>
       
        <%@include file="Components/navbar.jsp" %><br><br>
        <%@include file="Components/common_modals.jsp" %>
        <div class="row mt-0 mx-2">
            <%                String cat = request.getParameter("category");
                //out.println(cat);
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                List<product> list = null;
                if (cat == null) {
                    list = pdao.getAllProducts();
                } else if (cat.trim().equals("all")) {
                    list = pdao.getAllProducts();
                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = pdao.getAllProductsById(cid);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<category> clist = cdao.getCategories();

            %>
            <div class="col-md-2">
                <div class="card bg-light mb-4" style="position:fixed; width: 15%;">
                    <a href="index.jsp?category=all" ><div  class="card-header  text-black text-uppercase"><i class="fa fa-list"></i> All Products</div></a>
                    <ul class="list-group category_block">


                        <%                            for (category c : clist) {
                        %>
                        <li class="list-group-item">

                            <a href="index.jsp?category=<%=c.getCategoryId()%>" onclick="myFunction()"><div id="myDiv" class="card-header nav-link  text-black text-uppercase"><%= c.getCategoryTitle() + "<br>"%></div></a>
                        </li>
                        <%
                            }
                        %>



                    </ul>
                </div>
            </div>


            <div class="col-md-10 scroll">
                <div class="row mt-2">
                    <div class="col-md-12 ">
                        
                        <div class="card-columns" >
                            <%
                                for (product p : list) {
                            %> 
                            <div class="card shadow card-style" >
                                <div class="container text-center">
                                    <img class="card-img-top m-2" style="max-height:200px; width: auto;" src="img/products/<%= p.getpPhoto()%>" alt="Card image cap">
                                </div>

                                <div class="card-body">
                                    <h5 class="card-title"><center><%= p.getpName()%></center></h5>
                                    <p  class="card-text"><center><span class="text-secondary discount-labe">Upto <%= p.getpDiscount()%>% off</span></center></p>
                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart( <%= p.getpId() %> , '<%= p.getpName() %>' , <%= p.getPriceAfterDiscount()%> ) "> Add to Cart</button>
                                        <button class="btn btn-outline-primary">&#8377; <%= p.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label">&#8377; <%=p.getpPrice()%></span></button>
                                    </div>

                                </div>
                            </div>
                            <%
                                }
                                if (list.size() == 0) {
                                    out.println("<h3>No products are available</h3>");
                                }
                            %>
                        </div>
                    
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
