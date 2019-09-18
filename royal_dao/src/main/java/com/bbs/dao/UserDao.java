package com.bbs.dao;

import com.bbs.domain.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 根据 权限查询用户列表
     * @param role
     * @return
     */
    @Select("select * from bbs_user_table")
    List<UserInfo> findByUserRole(int role);

    /**
     * 查询所有用户
     * @return
     */


    @Select("select * from bbs_user_table where username like #{username}")
    List<UserInfo> findLikeUsername(String username);

    @Select("select * from bbs_user_table where username like #{username} and role= #{role} ")
    List<UserInfo> findLikeUsernameWithRole(String username , int role);


    @Select("SELECT * FROM bbs_user_table WHERE loginStatus = 1 ")
    List<UserInfo> findUserOnline();

    @Select("SELECT count(*) FROM bbs_user_table WHERE loginStatus = 1 ")
    int numOfUserOnline();

    @Select("select * from bbs_user_table where username=#{username}")
    UserInfo findUserByUserName(String username);

    @Select("select * from bbs_user_table order by isupdating desc")
    List<UserInfo> findAll();


    @Insert("insert into bbs_user_table(username,userpass,email)values(#{username},#{userpass},#{email})")
    void save(UserInfo userInfo);

    //修改邮箱
    @Update("update bbs_user_table set email = #{email} where username = #{username}")
    int changeEmail( String email);

    //修改图片
    @Insert("update bbs_user_table set picUrl = #{picUrl} where username = #{username}")
    int changePicUrl(String picUrl);

    //根据密码查找用户
    @Select("select * from bbs_user_table where userpass = #{oldPassword}")
    UserInfo findPwd(String oldPassword);

    //修改密码
    @Update("update bbs_user_table set userpass = #{newPassword} where username = #{username}")
    void updatePwd(@Param("username") String username, @Param("newPassword") String newPassword);

    @Update("UPDATE bbs_user_table SET isupdating = 1  WHERE userName = #{username} ")
    int requestHigherUser(String username);

    @Update("update bbs_user_table set role=2,isupdating=0,updateStatus=1 where userId=#{userId}")
    void upRole(int userId);

    @Update("update bbs_user_table set talkStatus=#{talkStatus} where userId=#{userId}")
    void changeTalk(@Param("userId") int userId,@Param("talkStatus") int talkStatus);

    @Select("select talkStatus from bbs_user_table where username=#{username}")
    int findTalkStatusByuserName(String username);
}
