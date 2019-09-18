package com.bbs.manage.controller;

import com.bbs.domain.Article;
import com.bbs.domain.Report;
import com.bbs.service.ArticleService;
import com.bbs.service.ReportService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {


    @Autowired
    private ReportService reportService;
    @Autowired
    private ArticleService articleService;


    //查询所有被举报的帖子
   @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "pageSize", required = true, defaultValue = "4") Integer pageSize){
        ModelAndView mv = new ModelAndView();
       List<Report> reports = reportService.findAll(page,pageSize);
       PageInfo pageInfo = new PageInfo(reports);
       mv.addObject("pageInfo",pageInfo );
       mv.setViewName("ReportPage");
       return mv;
    }


    //实现屏蔽帖子功能
    @RequestMapping("shield.do")
    public String shield(@RequestParam(name = "reportId" ) int reportId,@RequestParam(name = "articleId") int articleId,int page){
       reportService.updateStatus(reportId);
        Integer isReport = 0;
        articleService.deleteArticle(articleId, isReport);
       return "redirect:findAll.do?page="+page;
    }

    //更改帖子举报状态
    @RequestMapping("changeStatus.do")
    public String changeStatus(@RequestParam(name = "reportId" ) int reportId,int page){
       reportService.updateStatus(reportId);
       return "redirect:findAll.do?page="+page;
    }
}
