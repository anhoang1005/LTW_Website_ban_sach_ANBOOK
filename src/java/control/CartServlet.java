/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Users;

/**
 *
 * @author Hoang Van An
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        BookDAO bdao = new BookDAO();

        if (action.equals("view")) {
            HttpSession session = request.getSession();
            if (session.getAttribute("user") != null) {
                Users u = (Users) session.getAttribute("user");
                response.sendRedirect("Cart.jsp");
            }
        }

        if (action.equals("add")) {
            String bookid = request.getParameter("bookid");
            String quantityString = request.getParameter("quantity");
            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
                HttpSession session = request.getSession();
                if (session.getAttribute("user") != null) {
                    List<Cart> cart = (List<Cart>) session.getAttribute("cart");
                    Cart c = new Cart(bdao.getBookDetail(bookid), quantity);
                    int check = 0;
                    for (Cart ca : cart){
                        if(ca.getBook().getBookid() == c.getBook().getBookid()){
                            ca.setQuantity(ca.getQuantity() + quantity);
                            check = 1;
                            break;
                        }
                    }
                    if(check == 0){
                        cart.add(c);
                    }
                    response.sendRedirect("bookdetail?action=view&bookid=" + bookid);
                }
            } catch (Exception e) {
            }
        }

        if (action.equals("update")) {
            String bookid = request.getParameter("bookid");
            HttpSession session = request.getSession();
            if (session.getAttribute("user") != null) {
                List<Cart> cart = (List<Cart>) session.getAttribute("cart");
                response.sendRedirect("bookdetail?action=view&bookid=" + bookid);
            }
        }

        if (action.equals("delete")) {
            String bookidString = request.getParameter("bookid");
            int bookid;
            try {
                bookid = Integer.parseInt(bookidString);
                HttpSession session = request.getSession();
                if (session.getAttribute("user") != null) {
                    List<Cart> cart = (List<Cart>) session.getAttribute("cart");
                    for (Iterator<Cart> iterator = cart.iterator(); iterator.hasNext();) {
                        Cart c = iterator.next();
                        if (c.getBook().getBookid() == bookid) {
                            iterator.remove();
                        }
                    }
                    session.setAttribute("cart", cart);
                    response.sendRedirect("Cart.jsp");
                }
            } catch (Exception e) {
            }
        }
        
        if(action.equals("checkout")){
            response.sendRedirect("Check_Out.jsp");
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
