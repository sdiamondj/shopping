package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Cart;
import cn.edu.ncu.shopping.entity.OrderProduct;
import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderProductDao {
    int submitOrderProduct(@Param("order_id")long order_id, @Param("product")Product product,
                           @Param("product_count")int product_count,
                           @Param("merchant_name")String merchant_name);

    List<OrderProduct> getOrderProduct(@Param("order_id")long order_id);

    int delete(@Param("order_id")long order_id);
}
