package cn.edu.ncu.shopping.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class TestController {

    @RequestMapping("")
    public String test(){
        return "index";
    }
}
