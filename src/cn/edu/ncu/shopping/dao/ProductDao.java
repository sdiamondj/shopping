package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface ProductDao {
    Product getProductById(@Param("product_id")long product_id);

    List<Product> getProductsByKey(@Param("key")String key,@Param("keyId")long keyId);

    int addProductSellCount(@Param("product_id")long product_id);

    int addProductCommentCount(@Param("product_id")long product_id);

    List<Product> getProductByMId(@Param("merchant_id")long merchant_id);

    List<Product> getAllProduct();

    List<Product> getNew();

    List<Product> getHot();

    List<Product> getExpensive();

    List<Product> getCheap();

    List<Product> getByMN(@Param("merchant_name")String merchant);

    int deleteProduct(@Param("product_id")long product_id);

    int updateSth(@Param("product_name")String product_name,
                  @Param("product_price")String product_price,
                  @Param("product_category")String product_category,
                  @Param("product_description")String product_description,
                  @Param("product_id")long product_id);

    int addProduct(@Param("product_name")String product_name,
                   @Param("product_category")String product_category,
                   @Param("product_market_price")double product_market_price,
                   @Param("product_description")String product_description,
                   @Param("product_picture")String product_picture,
                   @Param("merchant_id")long merchant_id,
                   @Param("merchant_name")String merchant_name,
                   @Param("product_subheading")String product_subheading);

    int updatePicture(@Param("product_picture")String product_picture,@Param("product_id")long product_id);
}
