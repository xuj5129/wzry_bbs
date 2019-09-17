package com.bbs.controller;

import com.bbs.dao.CommentDao;
import com.bbs.domain.Article;
import com.bbs.domain.Comment;
import com.bbs.domain.Reply;
import com.bbs.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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

    @RequestMapping("/getArticle.do")
    public ModelAndView findById(int articleId){
        ModelAndView mv=new ModelAndView();
        Article article=articleService.findById(articleId);
        mv.addObject("article",article);
        mv.setViewName("getArticle");
        return mv;
    }
    
    @RequestMapping("/saveComment.do")
    public String saveComment(Comment comment){
        articleService.saveComment(comment);
        return "redirect:getArticle.do?articleId="+comment.getArticleId();
    }

    @RequestMapping("/saveReply.do")
    public @ResponseBody String saveReply(Reply reply){
        articleService.saveReply(reply);
        return "发表成功";
    }


    @RequestMapping("/findArticleByWord.do")
    public ModelAndView findArticleByWord(String keyWord){
        ModelAndView mv = new ModelAndView();
        List<Article> articleList = articleService.findArticleByWord(keyWord);
        mv.addObject("articleList",articleList);
        mv.addObject("keyWord",keyWord);
        mv.setViewName("index");
        return mv;
    }

}
