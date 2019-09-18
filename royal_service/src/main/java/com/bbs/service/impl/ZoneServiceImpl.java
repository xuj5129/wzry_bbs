package com.bbs.service.impl;

import com.bbs.dao.ZoneDao;
import com.bbs.domain.Zone;
import com.bbs.domain.ZoneApply;
import com.bbs.service.ZoneService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    /**
     * 先根据默认属性升序排序，再根据id属性排序，显示所有板块
     * @return
     */
    @Override
    public List<Zone> findAllByDefASCAndZoneIdASC() {
        return zoneDao.findAllByDefASCAndZoneIdASC();
    }

    //查询所有申请的版块
    @Override
    public List<ZoneApply> findAll(Integer page, int pageSize) {
        PageHelper.startPage(page,pageSize);
        return zoneDao.findAll();
    }

    //往版块中增加新版块名字
    @Override
    public void addZone(String zoneName) {
        zoneDao.addZoneName(zoneName);

    }

    //改变申请版块的处理状态
    @Override
    public void changeStatus(int applyZoneId) {
        zoneDao.changeStatus(applyZoneId);
    }
}
