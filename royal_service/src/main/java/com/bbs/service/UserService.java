package com.bbs.service;

import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;

import java.util.List;


public interface UserService {
    void update(UserInfo userInfo);

    ResultInfo login(UserInfo userInfo);

    ResultInfo findByUsername(String username);

    List<UserInfo> findUserOnline();

    int numOfUserOnline();


    List<UserInfo> searchUser(UserInfo userInfo);
}
