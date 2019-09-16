package com.bbs.domain;

import java.util.Date;

public class Comment {
    private Integer commentid;

    private String commentcontent;

    private Date commenttime;

    private String commentusername;

    private Integer commentstatus;

    private Integer articleid;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent == null ? null : commentcontent.trim();
    }

    public Date getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(Date commenttime) {
        this.commenttime = commenttime;
    }

    public String getCommentusername() {
        return commentusername;
    }

    public void setCommentusername(String commentusername) {
        this.commentusername = commentusername == null ? null : commentusername.trim();
    }

    public Integer getCommentstatus() {
        return commentstatus;
    }

    public void setCommentstatus(Integer commentstatus) {
        this.commentstatus = commentstatus;
    }

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }
}