package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.CartDao;
import cn.edu.ncu.shopping.entity.Cart;
import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    @Autowired
    CartDao cartDao;

    public int addToCart(@Param("product") Product product,
                         @Param("customer_id")long customer_id,
                         @Param("merchant_id")long merchant_id){
        //System.out.println("Service"+product+" "+customer_id);
        return cartDao.addToCart(product,customer_id,merchant_id);
    }

    public Cart isAdded(@Param("customer_id")long customer_id,
                        @Param("product_id")long product_id){
        return cartDao.isAdded(customer_id,product_id);
    }

    public List<Cart> getAllCart(@Param("customer_id")long customer_id){
        return cartDao.getAllCart(customer_id);
    }

    public int updateCartCount(@Param("product_count")int product_count,
                               @Param("product_total_price")double product_total_price,
                               @Param("cart_id")long cart_id){
        //System.out.println("service"+" "+product_count+" "+product_total_price+" "+cart_id);
        return cartDao.updateCartCount(product_count,product_total_price,cart_id);
    }

    public int deleteCart(@Param("customer_id")long customer_id){
        return cartDao.deleteCart(customer_id);
    }

    public int deleteFromCart(@Param("cart_id")long cart_id){
        return cartDao.deleteFromCart(cart_id);
    }
}
