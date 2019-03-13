package cn.edu.ncu.shopping.entity;

public class Merchant {
    private long merchant_id;
    private String merchant_name;
    private String merchant_pwd;
    private String merchant_phone;
    private String merchant_province;
    private String merchant_address;
    private String merchant_category;
    private int merchant_status;
    private String merchant_regTime;

    public long getMerchant_id() {
        return merchant_id;
    }

    public void setMerchant_id(long merchant_id) {
        this.merchant_id = merchant_id;
    }

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public String getMerchant_pwd() {
        return merchant_pwd;
    }

    public void setMerchant_pwd(String merchant_pwd) {
        this.merchant_pwd = merchant_pwd;
    }

    public String getMerchant_phone() {
        return merchant_phone;
    }

    public void setMerchant_phone(String merchant_phone) {
        this.merchant_phone = merchant_phone;
    }

    public String getMerchant_province() {
        return merchant_province;
    }

    public void setMerchant_province(String merchant_province) {
        this.merchant_province = merchant_province;
    }

    public String getMerchant_address() {
        return merchant_address;
    }

    public void setMerchant_address(String merchant_address) {
        this.merchant_address = merchant_address;
    }

    public String getMerchant_category() {
        return merchant_category;
    }

    public void setMerchant_category(String merchant_category) {
        this.merchant_category = merchant_category;
    }

    public int getMerchant_status() {
        return merchant_status;
    }

    public void setMerchant_status(int merchant_status) {
        this.merchant_status = merchant_status;
    }

    public String getMerchant_regTime() {
        return merchant_regTime;
    }

    public void setMerchant_regTime(String merchant_regTime) {
        this.merchant_regTime = merchant_regTime;
    }
}
