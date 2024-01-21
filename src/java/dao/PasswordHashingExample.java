/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordHashingExample {
    public static void main(String[] args) {
        // Mật khẩu của người dùng
        String rawPassword = "000000";

        // Băm mật khẩu
        String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

        // In ra mật khẩu đã băm
        System.out.println("Mật khẩu đã băm: " + hashedPassword);

        // Kiểm tra mật khẩu
        String candidatePassword = "000000"; // Mật khẩu người dùng nhập vào để kiểm tra
        if (BCrypt.checkpw(candidatePassword, hashedPassword)) {
            System.out.println("Mật khẩu chính xác!");
        } else {
            System.out.println("Mật khẩu không chính xác!");
        }
    }
}
