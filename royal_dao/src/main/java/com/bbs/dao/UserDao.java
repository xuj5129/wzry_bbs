package com.bbs.dao;

import com.bbs.domain.UserInfo;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDao {
    @Update("update bbs_user_table set email=#{email},picUrl=#{picurl} where userid=#{userid}")
    void update(UserInfo userInfo);
    @Select("select * from bbs_user_table where username=#{username} and userpass=#{userpass}")
    UserInfo find4Login(UserInfo userInfo);

    @Select("select * from bbs_user_table where username=#{username}")
    UserInfo findByUsername(String username);
}
