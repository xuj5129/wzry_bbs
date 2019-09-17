package com.bbs.service.impl;

import com.bbs.dao.UserDao;
import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void update(UserInfo userInfo) {
        userDao.update(userInfo);

    }

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
}
