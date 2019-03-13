package cn.edu.ncu.shopping.controller;


import cn.edu.ncu.shopping.entity.*;
import cn.edu.ncu.shopping.service.MerchantService;
import cn.edu.ncu.shopping.service.OrderProductService;
import cn.edu.ncu.shopping.service.ProductCommentService;
import cn.edu.ncu.shopping.service.ProductService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private ProductCommentService productCommentService;
    @Autowired
    private OrderProductService orderProductService;

    @RequestMapping("/getProductById")
    public Product getProductById(@RequestParam("product_id")long product_id){
        Product product = productService.getProductById(product_id);
        return product;
    }

    @RequestMapping(value="/showDetails/{product_id}")
    public String showProductDetails(@PathVariable("product_id")long product_id, Model model){
        Product product = productService.getProductById(product_id);
        model.addAttribute("product",product);
        //model.addAttribute("product_id",product_id);
        return "productDetails";
    }

    @RequestMapping("/productList")
    public String showList(@RequestParam("key")String key,Model model){
        Merchant merchant = merchantService.getMerchantByName(key);
        List<Merchant> mList=merchantService.getMerchantByCategory(key);
        long keyId = 0;
        if(merchant!=null){
            keyId = merchant.getMerchant_id();
        }
        List<Product> list = productService.getProductsByKey(key,keyId);
        if(mList!=null){
            for(int i=0;i<mList.size();i++){
                keyId=mList.get(i).getMerchant_id();
                List<Product> pList=productService.getProductByMId(keyId);
                for(int j=0;j<pList.size();j++){
                    list.add(pList.get(j));
                }
            }
        }
        model.addAttribute("product",list);
        model.addAttribute("key",key);
        return "productList";
    }

    @RequestMapping("/customerComment")
    public String showComment(@RequestParam("product_id")long product_id,Model model){
        List<ProductComment> list=productCommentService.getPC(product_id);
        Product product = productService.getProductById(product_id);
        model.addAttribute("product",product);
        model.addAttribute("product_comment",list);
        return "productComment";
    }

    @RequestMapping("/checkIsComment")
    @ResponseBody
    public boolean checkIsComment(@RequestParam("order_id")long order_id,@RequestParam("product_id")long product_id){
        ProductComment productComment =productCommentService.checkIsComment(order_id, product_id);
        if(productComment==null){
            return true;
        }
        else
            return false;
    }

    @RequestMapping("/submitComment")
    public String submitContent(HttpSession session,@RequestParam("order_id")long order_id,
                              @RequestParam("product_id")long product_id,
                              @RequestParam("comment_score")int comment_score,
                              @RequestParam("comment_content")String comment_content,
                                Model model){
        Customer customer=(Customer)session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        String customer_name=customer.getCustomer_name();
        productService.addProductCommentCount(product_id);
        productCommentService.submitComment(order_id,customer_id,customer_name,product_id,comment_score,comment_content);
        List<OrderProduct> list=orderProductService.getOrderProduct(order_id);
        model.addAttribute("orderProduct",list);
        return "redirect:/order/details?order_id="+order_id;
    }

    @RequestMapping("/isAllBeCommented")
    @ResponseBody
    public boolean isAllBeCommented(@RequestParam("size")int size,@RequestParam("order_id")long order_id){
        int i=productCommentService.isAllBeCommented(order_id);
        if(i==size){
            return true;
        }
        else{
            return false;
        }
    }

    @RequestMapping("/special")
    public String special(@RequestParam("what")String what,Model model){
        List<Product> list;
        if(what.equals("new")){
            list=productService.getNew();
        }
        else if(what.equals("hot")){
            list=productService.getHot();
        }
        else if(what.equals("expensive")){
            list=productService.getExpensive();
        }
        else if(what.equals("cheap")){
            list=productService.getCheap();
        }
        else{
            String merchant_name="南大超市";
            list=productService.getByMN(merchant_name);
        }
        model.addAttribute("product",list);
        return "productList";
    }

    @RequestMapping("/updateSth")
    public String updateSth(@RequestParam("product_name")String product_name,
                              @RequestParam("product_price")String product_price,
                              @RequestParam("product_category")String product_category,
                              @RequestParam("product_description")String product_description,
                              @RequestParam("index")int index,HttpSession session,
                            @RequestParam("file")MultipartFile file, HttpServletRequest request)throws Exception{
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        long merchant_id=merchant.getMerchant_id();
        List<Product> list=productService.getProductByMId(merchant_id);
        Product product=list.get(index);
        long product_id=product.getProduct_id();
        productService.updateSth(product_name,product_price,product_category,product_description,product_id);
        if(file.getSize()!=0){
            String name = UUID.randomUUID().toString().replaceAll("-", "");
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            String url = request.getSession().getServletContext().getRealPath("/WEB-INF/statics/images");
            file.transferTo(new File(url+"/"+name + "." + ext));
            String product_picture="/images/"+name+"."+ext;
            productService.updatePicture(product_picture,product_id);
        }
        return "redirect:/merchant/merchantProduct";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("product_id")long product_id){
        productService.deleteProduct(product_id);
        return "redirect:/merchant/merchantProduct";
    }

    @RequestMapping("/addProduct")
    public String addProduct(MultipartFile file, HttpServletRequest request,HttpSession session,
                             Model model,@RequestParam("product_name")String product_name,
                             @RequestParam("product_category")String product_category,
                             @RequestParam("product_market_price")Double product_market_price,
                             @RequestParam("product_description")String product_description,
                             @RequestParam("product_subheading")String product_subheading)throws Exception{
        //使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        //设置图片上传路径
        String url = request.getSession().getServletContext().getRealPath("/WEB-INF/statics/images");
        file.transferTo(new File(url+"/"+name + "." + ext));
        String product_picture="/images/"+name+"."+ext;
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        long merchant_id=merchant.getMerchant_id();
        String merchant_name=merchant.getMerchant_name();
        productService.addProduct(product_name,product_category,product_market_price,product_description,product_picture,merchant_id,merchant_name,product_subheading);
        return "uploadProduct";
    }

    @RequestMapping("/getAllProduct")
    public String getAllProduct(Model model){
        List<Product> list=productService.getAllProduct();
        model.addAttribute("product",list);
        return "product-list";
    }

}
