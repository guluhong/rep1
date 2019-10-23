package com.turing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.entity.SalChance;
import com.turing.entity.SalChanceExample;
import com.turing.entity.SalChanceExample.Criteria;
import com.turing.mapper.SalChanceMapper;
import com.turing.service.iSalChance;

/**
 * 售机会实现类
 * 
 * @author 谷红
 *
 */
@Service
public class salChanceImpl implements iSalChance {

	//注入mapper层
	@Autowired
	private SalChanceMapper salchancemapper;

	//查询和模糊查询结合
	public List<SalChance> findSalChanceAllLike(SalChance chance,Integer chcStatus) {
		SalChanceExample example = new SalChanceExample();
		Criteria criteria = example.createCriteria();
		//模糊查询 先判断
		if (chance != null) {
			if (chance.getChcCustName() != null && chance.getChcCustName() != "") {
				criteria.andChcCustNameLike("%" + chance.getChcCustName() + "%");
			}
			if (chance.getChcLinkman() != null && chance.getChcLinkman() != "") {
				criteria.andChcLinkmanLike("%" + chance.getChcLinkman() + "%");
			}
			if (chance.getChcTitle() != null && chance.getChcTitle() != "") {
				criteria.andChcTitleLike("%" + chance.getChcTitle() + "%");
			}
			//如果对象为空 状态为 未指配
			if(chance.getChcStatus()==null) {
				criteria.andChcStatusEqualTo(1);
			//当前销售对象状态为0--> 不为1	
			}else if(chance.getChcStatus()==0) {
				criteria.andChcStatusNotEqualTo(1);
			}else {
				criteria.andChcStatusEqualTo(chance.getChcStatus());
			}
			//1=1 || 1!=1
		}else {
			if(chcStatus==1) {
				criteria.andChcStatusEqualTo(1);
			}else {
				criteria.andChcStatusNotEqualTo(1);
			}
		}
		return salchancemapper.selectByExample(example);
	}

	
	public int addSc(SalChance salchance) {
		// TODO Auto-generated method stub
		return salchancemapper.insertSelective(salchance);
	}

	
	public SalChance findById(Integer chcid) {
		// TODO Auto-generated method stub
		return salchancemapper.selectByPrimaryKey(chcid);
	}

	
	//删除 -->按销售id删除，判断是否为当前登录用户
	public int updatedelete(Integer chcid, Integer ccid) {
		// TODO Auto-generated method stub
		SalChanceExample example = new SalChanceExample();
		example.createCriteria().andChcIdEqualTo(chcid).andChcCreateIdEqualTo(ccid);
		return salchancemapper.deleteByExample(example);
	}

	
	public int update(SalChance chance) {
		// TODO Auto-generated method stub
		return salchancemapper.updateByPrimaryKeySelective(chance);
	}

}
