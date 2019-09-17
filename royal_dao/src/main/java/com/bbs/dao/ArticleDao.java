package com.bbs.dao;

import com.bbs.domain.Article;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Insert("INSERT  INTO bbs_article_table(title,content,sendTime,senderName,isTop,replyCount,upvoteCount,browseCount,zoneId,isReport) VALUES (#{title},#{content},#{sendTime},#{senderName},0,0,0,0,#{zoneId},0)")
    void saveArticle(Article article);

    /**
     * 显示帖子详情
     * @param id
     * @return
     */

    @Select("select * from bbs_article_table where articleId=#{id}")
    @Results({
            @Result(column = "articleId",property = "articleId"),
            @Result(column = "title",property = "title"),
            @Result(column = "content",property = "content"),
            @Result(column = "sendTime",property = "sendTime"),
            @Result(column = "senderName",property = "senderName"),
            @Result(column = "isTop",property = "isTop"),
            @Result(column = "replyCount",property = "replyCount"),
            @Result(column = "upvoteCount",property = "upvoteCount"),
            @Result(column = "browseCount",property = "browseCount"),
            @Result(column = "articleId", property = "comments", javaType = List.class, many =
            @Many(select = "com.bbs.dao.CommentDao.findCommentByArticleId"))
    })
    Article findById(Integer id);
    //查询今日贴数
    @Select("select count(*) from bbs_article_table where sendTime like 'format%'")
    int getNumOfTodayArticle(String format);


    @Update("update bbs_article_table set isTop = #{isTop} where articleId =#{id}")
    void changeStatus(@Param("id") int id,@Param("isTop") Integer isTop);
}
