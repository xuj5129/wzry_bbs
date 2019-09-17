package com.bbs.service;

import com.bbs.domain.Article;
import com.bbs.domain.Comment;
import com.bbs.domain.Reply;

import java.util.List;

public interface ArticleService {

    void saveArticle(Article article);

    void saveComment(Comment comment);

    void saveReply(Reply reply);

    int findArticleIdByCommentId(int commentId);

    List<Article> findAll(int page,int pageSize);

    List<Article> findAllWhereNotReport();

    int getTotalArticleNum();

    Article findById(Integer id);

    int getNumOfTodayArticle();


    void changeStatus(int id, Integer isTop);

    void deleteArticle(int id, Integer isReport);
}
