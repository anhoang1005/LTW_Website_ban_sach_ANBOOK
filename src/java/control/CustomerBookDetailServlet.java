/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.AuthorDAO;
import dao.BookDAO;
import dao.CategoryDAO;
import dao.PublisherDAO;
import dao.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import model.Author;
import model.Book;
import model.Category;
import model.Publisher;
import model.Review;
import model.Users;
import org.apache.catalina.User;

/**
 *
 * @author Hoang Van An
 */
@WebServlet(name="CustomerBookDetailServlet", urlPatterns={"/bookdetail"})
public class CustomerBookDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        BookDAO bdao = new BookDAO();
        AuthorDAO adao = new AuthorDAO();
        PublisherDAO pdao = new PublisherDAO();
        CategoryDAO cdao = new CategoryDAO();
        ReviewDAO rdao = new ReviewDAO();
        LocalDateTime dateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = dateTime.format(formatter);

        
        if(action.equals("view")){
            String bookid = request.getParameter("bookid");
            Book book = bdao.getBookDetail(bookid);
            Author author = adao.getAuthor(bookid);
            Publisher publisher = pdao.getPublisher(bookid);
            Category category = cdao.getCategory(bookid);
            List<Book> listB = bdao.getAllBook();
            
            List<Review> listR = rdao.getReviewbyBookid(bookid);
            HttpSession session = request.getSession(false); // Nếu không muốn tạo mới session khi không có
            if(session.getAttribute("user") != null){
                Users u = (Users)session.getAttribute("user");
                for(Review r : listR){
                    if (r != null && u != null && r.getUsername() != null && u.getUsername() != null && r.getUsername().equals(u.getUsername())) {
                        Review myreview = r;
                        request.setAttribute("myreview", myreview);
                        break;
                    }
                }
            }
            
            request.setAttribute("bookB", book);
            request.setAttribute("publisher", publisher);
            request.setAttribute("authorA", author);
            request.setAttribute("category", category);
            request.setAttribute("listB", listB);
            request.setAttribute("listR", listR);
            request.getRequestDispatcher("Customer_BookDetail.jsp").forward(request, response);
        }
        
        if(action.equals("addrv")){
            String bookid = request.getParameter("bookid");
            String userid = request.getParameter("userid");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("comment");
            rdao.insertBookReview(bookid, userid, formattedDateTime, rating, comment, "image");
            response.sendRedirect("bookdetail?action=view&bookid=" + bookid);
        }
        
        if(action.equals("updaterv")){
            String bookid = request.getParameter("bookid");
            String userid = request.getParameter("userid");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("comment");
            rdao.updateBookReview(bookid, userid, rating, comment, "chuaco");
            response.sendRedirect("bookdetail?action=view&bookid=" + bookid);
        }
        
        if(action.equals("deleterv")){
            String bookid = request.getParameter("bookid");
            String userid = request.getParameter("userid");
            rdao.deleteBookReview(bookid, userid);
            response.sendRedirect("bookdetail?action=view&bookid=" + bookid);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
