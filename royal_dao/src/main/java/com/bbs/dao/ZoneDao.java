package com.bbs.dao;

import org.apache.ibatis.annotations.Select;

public interface ZoneDao {

    @Select("select zoneName from bbs_zone_table where zoneId=#{zoneId} ")
    String findNameById(int zoneId);
}
