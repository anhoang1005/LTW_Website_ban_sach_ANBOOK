/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Van An
 */
public class Review {
    private int reviewid;
    private String username;
    private String date;
    private int rating;
    private String comment;
    private String image;
    private int like;
    
    public Review(){
        super();
    }

    public Review(int reviewid, String username, String date, int rating, String comment, String image, int like) {
        this.reviewid = reviewid;
        this.username = username;
        this.date = date;
        this.rating = rating;
        this.comment = comment;
        this.image = image;
        this.like = like;
    }

    public int getReviewid() {
        return reviewid;
    }

    public void setReviewid(int reviewid) {
        this.reviewid = reviewid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    @Override
    public String toString() {
        return "Review{" + "reviewid=" + reviewid + ", username=" + username + ", date=" + date + ", rating=" + rating + ", comment=" + comment + ", image=" + image + ", like=" + like + '}';
    }

    
    
}
