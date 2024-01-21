/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Van An
 */
public class Author {
    private int id;
    private String name, gioitinh, namsinh, des;
    
    public Author(){
        super();
    }

    public Author(int id, String name, String gioitinh, String namsinh, String des) {
        this.id = id;
        this.name = name;
        this.gioitinh = gioitinh;
        this.namsinh = namsinh;
        this.des = des;
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

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getNamsinh() {
        return namsinh;
    }

    public void setNamsinh(String namsinh) {
        this.namsinh = namsinh;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "Author{" + "id=" + id + ", name=" + name + ", gioitinh=" + gioitinh + ", namsinh=" + namsinh + ", des=" + des + '}';
    }
    
    
}
