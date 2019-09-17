package com.bbs.controller;

import com.bbs.domain.ZoneApply;
import com.bbs.service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/zone")
public class ZoneController {

    @Autowired
    private ZoneService zoneService;


    //添加板块
    @RequestMapping("/addZone.do")
    public ModelAndView addZone(ZoneApply zoneApply){

        ModelAndView mv = new ModelAndView();
        //查询板块是否存在
        String msg = zoneService.findZoneName(zoneApply);
        mv.addObject("msg",msg);
        mv.addObject("zoneApply",zoneApply);
        mv.setViewName("addZone");
        return mv;
    }

}
