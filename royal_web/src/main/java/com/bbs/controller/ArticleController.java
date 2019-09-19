package com.bbs.controller;

import com.bbs.domain.Article;
import com.bbs.domain.Comment;
import com.bbs.domain.Reply;
import com.bbs.dao.CommentDao;
import com.bbs.domain.*;
import com.bbs.service.ArticleService;
import com.bbs.service.UserService;
import com.bbs.service.ZoneService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private ZoneService zoneService;

    @RequestMapping("/saveArticle.do")
    public String saveArticle(Article article){
        int articleId = articleService.saveArticle(article);

        return "redirect:getArticle.do?articleId="+articleId;
    }

    @RequestMapping("/getArticle.do")
    public ModelAndView findById(int articleId){
        ModelAndView mv=new ModelAndView();
        Article article=articleService.findById(articleId);
        mv.addObject("article",article);
        mv.addObject("timeStatus","old");
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
        //查询总帖数
        int num1 = articleService.getTotalArticleNum();
        //查询今日帖数
        int num2 = articleService.getNumOfTodayArticle();
        //查询在线用户信息
        List<UserInfo> userOnlineList = userService.findUserOnline();
        //查询在线用户数
        int num3 = userService.numOfUserOnline();
        //查询所有板块
        List<Zone> zones= zoneService.findAllByDefASCAndZoneIdASC();
        PageInfo pageInfo=new PageInfo(articleList);
        mv.addObject("zones",zones);
        mv.addObject("showzoneId",0);
        mv.addObject("userOnlineList",userOnlineList);
        mv.addObject("num1", num1);
        mv.addObject("num2", num2);
        mv.addObject("num3", num3);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("keyWord",keyWord);
        mv.setViewName("index");
        return mv;
    }

    //查询当前用户发帖数
    @RequestMapping("/findArticleNumWithUsername.do")
    public @ResponseBody int findArticleNumWithUsername(String name){
        int articleNum = articleService.findArticleNumWithUsername(name);
        return articleNum;
    }


    @RequestMapping("/saveReport.do")
    @ResponseBody
    public void saveReport(Report report){
        articleService.saveReport(report);
    }

    @RequestMapping("/changeCommentStatus.do")
    public void changeCommentStatus(int commentId){
        articleService.changeCommentStatus(commentId);
    }


    @RequestMapping("/getArticleByNewTime.do")
    public ModelAndView getArticleByNewTime(int articleId){
        ModelAndView mv=new ModelAndView();
        Article article=articleService.findByIdAndNewTime(articleId);
        mv.addObject("article",article);
        mv.addObject("timeStatus","new");
        mv.setViewName("getArticle");
        return mv;
    }

    @RequestMapping("/getArticleByOldTime.do")
    public ModelAndView getArticleByOldTime(int articleId){
        ModelAndView mv=new ModelAndView();
        Article article=articleService.findByOldTime(articleId);
        mv.addObject("article",article);
        mv.addObject("timeStatus","old");
        mv.setViewName("getArticle");
        return mv;
    }

    @RequestMapping("/findMyArticle.do")
    public @ResponseBody List<Article> findMyArticle(String userName){
        //查询当前用户的所有帖子
        if(userName.trim()!=""){
            return  articleService.findMyArticle(userName);
        }else{
            return new ArrayList<Article>();
        }
    }
}
