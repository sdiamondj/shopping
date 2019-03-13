package cn.edu.ncu.shopping.entity;

public class Order {
    private long order_id;
    private long customer_id;
    private String order_generatedTime;
    private int order_status;
    private double fare;
    private double order_count;
    private String order_picture;
    private String order_address;
    private long merchant_id;

    public long getMerchant_id() {
        return merchant_id;
    }

    public void setMerchant_id(long merchant_id) {
        this.merchant_id = merchant_id;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }

    public String getOrder_picture() {
        return order_picture;
    }

    public double getOrder_count() {
        return order_count;
    }

    public void setOrder_count(double order_count) {
        this.order_count = order_count;
    }

    public void setOrder_picture(String order_picture) {
        this.order_picture = order_picture;
    }

    public long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(long order_id) {
        this.order_id = order_id;
    }

    public long getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(long customer_id) {
        this.customer_id = customer_id;
    }

    public String getOrder_generatedTime() {
        return order_generatedTime;
    }

    public void setOrder_generatedTime(String order_generatedTime) {
        this.order_generatedTime = order_generatedTime;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public double getPay_count() {
        return order_count;
    }

    public void setPay_count(double pay_count) {
        this.order_count = pay_count;
    }
}
