package com.bbs.domain;

/**
 * 点赞表
 */
public class Upvote {
    private String upvoteUserName;//点赞人用户名
    private Integer upvoteArticleId;//点赞的帖子id
    private Integer isUpvote;//点赞状态  0为未点赞 ， 1为已点赞  数据库默认为1；

    public String getUpvoteUserName() {
        return upvoteUserName;
    }

    public void setUpvoteUserName(String upvoteUserName) {
        this.upvoteUserName = upvoteUserName;
    }

    public Integer getUpvoteArticleId() {
        return upvoteArticleId;
    }

    public void setUpvoteArticleId(Integer upvoteArticleId) {
        this.upvoteArticleId = upvoteArticleId;
    }

    public Integer getIsUpvote() {
        return isUpvote;
    }

    public void setIsUpvote(Integer isUpvote) {
        this.isUpvote = isUpvote;
    }
}
