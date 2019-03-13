package cn.edu.ncu.shopping.controller;

import cn.edu.ncu.shopping.entity.*;
import cn.edu.ncu.shopping.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")//一级访问路径
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderProductService orderProductService;

    @RequestMapping("/adminLogin")//二级访问路径
    public String adminLogin(HttpSession session, @RequestParam(value="admin_name")String admin_name,
                                @RequestParam(value="admin_pwd")String admin_pwd,
                                @RequestParam(value="code")String code, Model model){
        String rtMsg="";
        Admin admin = adminService.adminLogin(admin_name,admin_pwd,code);
        if(admin != null){
            String valueCode=(String)session.getAttribute("strCode");
            if(valueCode.equals(code)){
                admin = adminService.getAdminByName(admin_name);
                model.addAttribute("admin",admin);//返回网页的数据
                session.setAttribute("admin",admin);//存入后台的数据
                rtMsg="登录成功!点击确定进入!";
                model.addAttribute("rtMsg",rtMsg);
                return "adminIndex";
            }
            else {
                rtMsg="登录失败!验证码错误!";
            }
        }
        else {
            rtMsg="登录失败!请检查您的用户名或密码!";
        }
        model.addAttribute("rtMsg",rtMsg);
        return "adminLogin";
    }

    @RequestMapping("/adminLogout")
    public String adminLogout(HttpSession session){
        session.invalidate();
        return "adminLogin";
    }

    @RequestMapping("/login")
    public String adminLogin(){
        return "adminLogin";
    }

    @RequestMapping("/count")
    public String count(Model model) {
        List<Customer> customerList = customerService.getAllCustomer();
        List<Merchant> merchantList = merchantService.getAllMerchants();
        List<Product> productList = productService.getAllProduct();
        List<Customer> VIPList = customerService.getAllVIP();
        List<Order> orderList = orderService.getAllOrder();
        model.addAttribute("customer", customerList);
        model.addAttribute("merchant", merchantList);
        model.addAttribute("product", productList);
        model.addAttribute("VIP", VIPList);
        model.addAttribute("order", orderList);
        return "welcome";
    }

    @RequestMapping("/agreeVIP")
    public String agreeVIP(@RequestParam("status")int status,@RequestParam("index")int index,
                           Model model){
        List<Customer> list=customerService.getAllCustomer();
        Customer customer=list.get(index);
        long customer_id=customer.getCustomer_id();
        customerService.changeVIPStatus(customer_id,status);
        list=customerService.getAllCustomer();
        model.addAttribute("customer",list);
        return "customer-list";
    }

    @RequestMapping("/agreeMerchant")
    public String agreeMerchant(@RequestParam("status")int status,@RequestParam("index")int index,
                           Model model){
        List<Merchant> list=merchantService.getAllMerchants();
        Merchant merchant=list.get(index);
        long merchant_id=merchant.getMerchant_id();
        merchantService.changeStatus(merchant_id,status);
        list=merchantService.getAllMerchants();
        model.addAttribute("merchant",list);
        return "merchant-list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("status")int status,@RequestParam("index")int index,
                         Model model){
        switch (status){
            case 0:List<Customer> list=customerService.getAllCustomer();
            Customer customer=list.get(index);long customer_id=customer.getCustomer_id();
                customerService.delete(customer_id);list=customerService.getAllCustomer();
                model.addAttribute("customer",list);return "customer-list";
            case 1:List<Merchant> list1=merchantService.getAllMerchants();
            Merchant merchant=list1.get(index);long merchant_id=merchant.getMerchant_id();
            merchantService.deleteMerchant(merchant_id);list1=merchantService.getAllMerchants();
            model.addAttribute("merchant",list1);return "merchant-list";
            case 2:List<Product> list2=productService.getAllProduct();
            Product product=list2.get(index);long product_id=product.getProduct_id();
            productService.deleteProduct(product_id);list2=productService.getAllProduct();
            model.addAttribute("product",list2);return "product-list";
            case 3:List<Order> list3=orderService.getAllOrder();
            Order order=list3.get(index);long order_id=order.getOrder_id();
            orderProductService.delete(order_id); orderService.delete(order_id);
            orderService.getAllOrder();list3=orderService.getAllOrder();
            model.addAttribute("order",list3);
            return "order-list";
        }
        return "";
    }

}
