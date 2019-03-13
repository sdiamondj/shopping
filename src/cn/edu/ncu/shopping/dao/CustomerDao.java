package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Customer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//顾客接口
@Repository
public interface CustomerDao {
    //这里面定义需要用到的方法

    Customer getCustomerByName(@Param("customer_name")String customer_name);

    Customer getCustomerById(@Param("customer_id")long customer_id);

    //登录
    Customer customerLogin(@Param("customer_name")String customer_name,@Param("customer_pwd")String customer_pwd,
                           @Param("code")String code);

    //注册(insert的返回值是int)
    int customerRegister(@Param("customer_name")String customer_name,@Param("customer_pwd")String customer_pwd,
                         @Param("customer_phone")String customer_phone);
    //判断用户名和手机号是否已经被注册
    Customer isRegistered(@Param("customer_sth")String customer_sth);

    int updateSelfInfo(@Param("customer_id")long customer_id,@Param("customer_pwd")String customer_pwd,
                       @Param("customer_trueName")String customer_trueName,
                       @Param("customer_sex")String customer_sex,@Param("customer_age")String customer_age,
                       @Param("customer_phone")String customer_phone,
                       @Param("customer_province")String customer_province,
                       @Param("customer_city")String customer_city);

    int changeVIPStatus(@Param("customer_id")long customer_id,@Param("VIP")int VIP);

    List<Customer> getAllCustomer();

    List<Customer> getAllVIP();

    int delete(@Param("customer_id")long customer_id);
}
