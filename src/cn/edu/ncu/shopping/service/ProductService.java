package cn.edu.ncu.shopping.service;

import cn.edu.ncu.shopping.dao.ProductDao;
import cn.edu.ncu.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;

    public Product getProductById(@Param("product_id")long product_id){
        return productDao.getProductById(product_id);
    }

    public List<Product> getProductsByKey(@Param("key")String key,@Param("keyId")long keyId){
        return productDao.getProductsByKey(key,keyId);
    }

    public int addProductSellCount(@Param("product_id")long product_id){
        return productDao.addProductSellCount(product_id);
    }

    public List<Product> getAllProduct(){
        return productDao.getAllProduct();
    }

    public List<Product> getNew(){
        return productDao.getNew();
    }

    public List<Product> getHot(){
        return productDao.getHot();
    }

    public List<Product> getExpensive(){
        return productDao.getExpensive();
    }

    public List<Product> getProductByMId(@Param("merchant_id")long merchant_id){
        return productDao.getProductByMId(merchant_id);
    }

    public List<Product> getCheap(){
        return productDao.getCheap();
    }

    public List<Product> getByMN(@Param("merchant_name")String merchant){
        return productDao.getByMN(merchant);
    }

    public int deleteProduct(@Param("product_id")long product_id){
        return productDao.deleteProduct(product_id);
    }

    public int addProductCommentCount(@Param("product_id")long product_id){
        return productDao.addProductCommentCount(product_id);
    }

    public int updateSth(@Param("product_name")String product_name,
                         @Param("product_price")String product_price,
                         @Param("product_category")String product_category,
                         @Param("product_description")String product_description,
                         @Param("product_id")long product_id){
        return productDao.updateSth(product_name, product_price, product_category, product_description, product_id);
    }

    public int addProduct(@Param("product_name")String product_name,
                          @Param("product_category")String product_category,
                          @Param("product_market_price")double product_market_price,
                          @Param("product_description")String product_description,
                          @Param("product_picture")String product_picture,
                          @Param("merchant_id")long merchant_id,
                          @Param("merchant_name")String merchant_name,
                          @Param("product_subheading")String product_subheading){
        return productDao.addProduct(product_name, product_category, product_market_price, product_description, product_picture,merchant_id,merchant_name,product_subheading);
    }

    public int updatePicture(@Param("product_picture")String product_picture,@Param("product_id")long product_id){
        return productDao.updatePicture(product_picture,product_id);
    }
}
