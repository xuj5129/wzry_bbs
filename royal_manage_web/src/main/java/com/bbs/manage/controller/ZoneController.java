package com.bbs.manage.controller;

import com.bbs.domain.Zone;
import com.bbs.domain.ZoneApply;
import com.bbs.service.ZoneService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/zone")
public class ZoneController {

    @Autowired
    private ZoneService zoneService;

    //查询所有申请的版块
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "pageSize", required = true, defaultValue = "4") int pageSize){
        ModelAndView mv = new ModelAndView();

        List<ZoneApply> zones = zoneService.findAll(page,pageSize);
        PageInfo pageInfo = new PageInfo(zones);
        mv.addObject("pageInfo",pageInfo );
        mv.setViewName("zoneApplyPage");
        return mv;
    }

    //增加新增的申请版块
    @RequestMapping("/addZone.do")
    public String addZone(HttpServletRequest request, int page){
        String zoneName=null;
        try {
            zoneName= new String(request.getParameter("zoneName").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        zoneService.addZone(zoneName);
        int applyZoneId =Integer.parseInt( request.getParameter("applyZoneId"));
        zoneService.changeStatus(applyZoneId);
        return "redirect:findAll.do?page="+page;
    }


    //改变申请版块的处理状态
    @RequestMapping("/changeStatus.do")
    public String changeStatus(int applyZoneId ,int page){
        zoneService.changeStatus(applyZoneId);
        return "redirect:findAll.do?page="+page;
    }

    //查询所有板块
    @RequestMapping("/findAllZone.do")
    public ModelAndView findAllZone(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                    @RequestParam(name = "pageSize", required = true, defaultValue = "8") int pageSize){

        ModelAndView mv = new ModelAndView();
       List<Zone> zones =  zoneService.findAllZone(page,pageSize);
       PageInfo pageInfo = new PageInfo(zones);
       mv.addObject("pageInfo", pageInfo);
        mv.addObject("pageInfo",pageInfo );
        mv.setViewName("zonePage");
        return mv;
    }


    @RequestMapping("/changeIsDef.do")
    public String changeIsDef(int zoneId,int isDef,Integer page){
        zoneService.changeIsDef(zoneId,isDef);
        return "redirect:findAllZone.do?page="+page;
    }

    @RequestMapping("/changeShield.do")
    public String changeShield(int zoneId,int isDef,Integer page){
        zoneService.changeShield(zoneId,isDef);
        return "redirect:findAllZone.do?page="+page;
    }

}
