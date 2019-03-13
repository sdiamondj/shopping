package cn.edu.ncu.shopping.entity;


//顾客实体类
public class Customer {
    //对应数据库中表的所有字段(数据类型可与数据库中存储的不一样)
    private long customer_id;
    private String customer_name;
    private String customer_pwd;
    private String customer_trueName;
    private int customer_VIP;
    private String customer_phone;
    private String customer_email;
    private String customer_province;
    private String customer_city;
    private String customer_address;
    private String customer_regTime;
    private int customer_age;
    private String customer_sex;

    public void setCustomer_province(String customer_province) {
        this.customer_province = customer_province;
    }

    //以下所有方法由IDEA快捷生成
    public int getCustomer_age() {
        return customer_age;
    }

    public void setCustomer_age(int customer_age) {
        this.customer_age = customer_age;
    }

    public String getCustomer_sex() {
        return customer_sex;
    }

    public void setCustomer_sex(String customer_sex) {
        this.customer_sex = customer_sex;
    }

    public long getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(long customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_pwd() {
        return customer_pwd;
    }

    public void setCustomer_pwd(String customer_pwd) {
        this.customer_pwd = customer_pwd;
    }

    public String getCustomer_trueName() {
        return customer_trueName;
    }

    public void setCustomer_trueName(String customer_trueName) {
        this.customer_trueName = customer_trueName;
    }

    public int getCustomer_VIP() {
        return customer_VIP;
    }

    public void setCustomer_VIP(int customer_VIP) {
        this.customer_VIP = customer_VIP;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    public String getCustomer_province() {
        return customer_province;
    }

    public void setCustomer_provice(String customer_province) {
        this.customer_province = customer_province;
    }

    public String getCustomer_city() {
        return customer_city;
    }

    public void setCustomer_city(String customer_city) {
        this.customer_city = customer_city;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public String getCustomer_regTime() {
        return customer_regTime;
    }

    public void setCustomer_regTime(String customer_regTime) {
        this.customer_regTime = customer_regTime;
    }
}
