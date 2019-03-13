package cn.edu.ncu.shopping.controller;

import cn.edu.ncu.shopping.entity.*;
import cn.edu.ncu.shopping.service.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CartService cartService;
    @Autowired
    private OrderProductService orderProductService;
    @Autowired
    private ProductService productService;
    @Autowired
    private MerchantService merchantService;

    @RequestMapping(value = "/myOrder/{customer_id}")
    public String showMyOrder(@PathVariable("customer_id")long customer_id, Model model){
        List<Order> list=orderService.getOrderByCid(customer_id);
        model.addAttribute("order",list);
        return "order";
    }

    @RequestMapping("/submitOrder")
    public String submitOrder(@RequestParam("customer_id")long customer_id
                              ,@RequestParam("order_count")double total_count,Model model,
                              @RequestParam("order_address")String order_address){
        List<Cart> cartList=cartService.getAllCart(customer_id);
        List<Merchant> merchantList=new ArrayList<>();
        List<Merchant> list=new ArrayList<>();
        for(int i=0;i<cartList.size();i++){
            long merchant_id=cartList.get(i).getMerchant_id();
            Merchant merchant=merchantService.getMerchantById(merchant_id);
            list.add(merchant);
            if(merchantList.size()==0){
                merchantList.add(merchant);
            }
            for(int j=0;j<merchantList.size();j++){
                if(merchant.getMerchant_id()==merchantList.get(j).getMerchant_id()){
                    break;
                }
                else{
                    if(j==merchantList.size()-1){
                        merchantList.add(merchant);
                    }
                }
            }
        }
        for(int k=0;k<merchantList.size();k++){
            double order_count=0;
            long merchant_id=merchantList.get(k).getMerchant_id();
            for(int x=0;x<list.size();x++){
                if(list.get(x).getMerchant_id()==merchant_id){
                    order_count+=cartList.get(x).getProduct_total_price();
                }
            }
            orderService.submitOrder(customer_id,order_count,order_address,merchant_id);
            Order order=orderService.getLastOrder();
            long order_id=order.getOrder_id();
            for(int x=0;x<list.size();x++){
                int p=0;
                if(list.get(x).getMerchant_id()==merchant_id){
                    Cart cart=cartList.get(x);
                    long product_id=cart.getProduct_id();
                    Product product=productService.getProductById(product_id);
                    String merchant_name=product.getMerchant_name();
                    int product_count=cart.getProduct_count();
                    orderProductService.submitOrderProduct(order_id,product,product_count,merchant_name);
                    for(int c=0;c<product_count;c++){
                        productService.addProductSellCount(product_id);
                    }
                    if(p==0){
                        String order_picture=cart.getProduct_picture();
                        orderService.addOrderPicture(order_id,order_picture);
                    }
                    p++;
                }
            }

        }
        List<Order> list2=orderService.getOrderByCid(customer_id);
        model.addAttribute("order",list2);
        cartService.deleteCart(customer_id);
        return "order";

    }

    @RequestMapping("/orderStatus")
    @ResponseBody
    public Object orderStatus(@RequestParam("order_status")String order_status,
                              HttpSession session)throws Exception{
        String status="";
        if(order_status.equals("status0"))
            status="0";
        else if(order_status.equals("status1"))
            status="1";
        else if(order_status.equals("status2"))
            status="2";
        else if(order_status.equals("status3"))
            status="3";
        Customer customer=(Customer) session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        List<Order> list = orderService.getOrderByStatus(status,customer_id);
        ObjectMapper mapper= new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(list);
        return jsonStr;
    }

    @RequestMapping("/orderStatusMerchant")
    @ResponseBody
    public Object orderStatusMerchant(@RequestParam("order_status")String order_status,
                              HttpSession session)throws Exception{
        String status;
        if(order_status.equals("status0"))
            status="0";
        else if(order_status.equals("status1"))
            status="1";
        else if(order_status.equals("status2"))
            status="2";
        else if(order_status.equals("status3"))
            status="3";
        else
            status="";
        Merchant merchant=(Merchant)session.getAttribute("merchant");
        long merchant_id=merchant.getMerchant_id();
        List<Order> list = orderService.getOrderByStatusMerchant(status,merchant_id);
        ObjectMapper mapper= new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(list);
        return jsonStr;
    }



    @RequestMapping("/details")
    public String orderDetails(@RequestParam("order_id")long order_id,Model model){
        Order order = orderService.getOrder(order_id);
        List<OrderProduct> list = orderProductService.getOrderProduct(order_id);
        model.addAttribute("order",order);
        model.addAttribute("orderProduct",list);
        return "orderDetails";
    }

    @RequestMapping("/detailsMerchant")
    public String orderDetailsMerchant(@RequestParam("order_id")long order_id,Model model){
        Order order = orderService.getOrder(order_id);
        List<OrderProduct> list = orderProductService.getOrderProduct(order_id);
        model.addAttribute("order",order);
        model.addAttribute("orderProduct",list);
        return "merchantOrderDetails";
    }

    @RequestMapping("/makeOrderFinished")
    @ResponseBody
    public boolean makeOrderFinished(@RequestParam("order_id")long order_id){
        orderService.changeOrderStatus(order_id,3);
        return true;
    }

    @RequestMapping("/sureToGet")
    public String sureToGet(@RequestParam("order_id")long order_id){
        orderService.changeOrderStatus(order_id,2);
        return "redirect:/order/details?order_id="+order_id;
    }

    @RequestMapping("/sureToPost")
    public String sureToPost(@RequestParam("order_id")long order_id){
        orderService.changeOrderStatus(order_id,1);
        return "redirect:/order/detailsMerchant?order_id="+order_id;
    }

    @RequestMapping("/getAllOrder")
    public String getAllOrder(Model model){
        List<Order> list=orderService.getAllOrder();
        model.addAttribute("order",list);
        return "order-list";
    }
}
