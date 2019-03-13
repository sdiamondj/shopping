package cn.edu.ncu.shopping.controller;

import cn.edu.ncu.shopping.entity.*;
import cn.edu.ncu.shopping.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/JSP")
public class JSPController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private VipPostService vipPostService;
    @Autowired
    private MerchantService merchantService;

    @RequestMapping("/customerLogin")
    public String showLogin(){
        return "customerLogin";
    }

    @RequestMapping("/customerRegister")
    public String showRegister(){
        return "customerRegister";
    }

    @RequestMapping("/index")
    public String showIndex() {return "index";}

    @RequestMapping("/productList")
    public String showList(){return "productList";}

    @RequestMapping("/productDetails")
    public String showDetails(){return "productDetails";}

    @RequestMapping("/cart")
    public String showCart(){return "cart";}

    @RequestMapping("/order")
    public String showOrder(){return "order";}

    @RequestMapping("/self")
    public String showSelf(){return "selfInfo";}

    @RequestMapping("/VIPcenter")
    public String VIPcenter(HttpSession session, Model model){
        Customer customer2=(Customer)session.getAttribute("customer");
        long customer_id=customer2.getCustomer_id();
        Customer customer=customerService.getCustomerById(customer_id);
        List<VipPost> list=vipPostService.getAllPost();
        model.addAttribute("VipPost",list);
        model.addAttribute("customer",customer);
        return "VIP";
    }

    @RequestMapping("/merchantLogin")
    public String merchantLogin(){
        return "merchantLogin";
    }

    @RequestMapping("/merchantRegister")
    public String merchantRegister(){return "merchantRegister";}

    @RequestMapping("merchantUpdate")
    public String merchantRegister(@RequestParam("merchant_id")long merchant_id,Model model){
        Merchant merchant=merchantService.getMerchantById(merchant_id);
        model.addAttribute("merchant",merchant);
        return "merchantUpdateInfo";
    }

    @RequestMapping("/merchantIndex")
    public String merchantIndex(HttpSession session,Model model){
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        model.addAttribute("merchant",merchant);
        return "merchantIndex";
    }

    @RequestMapping("/uploadProduct")
    public String uploadProduct(){
        return "uploadProduct";
    }

    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }

    @RequestMapping("show")
    public String show(){return "simple";}

}
