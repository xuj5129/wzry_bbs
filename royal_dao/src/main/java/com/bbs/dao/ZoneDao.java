package com.bbs.dao;

import com.bbs.domain.Zone;
import com.bbs.domain.ZoneApply;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

import java.util.List;

@Repository
public interface ZoneDao {

    @Select("select zoneName from bbs_zone_table where zoneId=#{zoneId} ")
    String findNameById(int zoneId);

    @Insert("insert into bbs_zoneApply_table(zoneName,userName,reason,status)values (#{zoneName},#{userName},#{reason},#{status})")
    void addZone(ZoneApply zoneApply);

    @Select("select * from bbs_zoneApply_table where zoneName = #{zoneName}")
    ZoneApply findZoneName(String zoneName);

    @Select("SELECT * FROM (SELECT * FROM bbs_zone_table WHERE isDef!=3 ORDER BY zoneId ASC) def_first ORDER BY isDef ASC")
    List<Zone> findAllByDefASCAndZoneIdASC();

    @Select("select * from bbs_zoneApply_table where status = 0")
    List<ZoneApply> findAll();

    @Insert("insert into bbs_zone_table(zoneName,isDef)values(#{zoneName},2) ")
    void addZoneName(String zoneName);

    @Update("update bbs_zoneapply_table set status = 1 where applyZoneId=#{applyZoneId}")
    void changeStatus(int applyZoneId);

    @Select("select * from bbs_zone_table")
    List<Zone> findAllZone();

    @Update("update bbs_zone_table set isDef = #{isDef} where zoneId=#{zoneId}")
    void changeIsDef(@Param("zoneId") int zoneId,@Param("isDef") int isDef);

    @Select("select * from bbs_zone_table where zoneId=#{zoneId}")
    Zone findZoneByZoneId(int zoneId);
}
