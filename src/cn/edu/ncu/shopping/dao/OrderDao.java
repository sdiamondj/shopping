package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    List<Order> getOrderByCid(@Param("customer_id")long customer_id);

    int submitOrder(@Param("customer_id")long customer_id,
                    @Param("order_count")double order_count,
                    @Param("order_address")String order_address,
                    @Param("merchant_id")long merchant_id);

    int addOrderPicture(@Param("order_id")long order_id,@Param("order_picture")String order_picture);

    Order getLastOrder();

    Order getOrder(@Param("order_id")long order_id);

    List<Order> getOrderByStatus(@Param("status")String status,@Param("customer_id")long customer_id);

    List<Order> getOrderByStatusMerchant(@Param("status")String status,@Param("merchant_id")long merchant_id);

    int changeOrderStatus(@Param("order_id")long order_id,@Param("status")int status);

    List<Order> getOrderByMId(@Param("merchant_id")long merchant_id);

    List<Order> getAllOrder();

    int delete(@Param("order_id")long order_id);


}
