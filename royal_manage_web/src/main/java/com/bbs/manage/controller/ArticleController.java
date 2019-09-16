package com.bbs.manage.controller;

import com.bbs.domain.Article;
import com.bbs.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("articleController")
public class ArticleController {

    private ArticleService articleService;
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List <Article> articles = articleService.findAll();
        mv.addObject("articleList",articles );
        mv.setViewName("ArticlePage");
        return mv;
    }
}
