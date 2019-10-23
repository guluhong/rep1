package com.turing.service;

import java.util.List;

import com.turing.entity.CstActivity;
import com.turing.entity.CstCustomer;
import com.turing.entity.CstLinkman;
import com.turing.entity.CstLost;
import com.turing.entity.Orders;

public interface ICstCall {
	//阿谷
	//查询所有用户信息 温酒勿动 谢谢 
	List<CstCustomer> findCstAll();
	//添加一名客户
	int addCustOmer(CstCustomer cstCustomer); 
	
	//查询全部
	List<CstCustomer> WljselectName();
	
	//模糊查询
	List<CstCustomer> WljlikeSelect(CstCustomer cstCustomer);
	
	//删除
	int WljDeleteCstCustomer(String id);
	
	//编辑
	CstCustomer WljSelectByid(String id);
	
	//修改
	int WljUpdateByid(CstCustomer cstCustomer);
	
	//查询所有linkman
	List<CstLinkman> WljSelectLinkman();
	
	//根据id查询linkman
	CstLinkman WljSelectLinkmanByid(String id);
	
	//根据id删除
	int WljdeleteLinkmanById(String id);
	
	//根据id修改linkman
	int WljUpdateLinkmanByid(CstLinkman cstLinkman);
	
	//增加linkman
	int WljLinkmanInsert(CstLinkman cstLinkman);
	
	//查询全部CstActivity
	List<CstActivity> WljSelectCstActivityS();
	
	//根据活动表id查询单个
	CstActivity WljSelectCstActivityByid(String id);
	
	//根据活动id修改
	int WljupdateCstActivityByid(CstActivity cstActivity);
	
	//根据活动id删除
	int wljDeleteCstActivityByid(String id);
	
	//增加CstActivity
	int wljinsertCstActivit(CstActivity cstActivity);
	
	//查询全部订单表
	List<Orders> wljSelectOrders();
	
	//增加订单
	int wljinsertOrders(Orders orders);
	
	//查询全部orders,orders_line,product
	Orders WljSelectsss(String id);
	
	//查询客户表和客户流失表
	List<CstLost> wljSelectKhKhls(CstLost cstLost);
	
	
	//根据客户id查询单个
	CstLost wljselectCstCustomerByid(String id);
	
	//根据客户id修改
	int WljUpdateCstomerByid(CstLost CstLost);
}
