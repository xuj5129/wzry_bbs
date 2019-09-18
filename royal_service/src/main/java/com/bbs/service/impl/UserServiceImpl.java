package com.bbs.service.impl;

import com.bbs.dao.UserDao;
import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;
import com.bbs.dao.UserDao;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void update(UserInfo userInfo) {
        userDao.update(userInfo);

    }
    //用户登录
    @Override
    public ResultInfo login(UserInfo userInfo) {
        ResultInfo resultInfo = new ResultInfo();
        UserInfo existUser = userDao.find4Login(userInfo);
        if(existUser!=null){
            resultInfo.setSuccess(true);
            resultInfo.setObject(existUser);
        }else {
            resultInfo.setSuccess(false);
            resultInfo.setMsg("用户名或密码错误");
        }
        return resultInfo;
    }

    @Override
    public ResultInfo findByUsername(String username) {
        ResultInfo resultInfo = new ResultInfo();
        UserInfo userInfo=userDao.findByUsername(username);
        //用户名已被注册
        if(userInfo!=null){
            resultInfo.setSuccess(false);
        }else {
            resultInfo.setSuccess(true);
        }
        return resultInfo;
    }
    @Override
    public List<UserInfo> findUserOnline() {
        return userDao.findUserOnline();
    }

    @Override
    public int numOfUserOnline() {
        return userDao.numOfUserOnline();
    }

    @Override
    public void register(UserInfo userInfo) {
        userDao.save(userInfo);

    }

    //查询所有用户信息
    @Override
    public List <UserInfo> findAll(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return userDao.findAll();
    }

    //对申请升等级的用户进行升级
    @Override
    public void upRole(int userId) {
        userDao.upRole(userId);


    }

    //更改用户禁言状态
    @Override
    public void changeTalk(int userId, int talkStatus) {
        if(talkStatus == 1){
            talkStatus=0;
            userDao.changeTalk(userId,talkStatus);
        }else {
            talkStatus = 1;
            userDao.changeTalk(userId,talkStatus);
        }

    }
}
