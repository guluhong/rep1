package com.turing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.entity.CstActivity;
import com.turing.entity.CstActivityExample;
import com.turing.entity.CstCustomer;
import com.turing.entity.CstCustomerExample;
import com.turing.entity.CstLinkman;
import com.turing.entity.CstLinkmanExample;
import com.turing.entity.CstLost;
import com.turing.entity.CstLostExample;
import com.turing.entity.CstLostExample.Criteria;
import com.turing.entity.CstServiceExample;
import com.turing.entity.Orders;
import com.turing.entity.SalChanceExample;
import com.turing.mapper.CstActivityMapper;
import com.turing.mapper.CstCustomerMapper;
import com.turing.mapper.CstLinkmanMapper;
import com.turing.mapper.CstLostMapper;
import com.turing.mapper.CstServiceMapper;
import com.turing.mapper.OrdersLineMapper;
import com.turing.mapper.OrdersMapper;
import com.turing.service.ICstCall;

@Service
public class cstCallImpl implements ICstCall{
    
	@Autowired
	private CstCustomerMapper CstCustomer;
	
	@Autowired
	private CstActivityMapper mapper2;
	
	@Autowired
	private CstLinkmanMapper  mapper3;
	
	@Autowired
	private CstLostMapper     mapper4;
	
	@Autowired
	private CstServiceMapper  mapper5;
	
	@Autowired
	private OrdersMapper mapper6;
	
	@Autowired
	private CstLostMapper cstLostMapper;
	
	public List<CstCustomer> findCstAll() {
		// TODO Auto-generated method stub
		return CstCustomer.selectByExample(null);
	}
	
	//娣诲姞涓�鍚嶅鎴� gh

	public int addCustOmer(com.turing.entity.CstCustomer cstCustomer) {
		// TODO Auto-generated method stub
		return CstCustomer.insertSelective(cstCustomer);
	}

	
	public List<CstCustomer> WljselectName() {
		// TODO Auto-generated method stub
		return CstCustomer.wljselectname();
	}

	/**
	 * 分页，模糊查询
	 */
	public List<com.turing.entity.CstCustomer> WljlikeSelect(CstCustomer cstCustomer) {
		
		
		return CstCustomer.wljSelectLikeCstCustomers(cstCustomer);
	}

	/**
	 * 删除
	 */
	public int WljDeleteCstCustomer(String id) {
		/*
		 * //删子表
		 * 
		 * CstActivityExample example2=new CstActivityExample();
		 * example2.createCriteria().andAtvCustNoEqualTo(id);
		 * mapper2.deleteByExample(example2);
		 * 
		 * CstLinkmanExample example3=new CstLinkmanExample();
		 * example3.createCriteria().andLkmCustNoEqualTo(id);
		 * mapper3.deleteByExample(example3);
		 * 
		 * CstLostExample example4=new CstLostExample();
		 * example4.createCriteria().andLstCustNoEqualTo(id);
		 * mapper4.deleteByExample(example4);
		 * 
		 * 
		 * CstServiceExample example5=new CstServiceExample();
		 * example5.createCriteria().andSvrCustNoEqualTo(id);
		 * mapper5.deleteByExample(example5);
		 */
			//删主表
			CstCustomerExample example=new CstCustomerExample();
			example.createCriteria().andCustNoEqualTo(id);
			
			return CstCustomer.deleteByExample(example);

	}

	/**
	 * 根据id查询CstCustomer
	 */
	public CstCustomer WljSelectByid(String id) {
		
		return CstCustomer.selectByPrimaryKey(id);
	}

	
	/**
	 * 根据id修改CstCustomer
	 */
	public int WljUpdateByid(com.turing.entity.CstCustomer cstCustomer) {
		// TODO Auto-generated method stub
		return CstCustomer.updateByPrimaryKeySelective(cstCustomer);
	}

	/**
	 * 查询全部CstLinkman
	 */
	public List<CstLinkman> WljSelectLinkman() {
		// TODO Auto-generated method stub
		return mapper3.selectByExample(null);
	}

	/**
	 * 根据id查询单个CstLinkman
	 */
	public CstLinkman WljSelectLinkmanByid(String id) {
		
		CstLinkmanExample cstLinkmanExample=new CstLinkmanExample();
		cstLinkmanExample.createCriteria().andLkmCustNoEqualTo(id);
		
		return mapper3.selectByExample(cstLinkmanExample).get(0);
	}

	/**
	 * 根据id修改CstLinkman
	 */
	public int WljUpdateLinkmanByid(CstLinkman cstLinkman) {
		
		CstLinkmanExample example=new CstLinkmanExample();
		example.createCriteria().andLkmCustNoEqualTo(cstLinkman.getLkmCustNo());
		return mapper3.updateByExampleSelective(cstLinkman, example);
	}

	/**
	 * 根据id删除CstLinkman
	 */
	public int WljdeleteLinkmanById(String id) {
		
		CstLinkmanExample example=new CstLinkmanExample();
		example.createCriteria().andLkmIdEqualTo(Integer.parseInt(id));
		
		return mapper3.deleteByExample(example);
	}

	/**
	 * 增加CstLinkman
	 */
	public int WljLinkmanInsert(CstLinkman cstLinkman) {
		
		
		return mapper3.insertSelective(cstLinkman);
	}

	/**
	 * 查询CstActivity
	 */
	public List<CstActivity> WljSelectCstActivityS() {
		
		// TODO Auto-generated method stub
		return mapper2.selectByExample(null);
	}

	/**
	 * 查询单个
	 */
	public CstActivity WljSelectCstActivityByid(String id) {
		// TODO Auto-generated method stub
		CstActivityExample cstActivityExample=new CstActivityExample();
		cstActivityExample.createCriteria().andAtvIdEqualTo(Integer.parseInt(id));
		
		return mapper2.selectByExample(cstActivityExample).get(0);
	}

	/**
	 * 根据活动id修改
	 */
	public int WljupdateCstActivityByid(CstActivity cstActivity) {
		
		return mapper2.updateByPrimaryKeySelective(cstActivity);
	}

	/**
	 * 根据活动id删除
	 */
	public int wljDeleteCstActivityByid(String id) {
		// TODO Auto-generated method stub
		return mapper2.deleteByPrimaryKey(Integer.parseInt(id));
	}

	/**
	 * 增加
	 */
	public int wljinsertCstActivit(CstActivity cstActivity) {
		// TODO Auto-generated method stub
		return mapper2.insertSelective(cstActivity);
	}

	/**
	 * 查询全部Orders
	 */
	public List<Orders> wljSelectOrders() {
		// TODO Auto-generated method stub
		
		return mapper6.selectByExample(null);
	}

	/**
	 * 增加
	 */
	public int wljinsertOrders(Orders orders) {
		// TODO Auto-generated method stub
		return mapper6.insertSelective(orders);
	}

	/**
	 * 根据id查询
	 */
	public Orders WljSelectsss(String id) {
		// TODO Auto-generated method stub
		return mapper6.WljSelectsss(id);
	}

	/**
	 * 查询
	 */
	public List<CstLost> wljSelectKhKhls(CstLost cstLost) {
		// TODO Auto-generated method stub
		CstLostExample cstLostExample=new CstLostExample();
		Criteria criteria = cstLostExample.createCriteria();
		if(cstLost!=null) {
			if(cstLost.getLstCustName()!=null && cstLost.getLstCustName()!="") {
				
				criteria.andLstCustNameLike("%"+cstLost.getLstCustName()+"%");
			}
			if(cstLost.getLstCustManagerName()!=null && cstLost.getLstCustManagerName()!="") {
				criteria.andLstCustManagerNameLike("%"+cstLost.getLstCustManagerName()+"%");
			}
			if(cstLost.getLstStatus()=="全部") {
				criteria.andLstStatusLike("%"+cstLost.getLstStatus()+"%");
			}
			
		}
		
		return cstLostMapper.selectByExample(cstLostExample);
	}

	
	/**
	 * 查询单个
	 */
	public CstLost wljselectCstCustomerByid(String id) {
		// TODO Auto-generated method stub
		CstLostExample cstLostExample=new CstLostExample();
		cstLostExample.createCriteria().andLstCustNoEqualTo(id);
		return cstLostMapper.selectByExample(cstLostExample).get(0);
	}


	/**
	 * 修改客户流失表
	 */
	public int WljUpdateCstomerByid(CstLost CstLost) {
		// TODO Auto-generated method stub
		return cstLostMapper.updateByPrimaryKeySelective(CstLost);
	}

	

	
}
