package com.turing.service;
/**
 * 销售机会接口
 * @author 谷红
 *
 */

import java.util.List;

import org.springframework.stereotype.Service;

import com.turing.entity.SalChance;


public interface iSalChance {

	//查询所有销售机会为1：未指派
	public List<SalChance> findSalChanceAllLike(SalChance sc,Integer chcStatus);
	
	//按id查询
	SalChance findById(Integer chcid);
	
	//添加销售机会
	int addSc(SalChance salchance);
	
	//删除销售机会
	int updatedelete(Integer chcid,Integer ccid);
	
	//修改-->添加销售的指派人
	int update(SalChance chance);
	
	
	
}
