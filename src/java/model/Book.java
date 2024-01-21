/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Van An
 */
public class Book {
    private int bookid;
    private String title;
    private String image;
    private String catename;
    private String authorname;
    private String publishername;
    private String publishdate;
    private int pagecount;
    private String des;
    private long price;
    private int soldcount;
    private int quantity;
    
    public Book(){
        super();
    }

    public Book(int bookid, String title, String image, String catename, String authorname, String publishername, String publishdate, int pagecount, String des, long price, int soldcount, int quantity) {
        this.bookid = bookid;
        this.title = title;
        this.image = image;
        this.catename = catename;
        this.authorname = authorname;
        this.publishername = publishername;
        this.publishdate = publishdate;
        this.pagecount = pagecount;
        this.des = des;
        this.price = price;
        this.soldcount = soldcount;
        this.quantity = quantity;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }

    public String getPublishername() {
        return publishername;
    }

    public void setPublishername(String publishername) {
        this.publishername = publishername;
    }

    public String getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
    }

    public int getPagecount() {
        return pagecount;
    }

    public void setPagecount(int pagecount) {
        this.pagecount = pagecount;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public int getSoldcount() {
        return soldcount;
    }

    public void setSoldcount(int soldcount) {
        this.soldcount = soldcount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Book{" + "bookid=" + bookid + ", title=" + title + ", image=" + image + ", catename=" + catename + ", authorname=" + authorname + ", publishername=" + publishername + ", publishdate=" + publishdate + ", pagecount=" + pagecount + ", des=" + des + ", price=" + price + ", soldcount=" + soldcount + ", quantity=" + quantity + '}';
    }

    
}
