package com.bbs.service.impl;

import com.bbs.dao.ReportDao;
import com.bbs.domain.Report;
import com.bbs.service.ReportService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
   @Autowired
   private ReportDao reportDao;


   //查询所有被举报的帖子
    @Override
    public List<Report> findAll(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return reportDao.findAll();
    }

    //更改帖子举报状态
    @Override
    public void updateStatus(int reportId) {
        reportDao.updateStatus(reportId);
    }
}
