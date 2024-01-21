/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Hoang Van An
 */
public class Validate {
    public boolean checkPhoneNumber(String phonenumber){
        String reg = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
        return phonenumber.matches(reg);
    }
    
    public boolean checkEmail(String email){
        String reg = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        return email.matches(reg);
    }
    
    public boolean checkName(String name){
        String reg = "^[a-zA-Z][a-zA-Z\\s]{0,20}[a-zA-Z]$";
        return name.matches(reg);
    }
    
    public boolean checkUsername(String username){
        String reg = "^[a-z0-9._-]{6,15}";
        return username.matches(reg);
    }
    
    public boolean checkPassword(String password){
        String reg = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";
        return password.matches(reg);
    }
    
    public boolean checkDate(String date){
        String reg = "^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[0-2])/(19|20)\\d\\d$";
        return date.matches(reg);
    }
    
    public static void main(String[] args) {
        Validate vli = new Validate();
        String tel = "05820663071";
        String email = "vananhoang10052002@gmail.com";
        String name = "Hoang Van An";
        String date = "1/01/2002";
        String username = "anhan10052002";
        String password = "Anhan10052002@";
        
        System.err.println(vli.checkPassword("P@ssw0rd"));
    }
}
