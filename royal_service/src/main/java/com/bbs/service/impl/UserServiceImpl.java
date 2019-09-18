package com.bbs.service.impl;

import com.bbs.dao.UserDao;
import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        if (existUser != null) {
            resultInfo.setSuccess(true);
            resultInfo.setObject(existUser);
        } else {
            resultInfo.setSuccess(false);
            resultInfo.setMsg("用户名或密码错误");
        }
        return resultInfo;
    }

    @Override
    public ResultInfo findByUsername(String username) {
        ResultInfo resultInfo = new ResultInfo();
        UserInfo userInfo = userDao.findByUsername(username);
        //用户名已被注册
        if (userInfo != null) {
            resultInfo.setSuccess(false);
        } else {
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
    public List<UserInfo> searchUser(UserInfo userInfo) {
        List<UserInfo> userInfoList = new ArrayList<>();
        userInfo.setUsername("%" + userInfo.getUsername() + "%");

        if (userInfo.getRoleStr() == null || userInfo.getRole() < 1 || userInfo.getRole() > 3) {
            //等同没有 role条件，   对name 模糊全查询
            userInfoList = userDao.findLikeUsername(userInfo.getUsername());
        } else {
            //name模糊查询，限定 role

            userInfoList = userDao.findLikeUsernameWithRole(userInfo.getUsername(), userInfo.getRole());
        }

        return userInfoList;
    }
}
