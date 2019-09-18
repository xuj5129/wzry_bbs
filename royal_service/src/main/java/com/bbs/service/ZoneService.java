package com.bbs.service;

import com.bbs.domain.Zone;
import com.bbs.domain.ZoneApply;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ZoneService {


    String findZoneName(ZoneApply zoneApply);

    List<ZoneApply> findAll(Integer page, int pageSize);

    void addZone(String zoneName);

    void changeStatus(int applyZoneId);
}
