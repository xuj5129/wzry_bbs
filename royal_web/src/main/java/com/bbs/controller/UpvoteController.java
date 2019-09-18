package com.bbs.controller;

import com.bbs.domain.Article;
import com.bbs.domain.Upvote;
import com.bbs.service.UpvoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/upvote")
public class UpvoteController {
    @Autowired
    private UpvoteService upvoteService;

    @RequestMapping("/changeIsUpvote.do")
    @ResponseBody
    public void changeUpvote(String upvoteUserName,int upvoteArticleId,int isUpvote){
        Upvote upvote=new Upvote();
        upvote.setIsUpvote(isUpvote);
        upvote.setUpvoteArticleId(upvoteArticleId);
        upvote.setUpvoteUserName(upvoteUserName);
        if(upvote.getIsUpvote()==0){
            upvoteService.activeUpvote(upvote);
        }else {
            upvoteService.cancelUpvote(upvote);
        }
        System.out.println(upvote.toString());
    }

    @RequestMapping("/findIsUpvote.do")
    public @ResponseBody int findIsUpvote(String userName,int articleId){
        try {
            Upvote upvote = upvoteService.findUpvoteByArticleIdAndUserName(articleId, userName);
            return upvote.getIsUpvote();
        }catch (Exception e){
            return 0;
        }
    }
}
