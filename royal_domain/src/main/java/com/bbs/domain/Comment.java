package com.bbs.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Comment {
    private Integer commentId;

    private String commentContent;

    private Date commentTime;

    private String commentUserName;

    private Integer commentStatus;

    private Integer articleId;

    private List<Reply> replys;


    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentTime() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        return sdf.format(commentTime);
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentUserName() {
        return commentUserName;
    }

    public void setCommentUserName(String commentUserName) {
        this.commentUserName = commentUserName;
    }

    public Integer getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(Integer commentStatus) {
        this.commentStatus = commentStatus;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public List<Reply> getReplys() {
        return replys;
    }

    public void setReplies(List<Reply> replys) {
        this.replys = replys;
    }
}