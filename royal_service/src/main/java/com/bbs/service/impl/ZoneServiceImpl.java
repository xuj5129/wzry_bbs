package com.bbs.service.impl;

import com.bbs.dao.ZoneDao;
import com.bbs.domain.ZoneApply;
import com.bbs.service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ZoneServiceImpl implements ZoneService {

    @Autowired
    private ZoneDao zoneDao;

    //添加新板块
    @Override
    public String findZoneName(ZoneApply zoneApply) {
        ZoneApply exitZoneApply = zoneDao.findZoneName(zoneApply.getZoneName());
        if(exitZoneApply==null){
            //板块不存在，新增
            zoneApply.setStatus(0);
            zoneDao.addZone(zoneApply);
            return "保存成功，待审核！";
        }else {
            //板块已存在，提示
            return "板块已存在";
        }

    }
}
