package com.bbs.dao;

import com.bbs.domain.UserInfo;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;
public interface UserDao {
    @Update("update bbs_user_table set email=#{email},picUrl=#{picurl} where userid=#{userid}")
    void update(UserInfo userInfo);
    @Select("select * from bbs_user_table where username=#{username} and userpass=#{userpass}")
    UserInfo find4Login(UserInfo userInfo);

    @Select("select * from bbs_user_table where username=#{username}")
    UserInfo findByUsername(String username);


    @Select("SELECT * FROM bbs_user_table WHERE loginStatus = 1 ")
    List<UserInfo> findUserOnline();

    @Select("SELECT count(*) FROM bbs_user_table WHERE loginStatus = 1 ")
    int numOfUserOnline();

    @Select("select * from bbs_user_table where username=#{username}")
    UserInfo findUserByUserName(String username);
}
