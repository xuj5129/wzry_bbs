package com.bbs.controller;

import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    //用户登录
    @RequestMapping("/login.do")
    public @ResponseBody ResultInfo login(String username,String userpass, HttpSession session){

        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        userInfo.setUserpass(userpass);

        ResultInfo resultInfo=userService.login(userInfo);
        if(resultInfo.isSuccess()){
            session.setAttribute("existUser",resultInfo.getObject());

        }
        return resultInfo;


    }

    //根据用户名查询用户
    @RequestMapping("/checkUsernameByAjax.do")
    public @ResponseBody ResultInfo checkUsernameByAjax(String username){
        ResultInfo resultInfo=userService.findByUsername(username);
        return resultInfo;


    }
    //新用户注册
    @RequestMapping("/register.do")
    public ModelAndView register(){
       return null;
    }
    //修改用户邮箱地址和头像
    @RequestMapping("/update.do")
    public String update(UserInfo userInfo){
        userService.update(userInfo);
        return "index";
    }
    @RequestMapping("/updatePwd.do")
    public String updatePwd(String oldPassword,String newPassword){
        return "index";


    }




}
