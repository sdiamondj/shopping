package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.CustomerDao;
import cn.edu.ncu.shopping.entity.Customer;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    //这里别忘了
    @Autowired
    private CustomerDao customerDao;

    //所有在Dao定义的方法(返回Dao.该方法)
    public Customer customerLogin(@Param("customer_name")String customer_name, @Param("customer_pwd")String customer_pwd,
                                  @Param("code")String code){
        return customerDao.customerLogin(customer_name,customer_pwd,code);
    }

    public Customer getCustomerById(@Param("customer_id")long customer_id){
        return customerDao.getCustomerById(customer_id);
    }

    public int customerRegister(@Param("customer_name")String customer_name,@Param("customer_pwd")String customer_pwd,
                                @Param("customer_phone")String customer_phone){
        return customerDao.customerRegister(customer_name,customer_pwd,customer_phone);
    }

    public Customer isRegistered(@Param("customer_sth")String customer_sth){
        return customerDao.isRegistered(customer_sth);
    }

    public Customer getCustomerByName(@Param("customer_name")String customer_name){
        return customerDao.getCustomerByName(customer_name);
    }

    public int updateSelfInfo(@Param("customer_id")long customer_id,@Param("customer_pwd")String customer_pwd,
                              @Param("customer_trueName")String customer_trueName,
                              @Param("customer_sex")String customer_sex,@Param("customer_age")String customer_age,
                              @Param("customer_phone")String customer_phone,
                              @Param("customer_province")String customer_province,
                              @Param("customer_city")String customer_city){
        return customerDao.updateSelfInfo(customer_id, customer_pwd, customer_trueName, customer_sex, customer_age, customer_phone, customer_province, customer_city);
    }

    public int changeVIPStatus(@Param("customer_id")long customer_id,@Param("VIP")int VIP){
        return customerDao.changeVIPStatus(customer_id,VIP);
    }

    public List<Customer> getAllCustomer(){
        return customerDao.getAllCustomer();
    }

    public List<Customer> getAllVIP(){
        return customerDao.getAllVIP();
    }

    public int delete(@Param("customer_id")long customer_id){
        return customerDao.delete(customer_id);
    }
}
