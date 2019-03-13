package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.VipPost;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VipPostDao {

    int addPost(@Param("customer_id")long customer_id,@Param("customer_name")String customer_name,
                @Param("post_title")String post_title,@Param("post_content")String post_content);

    List<VipPost> getAllPost();
}
