package com.bbs.service;

import com.bbs.domain.Report;

import java.util.List;

public interface ReportService {
    List<Report> findAll(Integer page, Integer pageSize);

    void updateStatus(int reportId);
}
