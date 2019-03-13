package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.OrderProductDao;
import cn.edu.ncu.shopping.entity.Cart;
import cn.edu.ncu.shopping.entity.OrderProduct;
import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderProductService {
    @Autowired
    private OrderProductDao orderProductDao;

    public int submitOrderProduct(@Param("order_id")long order_id,@Param("product")Product product, @Param("product_count")int product_count,@Param("merchant_name")String merchant_name){
        return orderProductDao.submitOrderProduct(order_id,product,product_count,merchant_name);
    }

    public List<OrderProduct> getOrderProduct(@Param("order_id")long order_id){
        return orderProductDao.getOrderProduct(order_id);
    }

    public  int delete(@Param("order_id")long order_id){
        return orderProductDao.delete(order_id);
    }
}
