package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.ProductComment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductCommentDao {

    List<ProductComment> getPC(@Param("product_id")long product_id);

    ProductComment checkIsComment(@Param("order_id")long order_id,@Param("product_id")long product_id);

    int submitComment(@Param("order_id")long order_id,@Param("customer_id")long customer_id,
                      @Param("customer_name")String customer_name,
                      @Param("product_id")long product_id,@Param("comment_score")int comment_score,
                      @Param("comment_content")String comment_content);

    int isAllBeCommented(@Param("order_id")long order_id);
}
