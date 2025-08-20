package model;

public class BillItemBean {
    private String item_code;
    private String title_name;
    private double price_value;
    private int quantity_purchased;
    private double line_total;

    // Getters and setters
    public String getItem_code() { return item_code; }
    public void setItem_code(String item_code) { this.item_code = item_code; }

    public String getTitle_name() { return title_name; }
    public void setTitle_name(String title_name) { this.title_name = title_name; }

    public double getPrice_value() { return price_value; }
    public void setPrice_value(double price_value) { this.price_value = price_value; }

    public int getQuantity_purchased() { return quantity_purchased; }
    public void setQuantity_purchased(int quantity_purchased) { this.quantity_purchased = quantity_purchased; }

    public double getLine_total() { return line_total; }
    public void setLine_total(double line_total) { this.line_total = line_total; }
}
