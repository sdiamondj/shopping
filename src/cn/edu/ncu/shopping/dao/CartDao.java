package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Cart;
import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDao {
    int addToCart(@Param("product")Product product,@Param("customer_id")long customer_id,
                  @Param("merchant_id")long merchant_id);

    Cart isAdded(@Param("customer_id")long customer_id,@Param("product_id")long product_id);

    List<Cart> getAllCart(@Param("customer_id")long customer_id);

    int updateCartCount(@Param("product_count")int product_count,
                        @Param("product_total_price")double product_total_price,
                        @Param("cart_id")long cart_id);

    int deleteCart(@Param("customer_id")long customer_id);

    int deleteFromCart(@Param("cart_id")long cart_id);
}
