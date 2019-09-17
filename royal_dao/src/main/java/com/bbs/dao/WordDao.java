package com.bbs.dao;

import com.bbs.domain.Word;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WordDao {

    @Select("select * from bbs_word_table")
    List<Word> findAll();

    @Update("update bbs_word_table set status = #{status} where wordId =#{wordId}")
    void changeStatus(@Param("wordId") Integer wordId,@Param("status") Integer status);
}
