package com.bbs.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleDao {

    //查询总帖数
    @Select("select count(*) from bbs_article_table")
    int getTotalArticleNum();

    //查询今日贴数
    @Select("select count(*) from bbs_article_table where sendTime like 'format%'")
    int getNumOfTodayArticle(String format);
}
