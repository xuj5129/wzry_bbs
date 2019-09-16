package com.bbs.dao;

import com.bbs.domain.Reply;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {

    @Select("select * from bbs_reply_table where commentid=#{commentId}")
    List<Reply> findReplyByCommentId(int id);
}
