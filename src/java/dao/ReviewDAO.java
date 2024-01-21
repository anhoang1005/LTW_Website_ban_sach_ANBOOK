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
import model.Review;

/**
 *
 * @author Hoang Van An
 */
public class ReviewDAO extends DBContext{
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
    
    public List<Review> getReviewbyBookid(String bookid){
        List<Review> list = new ArrayList<>();
        String query = "SELECT\n"
                + "    R.id,\n"
                + "    U.username,\n"
                + "    R.date,\n"
                + "    R.rating,\n"
                + "    R.comment,\n"
                + "    R.image,\n"
                + "    R.[like]\n"
                + "FROM Review R\n"
                + "LEFT JOIN Users U ON R.userid = U.id\n"
                + "LEFT JOIN Book B ON R.bookid = B.id\n"
                + "WHERE B.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Review(rs.getInt(1), 
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getInt(7)));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }
    
    public Review getReviewbyUseridandBookid(String bookid, int userid){
        String query = "SELECT\n"
                + "    R.id,\n"
                + "    U.username,\n"
                + "    R.date,\n"
                + "    R.rating,\n"
                + "    R.comment,\n"
                + "    R.image,\n"
                + "    R.[like]\n"
                + "FROM Review R\n"
                + "LEFT JOIN Users U ON R.userid = U.id\n"
                + "LEFT JOIN Book B ON R.bookid = B.id\n"
                + "WHERE B.id = ? AND U.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            ps.setInt(2, userid);
            rs = ps.executeQuery();
            if(rs.next()){
                Review r = new Review(rs.getInt(1), 
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getInt(7));
                return r;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;
    }
    
    public void insertBookReview(String bookid, String userid, String date, String rating, String comment, String image){
        String query = "INSERT INTO [dbo].[Review]\n"
                + "           ([bookid]\n"
                + "           ,[userid]\n"
                + "           ,[date]\n"
                + "           ,[rating]\n"
                + "           ,[comment]\n"
                + "           ,[image]\n"
                + "           ,[like])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?)";
        int k = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            ps.setString(2, userid);
            ps.setString(3, date);
            ps.setString(4, rating);
            ps.setString(5, comment);
            ps.setString(6, image);
            ps.setInt(7, k);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public void updateBookReview(String bookid, String userid, String rating, String comment, String image){
        String query = "UPDATE [dbo].[Review]\n"
                + "   SET [rating] = ?\n"
                + "      ,[comment] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE bookid = ? AND userid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, rating);
            ps.setString(2, comment);
            ps.setString(3, image);
            ps.setString(4, bookid);
            ps.setString(5, userid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public void deleteBookReview(String bookid, String userid){
        String query = "DELETE FROM [dbo].[Review]\n"
                + "      WHERE bookid = ? AND userid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookid);
            ps.setString(2, userid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public static void main(String[] args) {
        ReviewDAO rdao = new ReviewDAO();
        Review r = rdao.getReviewbyUseridandBookid("1", 8);
            rdao.updateBookReview("1", "8", "1", "qqqqqqqqq", "chuaco");
        System.err.println(r.getComment());
    }
}
