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
import model.Notifications;

/**
 *
 * @author Hoang Van An
 */
public class NotificationsDAO extends DBContext{
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
    public void insertNotificationOneUser(String userid, String image, String message){
        String query = "INSERT INTO Notifications (userid, images, message)\n"
                + "VALUES (?, ?, ?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userid);
            ps.setString(2, image);
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public void insertNotificationAllUser(String image, String message){
        String query = "INSERT INTO Notifications (userid, message)\n"
                + "SELECT id, ?, ? FROM Users;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, image);
            ps.setString(2, message);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public List<Notifications> getNotificationsbyuserid(int userid){
        List<Notifications> list = new ArrayList<>();
        String query = "SELECT id, images, message, isread, FORMAT(createdAt, 'HH:mm dd/MM/yyyy') AS formattedCreatedAt\n"
                + "FROM Notifications\n"
                + "WHERE userid = ?\n"
                + "ORDER BY id DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Notifications(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5)));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        NotificationsDAO ndao = new NotificationsDAO();
        List<Notifications> listN = ndao.getNotificationsbyuserid(1);
        for(Notifications n : listN){
            System.err.println(n.getCreateAt());
        }
    }
}
