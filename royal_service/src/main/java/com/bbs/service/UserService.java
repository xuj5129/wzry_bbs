package com.bbs.service;

import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;

import com.bbs.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    void update(UserInfo userInfo);

    ResultInfo login(UserInfo userInfo);

    ResultInfo findByUsername(String username);

    List<UserInfo> findUserOnline();

    int numOfUserOnline();

    void register(UserInfo userInfo);

    List<UserInfo> findAll(Integer page, Integer pageSize);

    void upRole(int userId);

    void changeTalk(int userId, int talkStatus);


    List<UserInfo> searchUser(UserInfo userInfo);
}
