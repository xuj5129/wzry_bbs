package com.bbs.manage.controller;

import com.bbs.domain.Article;
import com.bbs.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/article")
public class AriticleController  {

    @Autowired
    private ArticleService articleService;


    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "pageSize", required = true, defaultValue = "4") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        List <Article> articles = articleService.findAll(page, pageSize);
        PageInfo pageInfo = new PageInfo(articles);
        mv.addObject("pageInfo",pageInfo );
        mv.setViewName("ArticlePage");
        return mv;

    }

    @RequestMapping("/changeStatus.do")
    public String changeStatus(int id){
        Article article = articleService.findById(id);
        Integer isTop = article.getIsTop();
        articleService.changeStatus(id,isTop);
        return "redirect:findAll.do";
    }
}
