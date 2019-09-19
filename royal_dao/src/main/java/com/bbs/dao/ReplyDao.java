package com.bbs.dao;

import com.bbs.domain.Reply;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {

    /**
     * 根据回复编号查询评论数据
     * @param id
     * @return
     */
    @Select("select * from bbs_reply_table where commentid=#{commentId}")
    @Results({
            @Result(column = "replyId",property = "replyId"),
            @Result(column = "replyContent",property = "replyContent"),
            @Result(column = "replyTime",property = "replyTime"),
            @Result(column = "replyUserName",property = "replyUserName"),
            @Result(column = "commentId",property = "commentId"),
            @Result(column = "replyUserName",property = "userInfo",one =
            @One(select = "com.bbs.dao.UserDao.findUserByUserName"))
    })
    List<Reply> findReplyByCommentId(int id);

    /**
     * 评论功能、保存评论
     * @param reply
     */
    @Insert("insert into bbs_reply_table(replyContent,replyTime,replyUserName,commentId) " +
            "values(#{replyContent},#{replyTime},#{replyUserName},#{commentId})")
    void saveReply(Reply reply);

    /**
     * 根据回复编号从新到旧查询评论数据
     * @param id
     * @return
     */
    @Select("select * from bbs_reply_table where commentid=#{commentId} order by replyTime DESC")
    @Results({
            @Result(column = "replyId",property = "replyId"),
            @Result(column = "replyContent",property = "replyContent"),
            @Result(column = "replyTime",property = "replyTime"),
            @Result(column = "replyUserName",property = "replyUserName"),
            @Result(column = "commentId",property = "commentId"),
            @Result(column = "replyUserName",property = "userInfo",one =
            @One(select = "com.bbs.dao.UserDao.findUserByUserName"))
    })
    List<Reply> findReplyByCommentIdAndNewTime(int id);
}
