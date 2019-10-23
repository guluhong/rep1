package com.turing.mapper;

import com.turing.entity.CstCustomer;
import com.turing.entity.CstCustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CstCustomerMapper {
    long countByExample(CstCustomerExample example);

    int deleteByExample(CstCustomerExample example);

    int deleteByPrimaryKey(String custNo);

    int insert(CstCustomer record);

    int insertSelective(CstCustomer record);

    List<CstCustomer> selectByExample(CstCustomerExample example);
    
    //查询名字和等级
    List<CstCustomer> wljselectname();
    
    //模糊查询
    List<CstCustomer> wljSelectLikeCstCustomers(CstCustomer cstCustomer);

    CstCustomer selectByPrimaryKey(String custNo);

    int updateByExampleSelective(@Param("record") CstCustomer record, @Param("example") CstCustomerExample example);

    int updateByExample(@Param("record") CstCustomer record, @Param("example") CstCustomerExample example);

    int updateByPrimaryKeySelective(CstCustomer record);

    int updateByPrimaryKey(CstCustomer record);
}