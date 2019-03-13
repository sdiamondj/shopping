package cn.edu.ncu.shopping.controller;

import cn.edu.ncu.shopping.entity.Merchant;
import cn.edu.ncu.shopping.entity.Order;
import cn.edu.ncu.shopping.entity.Product;
import cn.edu.ncu.shopping.service.MerchantService;
import cn.edu.ncu.shopping.service.OrderService;
import cn.edu.ncu.shopping.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/merchant")
public class MerchantController {
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/merchantLogin")//二级访问路径
    public String merchantLogin(HttpSession session, @RequestParam("merchant_id")String merchant_id,
                                @RequestParam("merchant_pwd")String merchant_pwd,
                                @RequestParam("code")String code, Model model){
        String rtMsg;
        Merchant merchant = merchantService.merchantLogin(merchant_id,merchant_pwd);
        if(merchant != null){
            String valueCode=(String)session.getAttribute("strCode");
            if(valueCode.equals(code)){
                model.addAttribute("merchant",merchant);//返回网页的数据
                session.setAttribute("merchant",merchant);//存入后台的数据
                rtMsg="登录成功!点击确定进入!";
                model.addAttribute("rtMsg",rtMsg);
                return "merchantIndex";
            }
            else {
                rtMsg="登录失败!验证码错误!";
            }
        }
        else {
            rtMsg="登录失败!请检查您的id或密码!";
        }
        model.addAttribute("rtMsg",rtMsg);
        return "merchantLogin";
    }

    @RequestMapping("/isRegistered")
    @ResponseBody
    public boolean isRegistered(@RequestParam("merchant_phone")String merchant_phone){
        Merchant merchant=merchantService.getMerchantByPhone(merchant_phone);
        if(merchant!=null){
            return false;
        }
        else{
            return true;
        }
    }

    @RequestMapping("/merchantRegister")
    public String merchantRegister(HttpSession session,@RequestParam("merchant_name")String merchant_name,
                                   @RequestParam("merchant_pwd")String merchant_pwd,
                                   @RequestParam("merchant_phone")String merchant_phone,
                                   @RequestParam("merchant_category")String merchant_category,
                                   @RequestParam("code")String code, Model model){
        String rtMsg;
        if(merchantService.getMerchantByPhone(merchant_phone) != null){
            rtMsg="注册失败!该手机号已经被使用!";
            model.addAttribute("rtMsg",rtMsg);
            return "merchantRegister";
        }
        else{
            String valueCode=(String)session.getAttribute("strCode");
            if(!valueCode.equals(code)){
                rtMsg="注册失败!验证码错误!";
                model.addAttribute("rtMsg",rtMsg);
                return "customerRegister";
            }
            else{
                rtMsg="注册成功!请立即登录!";
                model.addAttribute("rtMsg",rtMsg);
                merchantService.merchantRegister(merchant_name,merchant_pwd,merchant_phone,merchant_category);
                return "merchantLogin";
            }
        }
    }

    @RequestMapping("/cancel")
    public String merchantCancel(HttpSession session){
        session.invalidate();
        return "merchantLogin";
    }

    @RequestMapping("/delete")
    public String deleteAll(HttpSession session){
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        long merchant_id=merchant.getMerchant_id();
        List<Product> list=productService.getProductByMId(merchant_id);
        for(int i=0;i<list.size();i++){
            long product_id=list.get(i).getProduct_id();
            productService.deleteProduct(product_id);
        }
        merchantService.deleteMerchant(merchant_id);
        return "merchantLogin";
    }

    @RequestMapping("/updateInfo")
    public String updateInfo(@RequestParam("merchant_name")String merchant_name,
                             @RequestParam("merchant_pwd")String merchant_pwd,
                             @RequestParam("merchant_category")String merchant_category,
                             HttpSession session){
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        long merchant_id=merchant.getMerchant_id();
        int a=merchantService.updateInfo(merchant_id,merchant_name, merchant_pwd, merchant_category);
        if(a!=0){
            int status=0;
            merchantService.changeStatus(merchant_id,status);
        }
        session.invalidate();
        return "merchantLogin";
    }

    @RequestMapping("/merchantProduct")
    public String merchantProduct(HttpSession session,Model model){
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        model.addAttribute("merchant",merchant);
        long merchant_id=merchant.getMerchant_id();
        List<Product> list=productService.getProductByMId(merchant_id);
        model.addAttribute("product",list);
        return "merchantProduct";
    }

    @RequestMapping("/merchantOrder")
    public String merchantOrder(HttpSession session,Model model){
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        long merchant_id=merchant.getMerchant_id();
        List<Order> list=orderService.getOrderByMId(merchant_id);
        model.addAttribute("order",list);
        model.addAttribute("merchant",merchant);
        return "merchantOrder";
    }

    @RequestMapping("/getAllMerchant")
    public String getAllMerchant(Model model){
        List<Merchant> list=merchantService.getAllMerchants();
        model.addAttribute("merchant",list);
        return "merchant-list";
    }
}
