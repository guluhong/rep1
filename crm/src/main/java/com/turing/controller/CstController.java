package com.turing.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.turing.entity.CstCustomer;
import com.turing.entity.CstService;
import com.turing.entity.SysUser;
import com.turing.service.IcstService;

/**
 * 客户服务控制器
 *
 */
@Controller
public class CstController {
	
	//注入service层
	@Autowired
	private IcstService service;
	
	
	/**
	 * 服务创建
	 * @param svrCustName
	 * @param svrType
	 * @param svrTitle
	 * @param svrRequest
	 * @return
	 * @throws IOException 
	 */
	//新建服务
	@RequestMapping("/insertService")
	public String add(HttpServletRequest request){
		//获取参数
		String svrCustName = request.getParameter("svrCustName");
		String svrType = request.getParameter("svrType");
		String svrTitle = request.getParameter("svrTitle");
		String svrRequest = request.getParameter("svrRequest");
		SysUser user=(SysUser)request.getSession().getAttribute("sysUserl");
		//查询用户
		List<CstCustomer> cusList = service.selectCus(svrCustName);
		if(cusList.size()==0) {
			return "customerService/ServiceCreate";
		}else {		
			//新建一个服务对象
			CstService ser=new CstService();
			//给CstService对象设置属性
			ser.setSvrType(svrType);
			ser.setSvrTitle(svrTitle);
			ser.setSvrCustName(svrCustName);
			ser.setSvrRequest(svrRequest);
			ser.setSvrStatus("新创建");
			ser.setSvrCustNo(cusList.get(0).getCustNo());
			ser.setSvrCreateId(user.getUserId());
			ser.setSvrCreateBy(user.getUserName());
			ser.setSvrCreateDate(new Date());
			int result = service.insertService(ser);
			if(result>0) {
				return "customerService/ServiceAllot";
			}
		}
		return "customerService/ServiceCreate";
	}
	
	
	/**
	 * 服务分配
	 * @param pageNum
	 * @param svrCustName
	 * @param svrTitle
	 * @param svrType
	 * @param svrStatus
	 * @param bDate
	 * @param lDate
	 * @return
	 */
	@RequestMapping("/allotPage")
	@ResponseBody
	public ModelAndView allotPageChange(int pageNum,String svrCustName,String svrTitle,String svrType,
			String svrStatus,String bDate,String lDate) {
		//创建PageHelper对象
		PageHelper.startPage(pageNum, 3);
		//获取所有记录
		List<CstService> list = service.dimList(svrCustName, svrTitle, svrType, svrStatus,bDate,lDate);
		//创建PageInfo对象
		PageInfo<CstService> pageInfo=new PageInfo<CstService>(list);
		//查询所有的用户
		List<SysUser> users = service.userList();
		ModelAndView model=new ModelAndView("customerService/ServiceAllotFoot");
		//封装数据
		model.addObject("list", pageInfo);
		model.addObject("users",users);
		return model;
	}
	
	//修改服务分配和时间
	@RequestMapping("/upService")
	public String upService(Model model,String name,int id,String status) {
		//调用方法获取用户
		List<SysUser> userList = service.selectUserByName(name);
		//创建一个CstService对象
		CstService ser=new CstService();
		//设置属性
		ser.setSvrId(id);
		ser.setSvrDueTo(name);
		ser.setSvrDueId(userList.get(0).getUserId());
		ser.setSvrDueDate(new Date());
		if(status.equals("新创建")) {
			ser.setSvrStatus("已分配");
		}
		//调用方法
		service.updateService(ser);
		return "customerService/ServiceAllot";
	}
	
	//删除服务
	@RequestMapping("/reduceService")
	public String deService(Model model,int id) {
		int result = service.deleteService(id);
		model.addAttribute("deResult", result);
		return "customerService/ServiceAllot";
	}
	
	
	/**
	 * 服务处理
	 * @param pageNum
	 * @param svrCustName
	 * @param svrTitle
	 * @param svrType
	 * @param svrStatus
	 * @param bDate
	 * @param lDate
	 * @return
	 */
	//查询所有
	@RequestMapping("/disposeServiceList")
	public ModelAndView dispose(int pageNum,String svrCustName,String svrTitle,String svrType,
			String svrStatus,String bDate,String lDate) {
		//创建PageHelper对象
		PageHelper.startPage(pageNum, 3);
		//获取所有记录
		List<CstService> list = service.dimList(svrCustName, svrTitle, svrType, svrStatus, bDate, lDate);
		//创建PageInfo对象
		PageInfo<CstService> pageInfo=new PageInfo<CstService>(list);
		ModelAndView model=new ModelAndView("customerService/ServiceDisposeFoot");
		model.addObject("dislist", pageInfo);
		return model;
	}
	
	//根据id查询
	@RequestMapping("/disposeCstservice")
	public String disShowById(Model model,int id) {
		//调用方法
		CstService cstService = service.selectById(id);
		model.addAttribute("cstSer", cstService);
		return "customerService/ServiceDisposeDialog";
	}
	
	//修改服务处理
	@RequestMapping("/disUpdateDeal")
	public String updateDeal(Model model,int id,String deal,HttpServletRequest request) {
		//获取当前登录对象
		SysUser user = (SysUser)request.getSession().getAttribute("sysUserl");
		String name=user.getUserName();
		//调用方法-根据名字查询用户id
		List<SysUser> users = service.selectUserByName(name);
		//实例化一个对象
		CstService cst=new CstService();
		//给对象设置属性
		cst.setSvrId(id);
		cst.setSvrDeal(deal);
		cst.setSvrDealBy(name);
		cst.setSvrDealId(users.get(0).getUserId());
		cst.setSvrStatus("已处理");
		cst.setSvrDealDate(new Date());
		//调用方法
		service.updateService(cst);
		return "customerService/ServiceDispose";
	}
	
	/**
	 * 服务反馈
	 * @param pageNum
	 * @param svrCustName
	 * @param svrTitle
	 * @param svrType
	 * @param svrStatus
	 * @param bDate
	 * @param lDate
	 * @return
	 */
	@RequestMapping("/resultServiceList")
	public ModelAndView result(int pageNum,String svrCustName,String svrTitle,String svrType,
			String svrStatus,String bDate,String lDate) {
		//创建PageHelper对象
		PageHelper.startPage(pageNum, 3);
		//获取所有记录
		List<CstService> list = service.dimList(svrCustName, svrTitle, svrType, svrStatus, bDate, lDate);
		//创建PageInfo对象
		PageInfo<CstService> pageInfo=new PageInfo<CstService>(list);
		ModelAndView model=new ModelAndView("customerService/ServiceResultFoot");
		model.addObject("resultlist", pageInfo);
		return model;
	}
	
	//根据id查询
	@RequestMapping("/resultCstservice")
	public String resultShowById(Model model,int id) {
		//调用方法
		CstService cstService = service.selectById(id);
		model.addAttribute("cstSer", cstService);
		return "customerService/ServiceResultDialog";
	}
	
	//修改服务处理结果
	@RequestMapping("/resultUpdate")
	public String updateResult(Model model,int id,int svrSatisfy,String svrResult) {
		//创建对象
		CstService cst=new CstService();
		//设置属性
		cst.setSvrId(id);
		cst.setSvrSatisfy(svrSatisfy);
		cst.setSvrResule(svrResult);
		cst.setSvrStatus("已归档");
		//调用方法
		service.updateService(cst);
		return "customerService/ServiceResult";
	}
	
	
	/**
	 * 服务归档
	 * @param pageNum
	 * @param svrCustName
	 * @param svrTitle
	 * @param svrType
	 * @param svrStatus
	 * @param bDate
	 * @param lDate
	 * @return
	 */
	//查询所有
	@RequestMapping("/detailServiceList")
	public ModelAndView detail(int pageNum,String svrCustName,String svrTitle,String svrType,
			String svrStatus,String bDate,String lDate) {
		//创建PageHelper对象
		PageHelper.startPage(pageNum, 3);
		//获取所有记录
		List<CstService> list = service.dimList(svrCustName, svrTitle, svrType, svrStatus, bDate, lDate);
		//创建PageInfo对象
		PageInfo<CstService> pageInfo=new PageInfo<CstService>(list);
		ModelAndView model=new ModelAndView("customerService/ServiceDetailFoot");
		model.addObject("detaillist", pageInfo);
		return model;
	}
	
	//根据id查询
	@RequestMapping("/detailCstService")
	public String detailById(Model model,int id) {
		//调用方法
		CstService cstDetail = service.selectById(id);
		//存储数据
		model.addAttribute("cstDetail",cstDetail);
		return "customerService/ServiceDetailDialog";
	}
	
}
