package com.bbs.service.impl;

import com.bbs.dao.UpvoteDao;
import com.bbs.domain.Upvote;
import com.bbs.service.UpvoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UpvoteServiceImpl implements UpvoteService {

    @Autowired
    private UpvoteDao upvoteDao;
    
    @Override
    public Upvote findUpvoteByArticleIdAndUserName(int articleId, String userName) {
        return upvoteDao.findUpvoteByArticleIdAndUserName(articleId,userName);
    }

    @Override
    public void activeUpvote(Upvote upvote) {
        Upvote existUpvote = upvoteDao.findUpvoteByArticleIdAndUserName(upvote.getUpvoteArticleId(), upvote.getUpvoteUserName());
        upvote.setIsUpvote(1);
        if(existUpvote==null){
            upvoteDao.saveUpvote(upvote);
        }else{
            upvoteDao.changeUpvote(upvote);
        }
    }

    @Override
    public void cancelUpvote(Upvote upvote) {
        upvote.setIsUpvote(0);
        upvoteDao.changeUpvote(upvote);
    }
}
