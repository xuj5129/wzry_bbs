package com.bbs.service;

import com.bbs.domain.Word;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WordService {
    List<Word> findAll(Integer page, Integer pageSize);

    void changeStatus(Integer wordId, Integer status);

    void addWord(String word);
}
