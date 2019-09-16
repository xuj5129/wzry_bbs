package com.bbs.controller;

import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    public ModelAndView testMethod(){

        ModelAndView mv = new ModelAndView();
        mv.setViewName("userInfo");
        return mv;
    }


}
