/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.jar.Attributes;

/**
 *
 * @author Hoang Van An
 */
public class Users {
    private int id;
    private String name, namsinh, email, sdt, adress, username, password, role;
    
    public Users(){
        super();
    }

    public Users(int id, String name, String namsinh, String email, String sdt, String adress, String username, String password, String role) {
        this.id = id;
        this.name = name;
        this.namsinh = namsinh;
        this.email = email;
        this.sdt = sdt;
        this.adress = adress;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNamsinh() {
        return namsinh;
    }

    public void setNamsinh(String namsinh) {
        this.namsinh = namsinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", name=" + name + ", namsinh=" + namsinh + ", email=" + email + ", sdt=" + sdt + ", adress=" + adress + ", username=" + username + ", password=" + password + ", role=" + role + '}';
    }
    
    
}
