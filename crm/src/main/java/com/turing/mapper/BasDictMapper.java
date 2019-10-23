package com.turing.mapper;

import com.turing.entity.BasDict;
import com.turing.entity.BasDictExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BasDictMapper {
    long countByExample(BasDictExample example);

    int deleteByExample(BasDictExample example);

    int deleteByPrimaryKey(Integer dictId);

    int insert(BasDict record);

    int insertSelective(BasDict record);

    List<BasDict> selectByExample(BasDictExample example);

    BasDict selectByPrimaryKey(Integer dictId);

    int updateByExampleSelective(@Param("record") BasDict record, @Param("example") BasDictExample example);

    int updateByExample(@Param("record") BasDict record, @Param("example") BasDictExample example);

    int updateByPrimaryKeySelective(BasDict record);

    int updateByPrimaryKey(BasDict record);
}