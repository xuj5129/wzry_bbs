package com.bbs.controller;

import com.bbs.domain.UserInfo;
import com.bbs.service.ArticleService;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
@RequestMapping("/begin")
public class BeginController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @RequestMapping("/getTotalArticleAndUserOnline.do")
    public ModelAndView getTotalArticle() {
        ModelAndView mv = new ModelAndView();
        //查询总帖数
        int num1 = articleService.getTotalArticleNum();
        //查询今日帖数
        int num2 = articleService.getNumOfTodayArticle();
        //查询在线用户信息
        List<UserInfo> list = userService.findUserOnline();
        //查询在线用户数
        int num3 = userService.numOfUserOnline();

        mv.addObject("list",list);
        mv.addObject("num1", num1);
        mv.addObject("num2", num2);
        mv.addObject("num3", num3);

        mv.setViewName("index");
        return mv;
    }
}
