package com.bbs.manage.controller;

import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

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


    //对申请升等级的用户进行升级
    @RequestMapping("/upRole.do")
    public String upRole(@RequestParam(name = "userId") int userId,int page){
       userService.upRole(userId);
        return "redirect:findAll.do?page="+page;
    }
    //更改用户禁言状态
    @RequestMapping("/changeTalk.do")
    public String changeTalk(@RequestParam(name = "userId") int userId,@RequestParam(name = "talkStatus") int talkStatus,int page){

        userService.changeTalk(userId,talkStatus);
        return "redirect:findAll.do?page="+page;
    }
}
