package model;

import java.io.InputStream;

public class BookBean {
    private String item_code;
    private String title;
    private String author;
    private String publisher;
    private double price;
    private int quantity;
    private InputStream coverImage;

    public String getItem_code() { return item_code; }
    public void setItem_code(String item_code) { this.item_code = item_code; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public InputStream getCoverImage() { return coverImage; }
    public void setCoverImage(InputStream coverImage) { this.coverImage = coverImage; }
}
