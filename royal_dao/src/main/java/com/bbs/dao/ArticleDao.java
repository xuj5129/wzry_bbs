package com.bbs.dao;

import com.bbs.domain.Article;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao {
    /**
     * 查询所有帖子信息
     * @return
     */
    @Select("select * from bbs_article_table")
    List<Article> findAll();

    /**
     * 获取所有帖子数
     * @return
     */
    @Select("select count(*) from bbs_article_table")
    int getTotalArticleNum();

}
