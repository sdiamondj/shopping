package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public interface AdminDao {

    Admin getAdminByName(@Param("admin_name") String admin_name);

    Admin getAdminById(@Param("admin_id") long admin_id);
    
    Admin adminLogin(@Param("admin_name") String admin_name, @Param("admin_pwd") String admin_pwd,
                     @Param("code") String code);
}
