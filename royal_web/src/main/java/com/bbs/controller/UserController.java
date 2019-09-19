package com.bbs.controller;

import com.bbs.domain.ResultInfo;
import com.bbs.domain.UserInfo;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    //用户登录
    @RequestMapping("/login.do")
//    public @ResponseBody ResultInfo login(String username,String userpass, HttpSession session){
    public @ResponseBody ResultInfo login(UserInfo userInfo, HttpSession session){

       /* UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        userInfo.setUserpass(userpass);*/

        ResultInfo resultInfo=userService.login(userInfo);
        if(resultInfo.isSuccess()){
            session.setAttribute("existUser",resultInfo.getObject());

        }
        return resultInfo;


    }

    //根据用户名查询用户
    @RequestMapping("/checkUsernameByAjax.do")
    public @ResponseBody ResultInfo checkUsernameByAjax(String username){
        ResultInfo resultInfo=userService.findByUsername(username);
        return resultInfo;


    }

    //用户退出
    @RequestMapping("/logout.do")
    public  String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }
    //新用户注册
    @RequestMapping("/register.do")
    public ModelAndView register(UserInfo userInfo,HttpSession session){
        ModelAndView mv = new ModelAndView();
        if(userInfo.getUsername()!=null&&userInfo.getUserpass()!=null&&userInfo.getEmail()!=null){
            ResultInfo resultInfo = userService.findByUsername(userInfo.getUsername());
            //用户名可用
            if(resultInfo.isSuccess()){
                userService.register(userInfo);
                session.setAttribute("existUser",userInfo);
                mv.setViewName("success");

            }else {
                //用户名已被注册
                resultInfo.setMsg("用户名已被注册过");
                mv.addObject(resultInfo);
                mv.setViewName("register");
            }
            mv.addObject("userInfo",userInfo);

        }

        return mv;
    }
    //修改用户邮箱地址和头像
    @RequestMapping("/update.do")
    public String update(UserInfo userInfo){
        userService.update(userInfo);
        return "index";
    }
    //用户修改密码
    @RequestMapping("/updatePwd.do")
    public String updatePwd(String oldPassword,String newPassword){
        return "index";


    }


    @RequestMapping("/test")
    public ModelAndView testMethod(){

        ModelAndView mv = new ModelAndView();
        mv.setViewName("userInfo");
        return mv;
    }

    @RequestMapping("/findTalkStatusByUserName.do")
    public @ResponseBody int findTalkStatusByUserName(String userName){
        return userService.findTalkStatusByuserName(userName);
    }

    //修改邮箱地址,上传图片
    @RequestMapping("/changeEmailAndFileUpload.do")
    public ModelAndView changeEmailAndFileUpload(HttpServletRequest request, @RequestParam("file") MultipartFile upload, String email)throws Exception{

        UserInfo existUser = (UserInfo) request.getSession().getAttribute("existUser");
        ModelAndView mv = new ModelAndView();
        // 先获取到要上传的文件目录
        String path = request.getSession().getServletContext().getRealPath("/images");
        // 创建File对象，一会向该路径下上传文件
        File file = new File(path);
        // 判断路径是否存在，如果不存在，创建该路径
        if(!file.exists()) {
            file.mkdirs();
        }
        // 获取到上传文件的名称
        String filename = upload.getOriginalFilename();

        //判断是否是图片
        String substring = filename.substring(filename.lastIndexOf(".") + 1);
        if((!"jpg".equals(substring.toLowerCase())) && (!"png".equals(substring.toLowerCase()))){
            request.getSession().setAttribute("changeMsg","图片格式非法");
            mv.setViewName("userInfo");
            return mv;
        }

        String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
        // 把文件的名称唯一化
        filename = uuid+"_"+filename;
        // 上传文件
        upload.transferTo(new File(file,filename));

        //修改图片路径和邮箱
        existUser.setEmail(email);
        if (upload.getSize() != 0){
            existUser.setPicurl(filename);
        }

        String changeMsg = userService.changeEmailAndPicUrl(existUser);

        //再将修改后的用户信息存入session域中
        request.getSession().setAttribute("existUser",existUser);
        UserInfo showUser = userService.findUserObjectByUsername(existUser.getUsername());
        request.getSession().removeAttribute("changeMsg");
        mv.addObject("changeMsg",changeMsg);
        mv.addObject("showUser",showUser);
        mv.setViewName("userInfo");
        return mv;
    }

    //修改密码
    @RequestMapping("/checkExistPwd.do")
    public ModelAndView checkExistPwd(String username,String oldPassword ,String newPassword){
        ModelAndView mv = new ModelAndView();
        UserInfo user = userService.findUserObjectByUsername(username);
        ResultInfo resultInfo = userService.checkExistPwd(oldPassword,newPassword,username);
        mv.addObject("pwdMsg",resultInfo);
        mv.addObject("showUser",user);
        mv.addObject("oldPassword",oldPassword);
        mv.addObject("newPassword",newPassword);
        mv.setViewName("userPwd");
        return mv;
    }

    //普通用户发起高级用户申请
    @RequestMapping("/requestHigherUser.do")
    public ModelAndView requestHigherUser(String username){
        ModelAndView mv = new ModelAndView();
        String responseMsg = userService.requestHigherUser(username);
        UserInfo showUser = userService.findUserObjectByUsername(username);
        mv.addObject("showUser",showUser);
        mv.addObject("responseMsg",responseMsg);
        mv.setViewName("higherUser");
        return mv;
    }

    //个人中心的查询用户
    @RequestMapping("/showUserCenter.do")
    public ModelAndView showUserCenter(int pageCode,String username){
        UserInfo user = userService.findUserObjectByUsername(username);
        ModelAndView mv=new ModelAndView();
        mv.addObject("showUser",user);
        if(pageCode==1){
            mv.setViewName("userInfo");
        }else if(pageCode==2){
            mv.setViewName("userPwd");
        }else if(pageCode==3){
            mv.setViewName("higherUser");
        }else if(pageCode==4){
            mv.setViewName("addzone");
        }
        return mv;
    }

    @RequestMapping("/findUser.do")
    public @ResponseBody UserInfo findUser(String showName){
        UserInfo user = userService.findUserObjectByUsername(showName);
        return user;
    }

}
