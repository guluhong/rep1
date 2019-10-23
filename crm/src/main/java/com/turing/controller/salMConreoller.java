package com.turing.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Attr;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.turing.entity.CstCustomer;
import com.turing.entity.SalChance;
import com.turing.entity.SalPlan;
import com.turing.service.ICstCall;
import com.turing.service.iSalChance;
import com.turing.service.iSalPlan;

/**
 * 客户开发计划控制器
 * @author 谷红
 *
 */
@Controller
public class salMConreoller {

	@Autowired
	private iSalChance isalchance;
	@Autowired
	private iSalPlan isalplan;
	@Autowired
	private ICstCall icstcall;
	int i = 1;
		// 查询客户开发计划集合
		@RequestMapping("/salManagerList")
		public String findScAll(Model model,HttpServletRequest request,SalChance salchance) {
			request.getSession().removeAttribute("manager");
			PageHelper.startPage(1, 3); // 分页
			// 销售对象集合
			List<SalChance> sclist = isalchance.findSalChanceAllLike(null,0);
			// 分页对象集合
			PageInfo<SalChance> pageinfo = new PageInfo<SalChance>(sclist);
			model.addAttribute("sclistpage", pageinfo);// 销售机会集合
				return "Sale/SaleManager";
		}
		
		//销售机会翻页
		@RequestMapping("findManagerLikeAndPage")
		public String findManagerLikeAndPage(SalChance salchance,HttpServletRequest request,Integer pageNum ) {
			request.getSession().setAttribute("salchance", salchance);	
			PageHelper.startPage(pageNum, 3);
			List<SalChance> sclist = isalchance.findSalChanceAllLike(salchance,salchance.getChcStatus());
			PageInfo<SalChance> pageInfo = new PageInfo<SalChance>(sclist);
			request.getSession().setAttribute("sclistpage", pageInfo);
			return "Sale/SaleManager";
		}
		
		//根据id查询单个销售(制定计划)
		@RequestMapping("/scAndMaSelect")
		public String updatescselect(Integer chcid,Model model) {
			SalChance salchance = isalchance.findById(chcid);
			List<SalPlan> splist = isalplan.findSpByScId(chcid);
			model.addAttribute("salchance", salchance);
			model.addAttribute("splist", splist);
			return "Sale/SetPlay";
		}
		
		//根据id查询单个销售(执行计划)
		@RequestMapping("/scAndMaSelect2")
		public String updatescselect2(Integer chcid,Model model) {
			SalChance salchance = isalchance.findById(chcid);
			List<SalPlan> splist = isalplan.findSpByScId(chcid);
			model.addAttribute("salchance", salchance);
			model.addAttribute("splist", splist);
			return "Sale/ExecPlay";
		}
		
		//查询总体
		@RequestMapping("/selectTotal")
		public String selectTotal(Integer chcid,Model model) {
			SalChance salchance = isalchance.findById(chcid);
			List<SalPlan> splist = isalplan.findSpByScId(chcid);
			model.addAttribute("salchance", salchance);
			model.addAttribute("splist", splist);
			return "Sale/LookPlay";
		}
		
		//添加计划
		@RequestMapping("/salPlanInsert")
		public void salPlanAdd(SalPlan salplan,HttpServletResponse response) {
			isalplan.updateInsert(salplan);
			try {
				response.sendRedirect("/scAndMaSelect?chcid="+salplan.getPlaChcId());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//编辑开发计划
		@RequestMapping("/spupdatetode")
		public String salPlanUpdate(Integer spid,String tode,Integer chcid,Integer sign){
			SalPlan plan = new SalPlan();
			plan.setPlaId(spid);
			plan.setPlaTode(tode);
			plan.setPlaTode(tode);
			plan.setPlaChcId(chcid);
			System.out.println(plan.getPlaTode());
			isalplan.salPlanUpdate(plan);
			return "forward:scAndMaSelect?chcid="+chcid;
		}
		//添加计划（修改）
		@RequestMapping("/spupdateresule")
		public String salPlanUpdate(Integer spid,Integer chcid,String resule){
			SalPlan plan = new SalPlan();
			plan.setPlaId(spid);
			plan.setPlaResule(resule);
			isalplan.salPlanUpdate(plan);
			return "forward:scAndMaSelect2?chcid="+chcid;
		}
		//删除开发计划
		@RequestMapping("/deletesp")
		public String salPlanDelete(Integer spid,Integer chcid){
			isalplan.deleteSp(spid);
			return "forward:scAndMaSelect?chcid="+chcid;
		}
		
		//修改状态开发成功
		@RequestMapping("/scUpdateStatus")
		public String updateStatus(Integer chcid,Integer sign,String custname) {
			SalChance chance = new SalChance();
			chance.setChcId(chcid);
			chance.setChcStatus(sign);
			isalchance.update(chance);
			if(sign==3) {
				//生成订单号
				String ordernumber = null;  //订单号
				SimpleDateFormat dateFormat = new SimpleDateFormat("MMdd");
				String sDate = dateFormat.format(new Date());
				if(i<10) {
					ordernumber = "KH"+sDate+0+i;
					i++;
				}
				else {
					ordernumber= "KH"+sDate+i;
					i++;
				}
				CstCustomer customer = new CstCustomer();
				customer.setCustNo(ordernumber);
				customer.setCustName(custname);
				customer.setCustStatus("1");
				icstcall.addCustOmer(customer);
			}
			return "forward:salManagerList";
		}
		
}
