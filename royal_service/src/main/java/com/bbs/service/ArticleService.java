package com.bbs.service;

import com.bbs.domain.Article;
import com.bbs.domain.Comment;
import com.bbs.domain.Reply;
import com.bbs.domain.Report;

import java.util.List;

public interface ArticleService {

    int saveArticle(Article article);

    void saveComment(Comment comment);

    void saveReply(Reply reply);

    void changeStatus(int id, Integer isTop);

    void deleteArticle(int id, Integer isReport);

    int findArticleIdByCommentId(int commentId);

    List<Article> findAll(int page,int pageSize);


    int getTotalArticleNum();

    Article findById(Integer id);
    

    List<Article> findByTitle(String title , String sendername) throws Exception;

    int getNumOfTodayArticle();

    List<Article> findArticleNotReport(int page,int zoneId);

    List<Article> findArticleByWord(String keyWord);

    void saveReport(Report report);

    int findArticleNumWithUsername(String username);

    List<Article> replaceWord(List<Article> articles);

    List<Article> searchArticle(String title, String sendername) throws Exception;
}

