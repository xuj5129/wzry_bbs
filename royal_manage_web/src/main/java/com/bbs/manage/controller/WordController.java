package com.bbs.manage.controller;

import com.bbs.domain.Word;
import com.bbs.service.WordService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/word")
public class WordController {

    @Autowired
    private WordService wordService;
   //查询所有敏感词
   @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "pageSize", required = true, defaultValue = "8") Integer pageSize){

       ModelAndView mv = new ModelAndView();
       List<Word> words = wordService.findAll(page,pageSize);
       PageInfo pageInfo = new PageInfo(words);
       mv.addObject("pageInfo", pageInfo);
       mv.setViewName("WordPage");
       return mv;
    }


    @RequestMapping("/changeStatus.do")
    public String changeStatus(@RequestParam(name = "wordId") Integer wordId,@RequestParam(name = "status") Integer status){
       wordService.changeStatus(wordId,status);
       return "redirect:findAll.do";
    }
}
