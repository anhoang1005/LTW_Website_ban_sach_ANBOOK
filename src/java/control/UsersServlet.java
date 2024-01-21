/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import dao.NotificationsDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Cart;
import model.Notifications;
import model.Users;
import org.apache.catalina.startup.HomesUserDatabase;

/**
 *
 * @author Hoang Van An
 */
@WebServlet(name="UsersServlet", urlPatterns={"/users"})
public class UsersServlet extends HttpServlet {
   
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
        UsersDAO udao = new UsersDAO();
        NotificationsDAO ndao = new NotificationsDAO();
        
        if(action.equals("login")){
            String username = request.getParameter("user");
            String pass = request.getParameter("pass");
            Users user = udao.loginUsers(username, pass);
            if(user != null){
                List<Book> books = new ArrayList<>();
                List<Cart> cart = new ArrayList<>();
                List<Notifications> listN = ndao.getNotificationsbyuserid(user.getId());
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("cart", cart);
                session.setAttribute("listN", listN);
                response.sendRedirect("home?action=view");
            }
            else{
                String mess = "Sai tai khoan hoac mat khau";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
        
        if(action.equals("logout")){
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            response.sendRedirect("home?action=view");
        }
        
        if(action.equals("register")){
            String name = request.getParameter("name");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String namsinh = request.getParameter("namsinh");
            String adress = request.getParameter("adress");
            String username = request.getParameter("username");
            String password = request.getParameter("pass");
            String repass = request.getParameter("repass");
            if(udao.checkPhoneNumber(tel)==true){
                request.setAttribute("mess", "Số điện thoại trên đã được đăng kí!");
                request.setAttribute("ten", name);
                request.setAttribute("dob", namsinh);
                request.setAttribute("thudientu", email);
                request.setAttribute("diachi", adress);
                request.setAttribute("tendangnhap", username);
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }
            else if(udao.checkAccount(username)==true){
                request.setAttribute("mess", "Tên đăng nhập đã tồn tại!");
                request.setAttribute("ten", name);
                request.setAttribute("dob", namsinh);
                request.setAttribute("thudientu", email);
                request.setAttribute("sdt", tel);
                request.setAttribute("diachi", adress);
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }
            else if(!password.equals(repass)){
                request.setAttribute("mess", "Nhập lại mật khẩu không trùng khớp!");
                request.setAttribute("ten", name);
                request.setAttribute("dob", namsinh);
                request.setAttribute("thudientu", email);
                request.setAttribute("sdt", tel);
                request.setAttribute("diachi", adress);
                request.setAttribute("tendangnhap", username);
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }
            else {
                udao.registerUsers(name, namsinh, tel, email, adress, username, password, "Customer");
                request.setAttribute("success", "Đăng kí thành công, vui lòng đăng nhập!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
        
        if(action.equals("edit")){
            String userid = request.getParameter("userid");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String namsinh = request.getParameter("namsinh");
            String adress = request.getParameter("adress");
            
            HttpSession session = request.getSession();
            Users user = (Users)session.getAttribute("user");
            
            if(user!=null){
                udao.updateProfile(userid, name, namsinh, email, adress);
                Users updateuser = udao.loginUsers(user.getUsername(), user.getPassword());
                session.setAttribute("user", updateuser);
            }
            response.sendRedirect("Profile.jsp");
        }
        
        if(action.equals("changepass")){
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");
            String newpass = request.getParameter("newpass");
            String repass = request.getParameter("repass");
            
            HttpSession session = request.getSession();
            Users user = (Users)session.getAttribute("user");
            
            if(user!=null && newpass.equals(repass)){
                udao.changePass(userid, newpass);
                Users updateuser = udao.loginUsers(user.getUsername(), newpass);
                session.setAttribute("user", updateuser);
            }
            response.sendRedirect("Profile.jsp");
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
