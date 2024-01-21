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
import model.Users;

/**
 *
 * @author Hoang Van An
 */
public class UsersDAO extends DBContext{
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
    
    //Lay tat ca thong tin user
    public List<Users> getAllUsers(){
        List<Users> list = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8), 
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    //Dang nhap tai khoan
    public Users loginUsers(String user, String pass){
        String query = "SELECT * FROM Users\n"
                + "WHERE username = ? AND password = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if(rs.next()){
                Users u = new Users(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8), 
                        rs.getString(9));
                return u;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;
    }
    
    //Dang ki tai khoan moi
    public boolean registerUsers(String name, String namsinh, String tel, String email, String adress, String username, String password, String role) {
        String query = "INSERT INTO [dbo].[Users]\n"
                + "           ([name]\n"
                + "           ,[namsinh]\n"
                + "           ,[email]\n"
                + "           ,[sdt]\n"
                + "           ,[address]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[role])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, namsinh);
            ps.setString(3, email);
            ps.setString(4, tel);
            ps.setString(5, adress);
            ps.setString(6, username);
            ps.setString(7, password);
            ps.setString(8, role);
            int rowsAffected = ps.executeUpdate(); // Sử dụng executeUpdate() thay vì executeQuery()
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng được thêm vào cơ sở dữ liệu
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            closeResources();
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
        return false;
    }
    
    //Kiem tra ten dang nhap dang ki co bi trung khong
    public boolean checkAccount(String username){
        String query = "SELECT * FROM Users\n"
                + "WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return false;
    }
    
    //Kiem tra sdt dang ki co bi trung khong
    public boolean checkPhoneNumber(String tel){
        String query = "SELECT * FROM Users\n"
                + "WHERE sdt = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, tel);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return false;
    }
    
    public void updateProfile(String userid, String name, String namsinh, String email, String adress){
        String query = "UPDATE [dbo].[Users]\n"
                + "   SET [name] = ?\n"
                + "      ,[namsinh] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, namsinh);
            ps.setString(3, email);
            ps.setString(4, adress);
            ps.setString(5, userid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public void changePass(String userid, String newpass){
        String query = "UPDATE [dbo].[Users]\n"
                + "   SET [password] = ?\n"
                + " WHERE id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newpass);
            ps.setString(2, userid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public static void main(String[] args) {
        UsersDAO udao = new UsersDAO();
        List<Users> list = udao.getAllUsers();
        //for(Users u : list){
        //    System.err.println(u.getId() + " " + u.getName() + " " + u.getUsername());
        //}
        //Users a = udao.loginUsers("anhoang", "000000");
        //System.out.println(a.getAdress());
        //System.err.println(udao.registerUsers("Le Bao", "20/10/2001", "0234567891", "baole@gmail.com", "Thanh Tri", "baole123", "123456", "Customer"));
        //System.err.println(udao.checkPhoneNumber("0867865001"));
        //udao.updateProfile("9", "Sang2", "2004-02-10", "sang@gmail.com", "Ha Noi");
        udao.changePass("9", "987654");
    }
}
