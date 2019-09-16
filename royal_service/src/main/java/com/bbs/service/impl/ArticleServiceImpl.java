package com.bbs.service.impl;

import com.bbs.dao.ArticleDao;
import com.bbs.domain.Article;
import com.bbs.service.ArticleService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;


    @Override
    public int getNumOfTodayArticle() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(date);
        return articleDao.getNumOfTodayArticle(format);
    }

    public void saveArticle(Article article) {
        article.setSendTime(new Date());
        articleDao.saveArticle(article);
    }

    @Override
    public List<Article> findAll(int page,int pageSize) {
        PageHelper.startPage(page,pageSize);
        return articleDao.findAll();
    }

    @Override
    public int getTotalArticleNum() {
        return articleDao.getTotalArticleNum();
    }

    @Override
    public Article findById(Integer id) {
        return articleDao.findById(id);
    }
}
