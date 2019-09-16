package com.bbs.service.impl;

import com.bbs.dao.UserDao;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<UserInfo> findUserOnline() {
        return userDao.findUserOnline();
    }

    @Override
    public int numOfUserOnline() {
        return userDao.numOfUserOnline();
    }
}
