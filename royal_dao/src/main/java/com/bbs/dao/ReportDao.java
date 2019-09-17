package com.bbs.dao;

import com.bbs.domain.Report;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportDao {

    @Select("select * from bbs_report_table where reportStatus = 1")
    List<Report> findAll();

    @Update("update bbs_report_table set reportStatus = 2 where reportId =#{reportId}")
    void updateStatus(int reportId);
}
