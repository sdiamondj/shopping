package cn.edu.ncu.shopping.entity;

//商品类
public class Product {
    private long product_id;
    private long merchant_id;
    private String product_name;
    private String product_category;
    private int product_status;
    private double product_market_price;
    private String product_picture;
    private String product_description;
    private int product_comment_count;
    private int product_sell_count;
    private String product_addedTime;
    private String merchant_name;
    private String product_subheading;

    public String getProduct_subheading() {
        return product_subheading;
    }

    public void setProduct_subheading(String product_subheading) {
        this.product_subheading = product_subheading;
    }

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(long product_id) {
        this.product_id = product_id;
    }

    public long getMerchant_id() {
        return merchant_id;
    }

    public void setMerchant_id(long merchant_id) {
        this.merchant_id = merchant_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public int getProduct_status() {
        return product_status;
    }

    public void setProduct_status(int product_status) {
        this.product_status = product_status;
    }

    public double getProduct_market_price() {
        return product_market_price;
    }

    public void setProduct_market_price(double product_market_price) {
        this.product_market_price = product_market_price;
    }

    public String getProduct_picture() {
        return product_picture;
    }

    public void setProduct_picture(String product_picture) {
        this.product_picture = product_picture;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public int getProduct_comment_count() {
        return product_comment_count;
    }

    public void setProduct_comment_count(int product_comment_count) {
        this.product_comment_count = product_comment_count;
    }

    public int getProduct_sell_count() {
        return product_sell_count;
    }

    public void setProduct_sell_count(int product_sell_count) {
        this.product_sell_count = product_sell_count;
    }

    public String getProduct_addedTime() {
        return product_addedTime;
    }

    public void setProduct_addedTime(String product_addedTime) {
        this.product_addedTime = product_addedTime;
    }
}
