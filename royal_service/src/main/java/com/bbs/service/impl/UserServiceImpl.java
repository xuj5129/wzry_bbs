package com.bbs.service.impl;

import com.bbs.dao.UserDao;
import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service("userService")
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
            userDao.changeLoginStatus(existUser.getUsername(),1);
            existUser.setLoginstatus(1);
            resultInfo.setObject(existUser);
        } else {
            resultInfo.setSuccess(false);
            resultInfo.setMsg("用户名或密码错误");
        }
        return resultInfo;
    }


    public void changeLoginStatus(String username,Integer loginStatus){
        userDao.changeLoginStatus(username,loginStatus);

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
    public List<UserInfo> searchUser(String username, String roleStr) {

        Integer role;
        try {
            role = Integer.parseInt(roleStr);

            if (username == null) {

                PageHelper.startPage(1, 7);
                return userDao.findByRole(role);
            } else {


                try {
                    PageHelper.startPage(1, 7);
                    return userDao.findLikeUsernameWithRole("%" + username + "%", role);
                } catch (Exception e) {
                    return null;
                }

            }

        } catch (Exception e) {

            if (username == null) {

                PageHelper.startPage(1, 7);
                return userDao.findAll();

            } else {

                try { PageHelper.startPage(1, 7);
                    return userDao.findLikeUsername("%" + username + "%");
                } catch (Exception e1) {
                    return null;
                }


            }
        }
    }

    @Override
    public int findTalkStatusByuserName(String username) {
        return userDao.findTalkStatusByuserName(username);
    }

    @Override
    public void register(UserInfo userInfo) {
        userInfo.setLoginstatus(1);
        userDao.save(userInfo);

    }

    //查询所有用户信息
    @Override
    public List<UserInfo> findAll(Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        return userDao.findAll();
    }

    @Override
    public String changeEmailAndPicUrl(UserInfo existUser) {
        //修改图片路径
        userDao.changePicUrl(existUser.getPicurl(),existUser.getUsername());
        //修改邮箱
        userDao.changeEmail(existUser.getEmail(),existUser.getUsername());
        return "修改成功";
    }

    //修改密码
    @Override
    public ResultInfo checkExistPwd(String oldPassword, String newPassword, String username) {
        UserInfo user = userDao.findUserByUserName(username);
        if (!user.getUserpass().equals(oldPassword)) {
            return new ResultInfo("旧密码不正确！");
        } else if (user.getUserpass().equals(newPassword)){
            return new ResultInfo("新旧密码不能相同！");
        }else  {
            userDao.updatePwd(newPassword,username);
            return new ResultInfo("修改成功！");
        }
    }

    //发起高级用户授权申请
    @Override
    public String requestHigherUser(String username) {
        int num = userDao.requestHigherUser(username);
        if (num == 1) {
            return "申请成功，待审核!";
        } else {
            return "申请失败，请重新申请!";
        }
    }


    //对申请升等级的用户进行升级
    @Override
    public void upRole(int userId) {
        userDao.upRole(userId);


    }

    //更改用户禁言状态
    @Override
    public void changeTalk(int userId, int talkStatus) {
        if(talkStatus == 1){
            talkStatus=0;
            userDao.changeTalk(userId,talkStatus);
        }else {
            talkStatus = 1;
            userDao.changeTalk(userId,talkStatus);
        }

    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        UserInfo userInfo= null;
        try {
            userInfo = userDao.findByUsername(s);
        } catch (Exception e) {
            e.printStackTrace();
        }

        User user = new User(userInfo.getUsername(),"{noop}"+userInfo.getUserpass(),
                true,true,true,true,getAuthority(userInfo.getRole()));
        return user;
    }

    private Collection<? extends GrantedAuthority> getAuthority(Integer role) {
        String roleStr="USER";
        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
        if(role==1){
            roleStr="USER";
        }
        if (role==2){
            roleStr="SUPERUSER";
        }
        if(role==3){
            roleStr="ADMIN";
        }
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_"+roleStr);
        list.add(authority);
        return list;
    }

    public UserInfo findUserObjectByUsername(String username){
        return userDao.findByUsername(username);
    }
}
