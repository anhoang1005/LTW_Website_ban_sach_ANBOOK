/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Category;

/**
 *
 * @author Hoang Van An
 */
public class BookDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
    }
    
    public List<Book> getAllBook(){
        List<Book> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    B.id,\n"
                + "    B.title,\n"
                + "    B.image,\n"
                + "    C.name AS catename,\n"
                + "    A.name AS authorname,\n"
                + "    P.name AS publishername,\n"
                + "    B.publishdate,\n"
                + "    B.pagecount,\n"
                + "    B.des,\n"
                + "    B.price,\n"
                + "    B.soldcount,\n"
                + "    B.quantity\n"
                + "FROM Book B\n"
                + "LEFT JOIN Category C ON B.cateid = C.id\n"
                + "LEFT JOIN Author A ON B.authorid = A.id\n"
                + "LEFT JOIN Publisher P ON B.publisherid = P.id;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1),
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getInt(8), 
                        rs.getString(9), 
                        rs.getInt(10), 
                        rs.getInt(11), 
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Book getLastBook(){
        String query = "SELECT TOP 1\n"
                + "    B.id,\n"
                + "    B.title,\n"
                + "    B.image,\n"
                + "    C.name AS catename,\n"
                + "    A.name AS authorname,\n"
                + "    P.name AS publishername,\n"
                + "    B.publishdate,\n"
                + "    B.pagecount,\n"
                + "    B.des,\n"
                + "    B.price,\n"
                + "    B.soldcount,\n"
                + "    B.quantity\n"
                + "FROM Book B\n"
                + "LEFT JOIN Category C ON B.cateid = C.id\n"
                + "LEFT JOIN Author A ON B.authorid = A.id\n"
                + "LEFT JOIN Publisher P ON B.publisherid = P.id\n"
                + "ORDER BY B.id DESC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                Book b = new Book(rs.getInt(1),
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getInt(8), 
                        rs.getString(9), 
                        rs.getInt(10), 
                        rs.getInt(11), 
                        rs.getInt(12));
                return b;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Book getBookDetail(String bookid){
        String query = "SELECT\n"
                + "    B.id,\n"
                + "    B.title,\n"
                + "    B.image,\n"
                + "    C.name AS catename,\n"
                + "    A.name AS authorname,\n"
                + "    P.name AS publishername,\n"
                + "    B.publishdate,\n"
                + "    B.pagecount,\n"
                + "    B.des,\n"
                + "    B.price,\n"
                + "    B.soldcount,\n"
                + "    B.quantity\n"
                + "FROM Book B\n"
                + "LEFT JOIN Category C ON B.cateid = C.id\n"
                + "LEFT JOIN Author A ON B.authorid = A.id\n"
                + "LEFT JOIN Publisher P ON B.publisherid = P.id\n"
                + "WHERE B.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            rs = ps.executeQuery();
            if (rs.next()) {
                Book b = new Book(rs.getInt(1),
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getInt(8), 
                        rs.getString(9), 
                        rs.getInt(10), 
                        rs.getInt(11), 
                        rs.getInt(12));
                return b;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        BookDAO bdao = new BookDAO();
        
        List<Book> list = bdao.getAllBook();
        for(Book b: list){
            System.err.println(b.getImage());
        }
        System.out.println(bdao.getBookDetail("2").getTitle());
    }
}
