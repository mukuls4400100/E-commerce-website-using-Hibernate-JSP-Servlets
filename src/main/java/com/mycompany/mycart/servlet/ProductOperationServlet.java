package com.mycompany.mycart.servlet;

import com.mycompany.mycart.entities.category;
import com.mycompany.mycart.entities.product;
import com.mycompany.mycart.helper.FactoryProvider;
import com.mycompany.mycart.userdao.CategoryDao;
import com.mycompany.mycart.userdao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                /* category data */
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                category categor = new category();
                categor.setCategoryTitle(title);
                categor.setCategoryDescription(description);

                CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categorydao.saveCategory(categor);
                HttpSession session = request.getSession();
                session.setAttribute("message", "Category has been added Successfully: " + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {
                /* product data */
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                product p = new product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpName(pName);
                p.setpPhoto(part.getSubmittedFileName());

                CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
                category categor = categorydao.getCategoryById(catId);

                p.setCategori(categor);

                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);

                HttpSession session = request.getSession();
                session.setAttribute("message", "Product has been added Successfully: " + catId);
                response.sendRedirect("admin.jsp");
                return;
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
