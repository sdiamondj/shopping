package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.AdminDao;
import cn.edu.ncu.shopping.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    public Admin adminLogin(@Param("admin_name")String admin_name, @Param("admin_pwd")String admin_pwd,
                            @Param("code")String code){
        return adminDao.adminLogin(admin_name,admin_pwd,code);
    }

    public Admin getAdminByName(@Param("admin_name")String admin_name){
        return adminDao.getAdminByName(admin_name);
    }

    public Admin getAdminById(@Param("admin_id")long admin_id){
        return adminDao.getAdminById(admin_id);
    }


}
