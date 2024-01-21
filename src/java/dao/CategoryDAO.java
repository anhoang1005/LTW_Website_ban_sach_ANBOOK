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
import model.Users;
/**
 *
 * @author Hoang Van An
 */
public class CategoryDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    //Dong cac lenh connection sql
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
    
    //Lay tat ca thong tin category
    public List<Category> getAllCategory(){
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Category getCategory(String bookid){
        String query = "SELECT Category.*\n"
                + "FROM Category\n"
                + "INNER JOIN Book ON Book.cateid = Category.id\n"
                + "WHERE Book.id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        CategoryDAO cdao = new CategoryDAO();
        List<Category> list = cdao.getAllCategory();
        for(Category c : list){
            System.err.println(c.getName() + " " + c.getDes());
        }
        System.err.println(cdao.getCategory("1").getName());
    }
}
