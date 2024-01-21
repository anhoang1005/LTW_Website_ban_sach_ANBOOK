/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;


/**
 *
 * @author Hoang Van An
 */
public class Cart {
    private Book book;
    private int quantity;
    private long totalprice;
    
    public Cart(){
        super();
    }

    public Cart(Book book, int quantity) {
        this.book = book;
        this.quantity = quantity;
        this.totalprice = book.getPrice()*quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(long totalprice) {
        this.totalprice = totalprice;
    }

    
    
}
