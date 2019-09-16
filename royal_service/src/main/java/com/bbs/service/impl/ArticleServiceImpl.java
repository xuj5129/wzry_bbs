package com.bbs.service.impl;

import com.bbs.dao.ArticleDao;
import com.bbs.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public int getTotalArticle() {
        return articleDao.getTotalArticleNum();
    }

    @Override
    public int getNumOfTodayArticle() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(date);
        return articleDao.getNumOfTodayArticle(format);
    }

}
