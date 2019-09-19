package com.bbs.dao;

import com.bbs.domain.Comment;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {
    /**
     * 根据帖子id查询回复数据
     * @param id
     * @return
     */
    @Select("select * from bbs_comment_table where commentStatus=0 and articleId=#{id} ")
    @Results({
            @Result(column = "commentId",property = "commentId"),
            @Result(column = "commentContent",property = "commentContent"),
            @Result(column = "commentTime",property = "commentTime"),
            @Result(column = "commentUserName",property = "commentUserName"),
            @Result(column = "commentStatus",property = "commentStatus"),
            @Result(column = "articleId",property = "articleId"),
            @Result(column = "commentUserName",property = "userInfo",one =
            @One(select = "com.bbs.dao.UserDao.findUserByUserName")),
            @Result(column = "commentId",property = "replys",javaType = List.class,many =
            @Many(select = "com.bbs.dao.ReplyDao.findReplyByCommentId"))
    })
    List<Comment> findCommentByArticleId(int id);

    /**
     * 根据帖子id从新到旧查询回复数据
     * @param id
     * @return
     */
    @Select("select * from bbs_comment_table where commentStatus=0 and articleId=#{id} order by commentTime DESC")
    @Results({
            @Result(column = "commentId",property = "commentId"),
            @Result(column = "commentContent",property = "commentContent"),
            @Result(column = "commentTime",property = "commentTime"),
            @Result(column = "commentUserName",property = "commentUserName"),
            @Result(column = "commentStatus",property = "commentStatus"),
            @Result(column = "articleId",property = "articleId"),
            @Result(column = "commentUserName",property = "userInfo",one =
            @One(select = "com.bbs.dao.UserDao.findUserByUserName")),
            @Result(column = "commentId",property = "replys",javaType = List.class,many =
            @Many(select = "com.bbs.dao.ReplyDao.findReplyByCommentIdAndNewTime"))
    })
    List<Comment> findCommentByArticleIdAndNewTime(int id);

    /**
     * 回复功能、保存回复
     * @param comment
     */
    @Insert("insert into bbs_comment_table(commentContent,commentTime,commentUserName,articleId)" +
            " values (#{commentContent},#{commentTime},#{commentUserName},#{articleId})")
    void saveComment(Comment comment);

    /**
     * 根据评论id查询出帖子id
     * @param commentId
     * @return
     */
    @Select("select articleId from bbs_comment_table where commentId=#{commentId}")
    int findArticleIdByCommentId(int commentId);

    /**
     * 根据帖子ID查询该帖子的评论数
     * @param articleId
     * @return
     */
    @Select("select count(*) from bbs_comment_table where articleId=#{articleId} AND commentStatus=0")
    int getCommentCountByArticleId(int articleId);

    @Update("update bbs_comment_table set commentStatus=1 where commentId=#{commentId}")
    void changeCommentStatus(int commentId);
}
