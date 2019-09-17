package com.bbs.service;

import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;

public interface UserService {
    void update(UserInfo userInfo);

    ResultInfo login(UserInfo userInfo);

    ResultInfo findByUsername(String username);
}
