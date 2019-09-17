package com.bbs.service;

import com.bbs.domain.Article;

import java.util.List;

public interface ArticleService {

    void saveArticle(Article article);

    List<Article> findAll(int page,int pageSize);

    int getTotalArticleNum();

    Article findById(Integer id);

    int getNumOfTodayArticle();


    void changeStatus(int id, Integer isTop);

    void deleteArticle(int id, Integer isReport);
}
