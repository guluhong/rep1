package com.turing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.entity.SalPlan;
import com.turing.entity.SalPlanExample;
import com.turing.mapper.SalPlanMapper;
import com.turing.service.iSalPlan;
/**
 * 销售计划实现类
 * @author 谷红
 *
 */
@Service
public class salPlanImpl implements iSalPlan {

	//注入销售计划mapper
	@Autowired
	private SalPlanMapper spMapper;

	//按id查询单个销售计划
	public List<SalPlan> findSpByScId(Integer chcId) {
		SalPlanExample example = new SalPlanExample();
		example.createCriteria().andPlaChcIdEqualTo(chcId);
		return spMapper.selectByExample(example);
	}
	
	public int updateInsert(SalPlan plan) {
		// TODO Auto-generated method stub
		return spMapper.insert(plan);
	}
	
	//修改开发状态
	public int updateSpResule(SalPlan plan) {
		// TODO Auto-generated method stub
		SalPlanExample example = new SalPlanExample();
		example.createCriteria().andPlaChcIdEqualTo(plan.getPlaId()).andPlaResuleEqualTo(plan.getPlaResule());
		return spMapper.updateByPrimaryKeySelective(plan);
	}
	
	public int salPlanUpdate(SalPlan plan) {
		// TODO Auto-generated method stub
		return spMapper.updateByPrimaryKeySelective(plan);
	}
	
	public int deleteSp(Integer planid) {
		// TODO Auto-generated method stub
		return spMapper.deleteByPrimaryKey(planid);
	}

}
