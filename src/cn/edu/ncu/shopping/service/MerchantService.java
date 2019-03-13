package cn.edu.ncu.shopping.service;


import cn.edu.ncu.shopping.dao.MerchantDao;
import cn.edu.ncu.shopping.entity.Merchant;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MerchantService {
    @Autowired
    private MerchantDao merchantDao;

    public Merchant getMerchantByName(@Param("merchant_name")String merchant_name){
        return merchantDao.getMerchantByName(merchant_name);
    }

    public Merchant getMerchantById(@Param("merchant_id")long merchant_id){
        return merchantDao.getMerchantById(merchant_id);
    }

    public List<Merchant> getMerchantByCategory(@Param("merchant_category")String merchant_category){
        return merchantDao.getMerchantByCategory(merchant_category);
    }

    public List<Merchant> getAllMerchants(){
        return merchantDao.getAllMerchants();
    }

    public Merchant merchantLogin(@Param("merchant_id")String merchant_id,@Param("merchant_pwd")String merchant_pwd){
        return merchantDao.merchantLogin(merchant_id,merchant_pwd);
    }

    public Merchant getMerchantByPhone(@Param("merchant_phone")String merchant_phone){
        return merchantDao.getMerchantByPhone(merchant_phone);
    }

    public int merchantRegister(@Param("merchant_name")String merchant_name,@Param("merchant_pwd")String merchant_pwd,
                                @Param("merchant_phone")String merchant_phone,
                                @Param("merchant_category")String merchant_category){
        return merchantDao.merchantRegister(merchant_name, merchant_pwd, merchant_phone, merchant_category);
    }

    public int deleteMerchant(@Param("merchant_id")long merchant_id){
        return merchantDao.deleteMerchant(merchant_id);
    }

    public int updateInfo(@Param("merchant_id")long merchant_id,@Param("merchant_name")String merchant_name,@Param("merchant_pwd")String merchant_pwd,
                          @Param("merchant_category")String merchant_category){
        return merchantDao.updateInfo(merchant_id,merchant_name, merchant_pwd,merchant_category);
    }

    public int changeStatus(@Param("merchant_id")long merchant_id,@Param("status")int status){
        return merchantDao.changeStatus(merchant_id, status);
    }
}
