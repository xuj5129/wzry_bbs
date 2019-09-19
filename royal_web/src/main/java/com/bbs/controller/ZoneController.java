package com.bbs.controller;

import com.bbs.domain.UserInfo;
import com.bbs.domain.Zone;
import com.bbs.domain.ZoneApply;
import com.bbs.service.UserService;
import com.bbs.service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/zone")
public class ZoneController {

    @Autowired
    private ZoneService zoneService;
    @Autowired
    private UserService userService;

    //添加板块
    @RequestMapping("/addZone.do")
    public ModelAndView addZone(ZoneApply zoneApply){

        ModelAndView mv = new ModelAndView();
        UserInfo showUser = userService.findUserObjectByUsername(zoneApply.getUserName());
        //查询板块是否存在
        String msg = zoneService.findZoneName(zoneApply);
        mv.addObject("msg",msg);
        mv.addObject("zoneApply",zoneApply);
        mv.addObject("showUser",showUser);
        mv.setViewName("addzone");
        return mv;
    }

    @RequestMapping("/findThisZoneByZoneId.do")
    public @ResponseBody Zone findThisZoneByZoneId(int zoneId){
        return zoneService.findZoneByZoneId(zoneId);
    }

}
