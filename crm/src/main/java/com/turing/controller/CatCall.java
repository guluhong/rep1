package com.turing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.turing.entity.CstActivity;
import com.turing.entity.CstCustomer;
import com.turing.entity.CstLinkman;
import com.turing.entity.CstLost;
import com.turing.entity.Orders;
import com.turing.service.ICstCall;

@Controller
public class CatCall {

	@Autowired
	private ICstCall isCall;
	
	/**
	 * 查询全部
	 * @param model
	 * @return
	 */
	@RequestMapping("CstCall")
	public String CstCall(Model model,@RequestParam(required = false,defaultValue = "1")Integer pagenum) {
		
		PageHelper.startPage(pagenum, 2);
		
		List<CstCustomer> CstCustomerlist = isCall.WljlikeSelect(null);
		PageInfo<CstCustomer> pageInfo=new PageInfo<CstCustomer>(CstCustomerlist);
	
		model.addAttribute("CstCustomerlist", pageInfo);
		
		return "forward:/wljselectname";
	}
	
	
	/**
	 * 分页
	 * @param model
	 * @param pagenum
	 * @param pagesize
	 * @return
	 */
	@RequestMapping("CstCall2")
	public String CstCall2(Model model,@RequestParam(required = false,defaultValue = "1")Integer pagenum,String custName,String custNo,String custRegion,String custManagerName,String dictItem) {
		PageHelper.startPage(pagenum, 2);
		CstCustomer customer=new CstCustomer();
		customer.setCustName(custName);
		customer.setCustNo(custNo);
		customer.setCustRegion(custRegion);
		customer.setCustManagerName(custManagerName);
		customer.setCustAddr(dictItem);
		List<CstCustomer> CstCustomerlist2 = isCall.WljlikeSelect(customer);
		PageInfo<CstCustomer> pageInfo=new PageInfo<CstCustomer>(CstCustomerlist2);
		
		model.addAttribute("CstCustomerlist", pageInfo);
		return "forward:/wljselectname";
	}
	
	
	/**
	 * 查询所有等级和地区
	 * @param model
	 * @return
	 */
	@RequestMapping("wljselectname")
	public String wljselectname(Model model) {
		
		 List<CstCustomer> wljselectName = isCall.WljselectName();
     
		model.addAttribute("wljselectName", wljselectName);
		return "customer/CustomerPage";
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("WljDeleteByID")
	public String WljDeleteByID(String id) {
		
		int wljDeleteCstCustomer = isCall.WljDeleteCstCustomer(id);
		
		System.out.println(wljDeleteCstCustomer);
		
		return "forward:/CstCall?pagenum=1";
	}

	/**
	 * 编辑
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("WljSelectByID")
	public String WljSelectByID(Model model,String id) {
	
		CstCustomer wljSelectByid = isCall.WljSelectByid(id);

		model.addAttribute("wljSelectByid", wljSelectByid);
		
		return "customer/CustomerEdit";
	}
	
	/**
	 * 修改
	 * @param cstCustomer
	 * @return
	 */
	@RequestMapping("WljUpdateByid")
	public String WljUpdateByid(CstCustomer cstCustomer) {
		
		isCall.WljUpdateByid(cstCustomer);
		
		return "forward:/CstCall?pagenum=1";
	}
	
	/**
	 * 查询全部Linkman
	 * @param model
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("WljSelectLinkmans")
	public String WljSelectLinkmans(Model model,String id,String name) {
		
		String iid = id.substring(0, 8);
		model.addAttribute("custId", iid);
		model.addAttribute("custName", name);
		
		List<CstLinkman> wljSelectLinkman = isCall.WljSelectLinkman();
		
		model.addAttribute("wljSelectLinkman", wljSelectLinkman);
		
		return "customer/LinkManPage";
	}
	
	/**
	 * 根据id查询当个
	 * @param model
	 * @param iid
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("WljSelectLinkmanByid")
	public String WljSelectLinkmanByid(Model model,String iid,String id,String name){
		
		CstLinkman wljSelectLinkmanByid = isCall.WljSelectLinkmanByid(iid);
		model.addAttribute("wljSelectLinkmanByid", wljSelectLinkmanByid);
		model.addAttribute("custId", id);
		model.addAttribute("custName", name);
		return "customer/LinkManEdit";
	}
	
	/**
	 * 根据客户id修改
	 * @param cstLinkman
	 * @return
	 */
	@RequestMapping("WljUpdateLinkmanByid")
	public String WljUpdateLinkmanByid(CstLinkman cstLinkman) {
		
		int wljUpdateLinkmanByid = isCall.WljUpdateLinkmanByid(cstLinkman);
		System.out.println(wljUpdateLinkmanByid);
		
		return "forward:/WljSelectLinkmans";		
	}
	
	/**
	 * 根据联系人id删除
	 * @param id
	 * @return
	 */
	@RequestMapping("WljdateLinkmanByid")
	public String WljdateLinkmanByid(String iid,String id,String name){
		
		System.out.println(name);
		isCall.WljdeleteLinkmanById(iid);
		
		
		
		return "forward:/WljSelectLinkmans?id="+id;
		
	}
	
	/**
	 * 增加cstLinkman
	 * @param cstLinkman
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("WljLinkmanInsert")
	public String WljLinkmanInsert(CstLinkman cstLinkman) {

		System.out.println(cstLinkman.getLkmId());
		isCall.WljLinkmanInsert(cstLinkman);
		
		return "forward:/WljSelectLinkmans?id="+cstLinkman.getLkmCustNo()+"&name="+cstLinkman.getLkmCustName();
	}
	
	/**
	 * 跳转
	 * @param model
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("tzym")
	public String tzym(Model model,String id,String name) {
		
		model.addAttribute("lkmCustNo", id);
		model.addAttribute("custName", name);
		System.out.println(id);
		return "customer/LinkManAdd";
	}
	
	/**
	 * 查询全部活动表
	 * @param model
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("WljSelectCstActivityS")
	public String WljSelectCstActivityS(Model model,String id,String name) {
		
		String iid = id.substring(0, 8);
		List<CstActivity> wljSelectCstActivityS = isCall.WljSelectCstActivityS();
		model.addAttribute("custId", iid);
		model.addAttribute("custName", name);
		model.addAttribute("wljSelectCstActivityS", wljSelectCstActivityS);
		
		return "customer/ActivitysPage";
	}
	
	/**
	 * 根据活动id查询单个
	 * @param model
	 * @param id
	 * @param khid
	 * @param name
	 * @return
	 */
	@RequestMapping("WljSelectCstActivityByid")
	public String WljSelectCstActivityByid(Model model,String id,String khid,String name) {
		
		CstActivity wljSelectCstActivityByid = isCall.WljSelectCstActivityByid(id);
		model.addAttribute("wljSelectCstActivityByid", wljSelectCstActivityByid);
		model.addAttribute("khid", khid);
		model.addAttribute("khname", name);
		return "customer/ActivitysEdit";
	}
	
	/**
	 * 修改CstActivity
	 * @param cstActivity
	 * @return
	 */
	@RequestMapping("WljupdateCstActivityByidd")
	public String WljupdateCstActivityByid(CstActivity cstActivity,String id,String name) {
		
	    isCall.WljupdateCstActivityByid(cstActivity);
		
		return "forward:/WljSelectCstActivityS";
	}
	
	/**
	 * 根据活动id删除cstActivity
	 * @param id
	 * @return
	 */
	@RequestMapping("wljDeleteCstActivityByid")
	public String wljDeleteCstActivityByid(String id,String iid,String name) {

		isCall.wljDeleteCstActivityByid(id);
		
		return "forward:/WljSelectCstActivityS?id="+iid;
	}
	
	/**
	 * customer/ActivitysAdd.jsp的跳转
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("customerActivitysAdd")
	public String customerActivitysAdd(Model model,String id,String name) {
		
		model.addAttribute("khdeid",id);
		model.addAttribute("khmz",name);
		
		return "customer/ActivitysAdd";
	}
	
	/**
	 * 增加cstActivity
	 * @return
	 */
	@RequestMapping("wljinsertCstActivit")
	public String wljinsertCstActivit(CstActivity cstActivity,String custId,String custName) {
		System.out.println(custId);
		isCall.wljinsertCstActivit(cstActivity);
		
		return "forward:/WljSelectCstActivityS?id="+custId+"&name="+custName;
	}
	
	/**
	 * 查询全部订单表
	 * @param model
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("wljSelectOrders")
	public String wljSelectOrders(Model model,@RequestParam(required = false,defaultValue = "1")Integer pageNum,String id,String name) {
		
		PageHelper.startPage(pageNum, 2);
		
		List<Orders> wljSelectOrders = isCall.wljSelectOrders();
		PageInfo<Orders> pageInfo=new PageInfo<Orders>(wljSelectOrders);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("khid", id);
		model.addAttribute("khmz", name);
		
		return "customer/OrderPage";
	}
	
	/**
	 * 分页
	 * @param model
	 * @param pageNum
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("wljSelectOrders2")
	public String wljSelectOrders2(Model model,@RequestParam(required = false,defaultValue = "1")Integer pageNum,String id,String name) {
		
		PageHelper.startPage(pageNum, 2);
		
		List<Orders> wljSelectOrders = isCall.wljSelectOrders();
		PageInfo<Orders> pageInfo=new PageInfo<Orders>(wljSelectOrders);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("khid", id);
		model.addAttribute("khmz", name);
		
		return "customer/OrderPage";
	}
	
	/**
	 * 跳转ActivitysAdd2.jsp
	 * @param model
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("tzActivitysAdd2")
	public String tzActivitysAdd2(Model model,String id,String name) {
		
		model.addAttribute("khdid", id);
		model.addAttribute("khdmz", name);
		return "customer/ActivitysAdd2";
	}
	
	/**
	 * 增加
	 * @param orders
	 * @return
	 */
	@RequestMapping("wljinsertOrders")
	public String wljinsertOrders(Orders orders,String custId,String custName) {
		System.out.println(custId);
		isCall.wljinsertOrders(orders);
		return "forward:/wljSelectOrders?id="+custId+"&name="+custName;
	}
	
	/**
	 * 根据活动id查询
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("WljSelectsss")
	public String WljSelectsss(Model model,String id) {
		
		Orders wljSelectsss = isCall.WljSelectsss(id);
		model.addAttribute("wljSelectsss", wljSelectsss);
		return "customer/OrderDetail";
	}
	
	/**
	 * 查询分页客户表和客户流失表
	 * @param model
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("wljSelectKhKhls")
	public String wljSelectKhKhls(Model model,@RequestParam(required =false,defaultValue = "1")Integer pageNum,CstLost cstLost,HttpServletRequest request) {
		
		PageHelper.startPage(pageNum, 2);
		
		 List<CstLost> wljSelectKhKhls = isCall.wljSelectKhKhls(cstLost);
		
		PageInfo<CstLost> pageInfo=new PageInfo<CstLost>(wljSelectKhKhls);

		model.addAttribute("pageInfo", pageInfo);
		Object attribute = request.getSession().getAttribute("a");
		request.getSession().setAttribute("a", attribute);
		System.out.println(attribute);
		return "customer/LostsPage";
	}
	
	/**
	 * 分页
	 * @param model
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("wljSelectKhKhls2")
	public String wljSelectKhKhls2(Model model,@RequestParam(required =false,defaultValue = "1")Integer pageNum,String lstCustName,String lstCustManagerName,String lstStatus) {
		
		PageHelper.startPage(pageNum, 2);
		System.out.println(lstCustName);
		CstLost cstLost=new CstLost();
		cstLost.setLstCustName(lstCustName);
		cstLost.setLstCustManagerName(lstCustManagerName);
		cstLost.setLstStatus(lstStatus);
		
		 List<CstLost> wljSelectKhKhls = isCall.wljSelectKhKhls(cstLost);
			
	    PageInfo<CstLost> pageInfo=new PageInfo<CstLost>(wljSelectKhKhls);

		model.addAttribute("pageInfo", pageInfo);

		return "customer/LostsPage";
		
	}
	
	/**
	 * 查询单个cstlost返回customer/LostPause.jsp
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("wljselectCstCustomerByid")
	public String wljselectCstCustomerByid(Model model,String id) {
		
		CstLost wljselectCstCustomerByid = isCall.wljselectCstCustomerByid(id);
		model.addAttribute("wljselectCstCustomerByid", wljselectCstCustomerByid);
		
		return "customer/LostPause";
	}
	
	/**
	 * 查询单个cstlost返回customer/LostEnter.jsp
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("wljselectCstCustomerByid2")
	public String wljselectCstCustomerByid2(Model model,String id) {
		
		CstLost wljselectCstCustomerByid2 = isCall.wljselectCstCustomerByid(id);
		model.addAttribute("wljselectCstCustomerByid2", wljselectCstCustomerByid2);
		
		return "customer/LostEnter";
	}
	
	/**
	 * 修改LostPause.jsp返回主页
	 * @param cstLost
	 * @return
	 */
	@RequestMapping("WljUpdateCstomerByid")
	public String WljUpdateCstomerByid(String id,CstLost cstLost) {
		
		CstLost cstLost2=new CstLost();
		cstLost2.setLstDelay(cstLost.getLstDelay());
		cstLost2.setLstId(Integer.parseInt(id));
		isCall.WljUpdateCstomerByid(cstLost2);
		
		return "forward:/wljSelectKhKhls";
	}
	
	/**
	 * 修改LostEnter.jsp返回主页
	 * @param cstLost
	 * @return
	 */
	@RequestMapping("WljUpdateCstomerByid2")
	public String WljUpdateCstomerByid2(HttpServletRequest request,String id,CstLost cstLost) {
		
		CstLost cstLost2=new CstLost();
		cstLost2.setLstDelay(cstLost.getLstDelay());
		cstLost2.setLstId(Integer.parseInt(id));
		isCall.WljUpdateCstomerByid(cstLost2);
		request.getSession().setAttribute("a", id);
		return "forward:/wljSelectKhKhls";
	}
}
