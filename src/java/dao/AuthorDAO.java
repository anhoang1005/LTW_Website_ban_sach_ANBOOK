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
import model.Author;
import model.Category;

/**
 *
 * @author Hoang Van An
 */
public class AuthorDAO {
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
    
    public List<Author> getAllAuthor(){
        List<Author> list = new ArrayList<>();
        String query = "SELECT * FROM Author";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Author(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Author getAuthor(String bookid){
        String query = "SELECT Author.*\n"
                + "FROM Author\n"
                + "INNER JOIN Book ON Book.authorid = Author.id\n"
                + "WHERE Book.id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            rs = ps.executeQuery();
            if (rs.next()) {
                Author a = new Author(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        AuthorDAO adao = new AuthorDAO();
        List<Author> list = adao.getAllAuthor();
        for(Author a: list){
            System.err.println(a.getName() + " " + a.getNamsinh());
        }
        System.err.println(adao.getAuthor("1").getName());
    }
}
