package com.bbs.manage.controller;

import com.bbs.domain.Article;
import com.bbs.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/article")
public class AriticleController  {

    @Autowired
    private ArticleService articleService;


    //查询所有帖子
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "pageSize", required = true, defaultValue = "7") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        List <Article> articles = articleService.findAll(page, pageSize);
        PageInfo pageInfo = new PageInfo(articles);
        mv.addObject("pageInfo",pageInfo );
        mv.setViewName("ArticlePage");
        return mv;

    }

    //改变帖子置顶状态
    @RequestMapping("/changeStatus.do")
    public String changeStatus(int id,int page){
        Article article = articleService.findById(id);
        Integer isTop = article.getIsTop();
        articleService.changeStatus(id,isTop);
        return "redirect:findAll.do?page="+page;
    }
    //帖子屏蔽功能
    @RequestMapping("/deleteArticle.do")
    public String deleteArticle(int id,int page){
        Article article = articleService.findById(id);
        Integer isReport = article.getIsReport();
        articleService.deleteArticle(id,isReport);
        return "redirect:findAll.do?page="+page;
    }


    @RequestMapping("/findById.do")
    @ResponseBody
    public Article findById(Integer articleId){
        Article article=articleService.findById(articleId);
        return article;
    }

    @RequestMapping("/findByTitle.do")
    public ModelAndView findByTitleName( @RequestParam(name = "title", defaultValue = "") String title ,@RequestParam(name="sendername",defaultValue = "") String sendername) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

//        System.out.println("hello controller");

        List<Article> articleList = articleService.findByTitle(title,sendername);

        PageInfo pageInfo = new PageInfo(articleList);

        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("ArticlePage");
        return modelAndView;
    }
}
