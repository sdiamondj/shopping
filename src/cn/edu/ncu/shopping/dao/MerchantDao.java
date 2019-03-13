package cn.edu.ncu.shopping.dao;

import cn.edu.ncu.shopping.entity.Merchant;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MerchantDao {
    Merchant getMerchantByName(@Param("merchant_name")String merchant_name);

    Merchant getMerchantById(@Param("merchant_id")long merchant_id);

    Merchant getMerchantByPhone(@Param("merchant_phone")String merchant_phone);


    int merchantRegister(@Param("merchant_name")String merchant_name,@Param("merchant_pwd")String merchant_pwd,
                         @Param("merchant_phone")String merchant_phone,
                         @Param("merchant_category")String merchant_category);

    List<Merchant> getMerchantByCategory(@Param("merchant_category")String merchant_category);

    List<Merchant> getAllMerchants();

    Merchant merchantLogin(@Param("merchant_id")String merchant_id,@Param("merchant_pwd")String merchant_pwd);

    int deleteMerchant(@Param("merchant_id")long merchant_id);

    int updateInfo(@Param("merchant_id")long merchant_id,@Param("merchant_name")String merchant_name,@Param("merchant_pwd")String merchant_pwd,
                   @Param("merchant_category")String merchant_category);

    int changeStatus(@Param("merchant_id")long merchant_id,@Param("status")int status);
}
