package com.bbs.dao;

import com.bbs.domain.ZoneApply;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ZoneDao {

    @Select("select zoneName from bbs_zone_table where zoneId=#{zoneId} ")
    String findNameById(int zoneId);

    @Insert("insert into bbs_zoneApply_table(zoneName,userName,reason,status)values (#{zoneName},#{userName},#{reason},#{status})")
    void addZone(ZoneApply zoneApply);

    @Select("select * from bbs_zoneApply_table where zoneName = #{zoneName}")
    ZoneApply findZoneName(String zoneName);
}
