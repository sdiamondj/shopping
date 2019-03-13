package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.ProductCommentDao;
import cn.edu.ncu.shopping.entity.ProductComment;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCommentService {
    @Autowired
    private ProductCommentDao productCommentDao;

    public List<ProductComment> getPC(@Param("product_id")long product_id){
        return productCommentDao.getPC(product_id);
    }

    public ProductComment checkIsComment(@Param("order_id")long order_id,@Param("product_id")long product_id){
        return productCommentDao.checkIsComment(order_id,product_id);
    }

    public int submitComment(@Param("order_id")long order_id,@Param("customer_id")long customer_id,
                             @Param("customer_name")String customer_name,
                             @Param("product_id")long product_id,@Param("comment_score")int comment_score,
                             @Param("comment_content")String comment_content){
        return productCommentDao.submitComment(order_id, customer_id, customer_name, product_id, comment_score, comment_content);
    }

    public int isAllBeCommented(@Param("order_id")long order_id){
        return productCommentDao.isAllBeCommented(order_id);
    }
}
