package cn.edu.ncu.shopping.controller;

import cn.edu.ncu.shopping.entity.Cart;
import cn.edu.ncu.shopping.entity.Customer;
import cn.edu.ncu.shopping.entity.Product;
import cn.edu.ncu.shopping.service.CartService;
import cn.edu.ncu.shopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/addToCart")
    @ResponseBody
    //这里有一些问题，本来想返回true or false在页面上alert不同内容的，但问题始终没办法解决，因此无论返回啥实际上弹窗都是成功！
    public Boolean addToCart(@RequestParam("product_id")long product_id,@RequestParam("customer_id")long customer_id){
        Cart cart=cartService.isAdded(customer_id,product_id);
        if(cart==null){
            //购物车没有这条信息，插入
            Product product = productService.getProductById(product_id);
            long merchant_id=product.getMerchant_id();
            cartService.addToCart(product,customer_id,merchant_id);
            return true;
        }
        else{
            //已经有这条信息,数量+1
            int product_count=cart.getProduct_count()+1;
            double product_total_price=cart.getProduct_total_price()+cart.getProduct_price();
            long cart_id=cart.getCart_id();
            //System.out.println(product_count+" "+product_total_price+" "+cart_id);
            cartService.updateCartCount(product_count,product_total_price,cart_id);
            return false;
        }
    }

    @RequestMapping("/myCart")
    public String showCart(HttpSession session, Model model){
        Customer customer =(Customer)session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        List<Cart> list=cartService.getAllCart(customer_id);
        if(list.size()==0){
            Cart cart = new Cart();
            cart.setProduct_price(0);
            list.add(cart);
        }
        model.addAttribute("cart",list);
        return "cart";
    }

    @RequestMapping("/updateCount")
    @ResponseBody
    public boolean updateCount(@RequestParam("product_count")int product_count,
                               @RequestParam("index")int index,HttpSession session){
        Customer customer = (Customer)session.getAttribute("customer");
        long customer_id=customer.getCustomer_id();
        List<Cart> list=cartService.getAllCart(customer_id);
        Cart cart=list.get(index);
        long cart_id=cart.getCart_id();
        double product_price=cart.getProduct_price();
        double product_total_price=product_count*product_price;
        cartService.updateCartCount(product_count,product_total_price,cart_id);
        return true;
    }

    @RequestMapping("/deleteFromCart")
    public String deleteFromCart(@RequestParam("cart_id")long cart_id){
        cartService.deleteFromCart(cart_id);
        return "redirect:/cart/myCart";
    }

}
