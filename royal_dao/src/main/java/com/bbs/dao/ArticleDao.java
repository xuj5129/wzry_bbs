package com.bbs.dao;

import com.bbs.domain.Article;
import org.apache.ibatis.annotations.Insert;
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


    /**
     *发表帖子
     * @param article
     */
    @Insert("INSERT  INTO bbs_article_table(title,content,sendTime,senderName,isTop,replyCount,upvoteCount,browseCount,zoneId,isReport) VALUES (#{title},#{content},#{sendtime},#{sendername},0,0,0,0,#{zoneid},0)")
    void saveArticle(Article article);

    /**
     * 显示帖子详情
     * @param id
     * @return
     */
    @Select("select * from bbs_article_table where articleid=#{id}")
    Article findById(Integer id);
    //查询今日贴数
    @Select("select count(*) from bbs_article_table where sendTime like 'format%'")
    int getNumOfTodayArticle(String format);
}
