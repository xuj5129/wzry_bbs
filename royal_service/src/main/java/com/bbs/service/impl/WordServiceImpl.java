package com.bbs.service.impl;

import com.bbs.dao.WordDao;
import com.bbs.domain.Word;
import com.bbs.service.WordService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("wordService")
public class WordServiceImpl implements WordService {

    @Autowired
    private WordDao wordDao;

    //查询所有敏感词
    @Override
    public List<Word> findAll(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return wordDao.findAll();
    }

    //更改敏感词汇使用状态
    @Override
    public void changeStatus(Integer wordId, Integer status) {
        if(status == 0){
            status = 1;
            wordDao.changeStatus(wordId,status);
        }else{
            status = 0;
            wordDao.changeStatus(wordId,status);
        }
    }

    //增加敏感词汇
    @Override
    public void addWord(String word) {
        wordDao.addWord(word);
    }
}
