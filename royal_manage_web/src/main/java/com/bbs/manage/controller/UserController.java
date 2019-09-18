package com.bbs.manage.controller;

import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/searchUser.do")
    public ModelAndView searchUser(@RequestBody UserInfo userInfo) {
        ModelAndView modelAndView = new ModelAndView();

        List<UserInfo> userInfoList = userService.searchUser(userInfo);

        PageInfo pageInfo = new PageInfo(userInfoList);
        modelAndView.addObject("userPageInfo", pageInfo);

        modelAndView.setViewName("");
        return modelAndView;
    }
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "pageSize", required = true, defaultValue = "4") Integer pageSize){

        List<UserInfo> users =  userService.findAll(page,pageSize);
        PageInfo pageInfo = new PageInfo(users);
        ModelAndView mv =new ModelAndView();
        mv.setViewName("UserPage");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }
}
