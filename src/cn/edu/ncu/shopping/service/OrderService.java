package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.OrderDao;
import cn.edu.ncu.shopping.entity.Order;
import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;

    public List<Order> getOrderByCid(@Param("customer_id")long customer_id){
        return orderDao.getOrderByCid(customer_id);
    }

    public int submitOrder(@Param("customer_id")long customer_id,
                           @Param("order_count")double order_count,
                           @Param("order_address")String order_address,
                           @Param("merchant_id")long merchant_id){
        return orderDao.submitOrder(customer_id,order_count,order_address,merchant_id);
    }

    public int addOrderPicture(@Param("order_id")long order_id,@Param("order_picture")String order_picture){
        return orderDao.addOrderPicture(order_id,order_picture);
    }

    public Order getLastOrder(){
        return orderDao.getLastOrder();
    }

    public List<Order> getOrderByStatus(@Param("status")String status,@Param("customer_id")long customer_id){
        return orderDao.getOrderByStatus(status,customer_id);
    }

    public Order getOrder(@Param("order_id")long order_id){
        return orderDao.getOrder(order_id);
    }

    public int changeOrderStatus(@Param("order_id")long order_id,@Param("status")int status){
        return orderDao.changeOrderStatus(order_id,status);
    }

    public List<Order> getOrderByMId(@Param("merchant_id")long merchant_id){
        return  orderDao.getOrderByMId(merchant_id);
    }

    public List<Order> getOrderByStatusMerchant(@Param("status")String status,@Param("merchant_id")long merchant_id){
        return orderDao.getOrderByStatusMerchant(status,merchant_id);
    }

    public List<Order> getAllOrder(){
        return orderDao.getAllOrder();
    }

    public  int delete(@Param("order_id")long order_id){
        return orderDao.delete(order_id);
    }
}
