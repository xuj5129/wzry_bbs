package com.bbs.domain;

import java.util.Date;

public class UserInfo {
    private Integer userid;

    private String username;

    private String userpass;//密码

    private String email;//邮箱

    private String picurl;//头像

    private Integer role;//1代表普通用户；2代表高级用户，3代表超级管理员

    private Date lastlogintime;

    private Integer loginstatus;//登录状态，0代表未登录，1代表已登录

    private Integer talkstatus;

    private Integer isupdating;//申请升级(0-未申请,1-已申请)

    private Integer updatestatus;//申请升级审核状态(0-未处理,1-已处理)

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public Integer getLoginstatus() {
        return loginstatus;
    }

    public void setLoginstatus(Integer loginstatus) {
        this.loginstatus = loginstatus;
    }

    public Integer getTalkstatus() {
        return talkstatus;
    }

    public void setTalkstatus(Integer talkstatus) {
        this.talkstatus = talkstatus;
    }

    public Integer getIsupdating() {
        return isupdating;
    }

    public void setIsupdating(Integer isupdating) {
        this.isupdating = isupdating;
    }

    public Integer getUpdatestatus() {
        return updatestatus;
    }

    public void setUpdatestatus(Integer updatestatus) {
        this.updatestatus = updatestatus;
    }
}