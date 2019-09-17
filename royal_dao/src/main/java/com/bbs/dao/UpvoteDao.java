package com.bbs.dao;

import com.bbs.domain.Upvote;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface UpvoteDao {

    @Select("select count(*) from bbs_upvote_table where upvoteArticleId=#{articleId} and isUpvote=1")
    int getUpvoteCountByArticleId(int articleId);

    @Select("select * from bbs_upvote_table where upvoteArticleId=#{articleId} and upvoteUserName=#{userName}")
    Upvote findUpvoteByArticleIdAndUserName(@Param("articleId")int articleId,@Param("userName")String userName);

    @Insert("insert into bbs_upvote_table(upvoteUserName,upvoteArticleId) values(#{upvoteUserName},#{upvoteArticleId})")
    void saveUpvote(Upvote upvote);

    @Update("update bbs_upvote_table set isUpvote=#{isUpvote} where upvoteArticleId=#{upvoteArticleId} and upvoteUserName=#{upvoteUserName}")
    void changeUpvote(Upvote upvote);
}
