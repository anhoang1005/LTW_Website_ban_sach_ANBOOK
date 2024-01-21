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
import model.Publisher;

/**
 *
 * @author Hoang Van An
 */
public class PublisherDAO {
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
    
    public List<Publisher> getAllPublisher(){
        List<Publisher> list = new ArrayList<>();
        String query = "SELECT * FROM Publisher";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Publisher(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Publisher getPublisher(String bookid){
        String query = "SELECT Publisher.*\n"
                + "FROM Publisher\n"
                + "INNER JOIN Book ON Book.publisherid = Publisher.id\n"
                + "WHERE Book.id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            rs = ps.executeQuery();
            if (rs.next()) {
                Publisher p = new Publisher(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        PublisherDAO pdao = new PublisherDAO();
        List<Publisher> list = pdao.getAllPublisher();
        for(Publisher p : list){
            System.err.println(p.getName());
        }
        System.err.println(pdao.getPublisher("1").getName());
    }
}
