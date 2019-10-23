package com.turing.controller;
/**
 * 销售机会控制层
 * @author 谷红
 *
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.turing.entity.CstCustomer;
import com.turing.entity.SalChance;
import com.turing.entity.SysUser;
import com.turing.service.ICstCall;
import com.turing.service.iSalChance;

@Controller
public class salController {

	//注入销售接口和客户接口
	@Autowired
	private iSalChance isalchance;
	@Autowired
	private ICstCall icatcall;
	
	// 查询所有的销售集合
	@RequestMapping("/salchancelist")
	public String findScAll(Model model,HttpServletRequest request) {
		request.getSession().removeAttribute("salchance");
		PageHelper.startPage(1, 3); // 分页
		//设置状态
		SalChance chance=new SalChance();
		chance.setChcStatus(1);
		// 销售对象集合
		List<SalChance> sclist = isalchance.findSalChanceAllLike(null,1);
		// 分页对象集合
		PageInfo<SalChance> pageinfo = new PageInfo<SalChance>(sclist); 
		model.addAttribute("sclistpage", pageinfo);// 销售机会集合
			return "Sale/SaleChance";
	}

	//销售机会翻页
	@RequestMapping("findAllLikeAndPage")
	public String findAllLikeAndPage(SalChance salchance,HttpServletRequest request,Integer pageNum) {
		PageHelper.startPage(pageNum, 3);
		//销售对象存入会话
		request.getSession().setAttribute("salchance", salchance);
		List<SalChance> sclist = isalchance.findSalChanceAllLike(salchance,null);
		PageInfo<SalChance> pageInfo = new PageInfo<SalChance>(sclist);
		request.getSession().setAttribute("sclistpage", pageInfo);
		return "Sale/SaleChance";
	}
	
	//根据id查询单个销售
	@RequestMapping("/scupdateselect")
	public String updatescselect(Integer chcid,Model model) {
		SalChance salchance = isalchance.findById(chcid);
		Date createDate = salchance.getChcCreateDate();
		//当前系统时间
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-年MM月-dd日");
		String createdata = dateFormat.format(createDate);
		model.addAttribute("createdata", createdata);
		model.addAttribute("salchance", salchance);
		return "Sale/EditSale";
	}
	


	// 添加销售机会
	@RequestMapping("/updateinsertsalchance")
	public void addSc(HttpServletRequest request,HttpServletResponse response,String nextPlan,SalChance salchance) throws UnsupportedEncodingException {
		//设置编码
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		//获取当前登录对象
		SysUser sysuser = (SysUser)request.getSession().getAttribute("sysUserl");
		salchance.setChcStatus(1);  //默认为未分配
		salchance.setChcCreateBy(sysuser.getUserName()); //创建人
		salchance.setChcCreateId(sysuser.getUserId());   //创建人id
		int i = isalchance.addSc(salchance);
		if(i>0) {
			try {
				PrintWriter out = response.getWriter();
				//判断确定类型来跳转指点页面
				if(nextPlan.equals("确定并返回")) {
					out.print("<script>alert('保存成功');location.href='/salchancelist';</script>");
				}else {
					out.print("<script>alert('保存成功');history.go(-1);</script>");
				}
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 删除销售
		@RequestMapping("/scdelete")
		public String deletesc(Integer chcid,Integer ccid,HttpServletResponse response,HttpServletRequest request){
			//获取当前登录用户对象 根据id判断是否为创建人
			SysUser sysuser = (SysUser)request.getSession().getAttribute("sysUserl");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			int userid = sysuser.getUserId(); //当前登录用户id
			if(ccid!=userid) { 
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.print("<script>alert('你不是该销售机会的创建人不可以删除!');location.href='/salchancelist';</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					out.flush();
					out.close();
				}
			}else {
				isalchance.updatedelete(chcid,ccid);
			}
			return "forward:salchancelist";
		}

	// 分配销售先查询再
	@RequestMapping("/scallot")
	public String allot(Integer chcid,Model model,String button) {
		//根据id查询单个销售
		SalChance salchance = isalchance.findById(chcid);
		model.addAttribute("salchance", salchance);
		//查询所有(为下拉框)
		List<CstCustomer> custlist = icatcall.findCstAll();
		model.addAttribute("cstlist", custlist);
		return "Sale/AllotSale";
	}
	//修改分配人和状态
	@RequestMapping("/updatechccustname")
	public String updateCustName(Integer chcid,String custname,Integer dueid) {
		Date date = new Date();
		SalChance chance = new SalChance();
		chance.setChcDueId(dueid);
		chance.setChcId(chcid);
		chance.setChcDueTo(custname);
		chance.setChcDueDate(date);
		chance.setChcStatus(2); //状态-->开发中
		isalchance.update(chance);	
		return "forward:salchancelist";
	}
	//修改
	@RequestMapping("/scupdate")
	public String scupdate(SalChance chance) {
		isalchance.update(chance);
		return "forward:salchancelist";
	}
	
	//退出登录
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("sysUserl");
		return "login";
	}

	
}
