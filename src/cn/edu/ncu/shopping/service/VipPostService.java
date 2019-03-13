package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.VipPostDao;
import cn.edu.ncu.shopping.entity.VipPost;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipPostService {
    @Autowired
    private VipPostDao vipPostDao;

    public int addPost(@Param("customer_id")long customer_id, @Param("customer_name")String customer_name,
                       @Param("post_title")String post_title, @Param("post_content")String post_content){
        return vipPostDao.addPost(customer_id, customer_name, post_title, post_content);
    }

    public List<VipPost> getAllPost(){
        return vipPostDao.getAllPost();
    }
}
