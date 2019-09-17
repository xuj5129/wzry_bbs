package com.bbs.service;

import com.bbs.domain.Upvote;
import org.apache.ibatis.annotations.Select;

public interface UpvoteService {
    Upvote findUpvoteByArticleIdAndUserName(int articleId,String userName);

    void activeUpvote(Upvote upvote);

    void cancelUpvote(Upvote upvote);
}
