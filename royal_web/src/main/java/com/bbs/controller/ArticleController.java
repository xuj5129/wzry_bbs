package com.bbs.controller;

import com.bbs.domain.Article;
import com.bbs.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/saveArticle.do")
    public String saveArticle(Article article){
        articleService.saveArticle(article);
        return "redirect:findById";
    }

    @RequestMapping("getArticle.do")
    public ModelAndView findById(int id){
        ModelAndView mv=new ModelAndView();
        Article article=articleService.findById(id);
        mv.addObject("article",article);
        mv.setViewName("getArticle");
        return mv;
    }


}
