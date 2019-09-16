package com.bbs.service;

import com.bbs.domain.Article;

import java.util.List;

public interface ArticleService {

    void saveArticle(Article article);

    List<Article> findAll(int page,int pageSize);

    int getTotalArticleNum();

    Article findById(Integer id);

    int getNumOfTodayArticle();
}
