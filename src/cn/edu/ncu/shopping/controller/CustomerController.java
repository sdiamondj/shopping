package cn.edu.ncu.shopping.controller;


import cn.edu.ncu.shopping.entity.Customer;
import cn.edu.ncu.shopping.entity.VipPost;
import cn.edu.ncu.shopping.service.CustomerService;
import cn.edu.ncu.shopping.service.VipPostService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/customer")//一级访问路径
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private VipPostService vipPostService;

    @RequestMapping("/customerLogin")//二级访问路径
    public String customerLogin(HttpSession session,@RequestParam("customer_name")String customer_name,
                                @RequestParam("customer_pwd")String customer_pwd,
                                @RequestParam("code")String code,Model model){
        String rtMsg;
        Customer customer = customerService.customerLogin(customer_name,customer_pwd,code);
        if(customer != null){
            String valueCode=(String)session.getAttribute("strCode");
            if(valueCode.equals(code)){
                model.addAttribute("customer",customer);//返回网页的数据
                session.setAttribute("customer",customer);//存入后台的数据
                rtMsg="登录成功!点击确定进入!";
                model.addAttribute("rtMsg",rtMsg);
                return "index";
            }
            else {
                rtMsg="登录失败!验证码错误!";
            }
        }
        else {
            rtMsg="登录失败!请检查您的用户名或密码!";
        }
        model.addAttribute("rtMsg",rtMsg);
        return "customerLogin";
    }

    @RequestMapping("/isRegistered")
    @ResponseBody
    public Boolean isRegistered(HttpServletRequest request){
        String customer_sth=request.getParameter("customer_sth");
        Customer customer = customerService.isRegistered(customer_sth);
        if(customer!=null){
            return false;
        }
        else
            return true;
    }


    @RequestMapping("/customerRegister")
    public String customerRegister(HttpSession session,@RequestParam("customer_name")String customer_name,
                                   @RequestParam("customer_pwd")String customer_pwd,
                                   @RequestParam("customer_phone")String customer_phone,
                                   @RequestParam("code")String code, Model model){
        String rtMsg;
        if(customerService.isRegistered(customer_name) != null){
            rtMsg="注册失败!该用户名已经被使用!";
            model.addAttribute("rtMsg",rtMsg);
            return "customerRegister";
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
                customerService.customerRegister(customer_name,customer_pwd,customer_phone);
                return "customerLogin";
            }
        }
    }
    @RequestMapping("/cancel")
    public String customerCancel(HttpSession session,Model model){
        session.invalidate();
        model.addAttribute("rtMsg","注销成功");
        return "index";
    }

    @RequestMapping("/self")
    public String showSelfInfo(HttpSession session,Model model){
        Customer customer=(Customer)session.getAttribute("customer");
        model.addAttribute("customer",customer);
        return "selfInfo";
    }

    @RequestMapping("/updateSelfInfo")
    @ResponseBody
    public boolean updateSelfInfo(HttpSession session,@RequestParam("index")int index,
                                  @RequestParam("data")String data){
        Customer customer=(Customer)session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        if(index==1){
            Customer customer1=customerService.isRegistered(data);
            if(customer1!=null){
                return false;
            }
        }
        switch (index){
            case 1:customerService.updateSelfInfo(customer_id,"","","","",data,"","");break;
            case 2:customerService.updateSelfInfo(customer_id,data,"","","","","","");break;
            case 3:customerService.updateSelfInfo(customer_id,"",data,"","","","","");break;
            case 4:customerService.updateSelfInfo(customer_id,"","",data,"","","","");break;
            case 5:customerService.updateSelfInfo(customer_id,"","","",data,"","","");break;
            case 6:customerService.updateSelfInfo(customer_id,"","","","","",data,"");break;
            case 7:customerService.updateSelfInfo(customer_id,"","","","","","",data);break;
        }
        return true;
    }

    @RequestMapping("/applyVIP")
    public String applyVIP(HttpSession session){
        Customer customer=(Customer)session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        int VIP=1;
        customerService.changeVIPStatus(customer_id,VIP);
        session.removeAttribute("customer");
        session.setAttribute("customer",customer);
        return "redirect:/JSP/VIPcenter";
    }

    @RequestMapping("/VIPpost")
    public String VIPpost(HttpSession session, @RequestParam("post_title")String post_title,
                          @RequestParam("post_content")String post_content,Model model){
        Customer customer=(Customer)session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        String customer_name=customer.getCustomer_name();
        vipPostService.addPost(customer_id,customer_name,post_title,post_content);
        List<VipPost> list=vipPostService.getAllPost();
        model.addAttribute("VipPost",list);
        model.addAttribute("customer",customer);
        return "VIP";
    }

    @RequestMapping("/getAllCustomer")
    public String showAllCustomer(Model model){
        List<Customer> list=customerService.getAllCustomer();
        System.out.println(list);
        model.addAttribute("customer",list);
        return "customer-list";
    }

}
