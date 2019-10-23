package com.turing.service;
/**
 * 销售计划表接口
 * @author 谷红
 *
 */

import java.util.List;

import com.turing.entity.SalPlan;

public interface iSalPlan {

	//按id查询
	List<SalPlan> findSpByScId(Integer chcId);
	
	//添加计划项
	int updateInsert(SalPlan plan);
	
	//添加执行结果(其实就是修改状态)
	int updateSpResule(SalPlan plan);
	
	//编辑开发计划
	int salPlanUpdate(SalPlan plan);
	
	//删除开发计划
	int deleteSp(Integer planid);
	
	
}
