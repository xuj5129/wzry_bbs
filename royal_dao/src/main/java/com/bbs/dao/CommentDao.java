package com.bbs.dao;

import com.bbs.domain.Comment;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {
    @Select("select * from bbs_comment_table where articleId=#{id} and commentStatus!=1")
    @Results({
            @Result(column = "commentId",property = "commentId"),
            @Result(column = "commentContent",property = "commentContent"),
            @Result(column = "commentTime",property = "commentTime"),
            @Result(column = "commentUserName",property = "commentUserName"),
            @Result(column = "commentStatus",property = "commentStatus"),
            @Result(column = "articleId",property = "articleId"),
            @Result(column = "commentId",property = "replys",javaType = List.class,many =
            @Many(select = "com.bbs.dao.ReplyDao.findReplyByCommentId"))
    })
    List<Comment> findCommentByArticleId(int id);

    @Insert("insert into bbs_comment_table(commentContent,commentTime,commentUserName,articleId)" +
            " values (#{commentContent},#{commentTime},#{commentUserName},#{articleId})")
    void saveComment(Comment comment);
}
