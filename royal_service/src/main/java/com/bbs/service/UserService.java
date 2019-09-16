package com.bbs.service;

import com.bbs.domain.UserInfo;

import java.util.List;

public interface UserService {

    List<UserInfo> findUserOnline();

    int numOfUserOnline();
}
