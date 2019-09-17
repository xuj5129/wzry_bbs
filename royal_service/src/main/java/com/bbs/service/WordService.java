package com.bbs.service;

import com.bbs.domain.Word;

import java.util.List;

public interface WordService {
    List<Word> findAll(Integer page, Integer pageSize);

    void changeStatus(Integer wordId, Integer status);
}
