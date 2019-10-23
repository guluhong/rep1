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
import com.turing.entity.BasDict;
import com.turing.entity.Product;
import com.turing.entity.Storage;
import com.turing.service.basCall;

@Controller
public class bascontroller {
	@Autowired
	private basCall dataBaseService;
	
	@RequestMapping(value="/datadictionaryList")
    public String List(Model map,HttpServletRequest request){
        List<BasDict> list = dataBaseService.findAll();//获取所有用户信息
        request.getSession().setAttribute("dalist", list);
        return "manager/DirectionData";
	}
	
	//data模糊查询
	@RequestMapping("/findTIV")
	public String dataSelectSerices(Model map,BasDict baseDict,String type,String dictItem,String dictValue,HttpServletRequest request){
		baseDict.setDictType(type);
		baseDict.setDictItem(dictItem);
		baseDict.setDictValue(dictValue);
		java.util.List<BasDict> list = dataBaseService.findByTIV(baseDict);
		request.getSession().setAttribute("dalist", list);
		return "manager/DirectionData";
	}
	
	@RequestMapping(value="/datadictionaryDel")
    public String Del(Model map,Integer id){
		
       dataBaseService.delById(id);
       //删除后重新获取所有用户信息
       List<BasDict> list = dataBaseService.findAll();
       map.addAttribute("dalist", list);
       return "manager/DirectionData";
	}
	//修改页面
	@RequestMapping("/updshowpage")
	 public String updshowpage(Model map,@RequestParam(defaultValue="1",required=true,value="id") Integer id){
		//获取选择的用户信息
		BasDict list = dataBaseService.findByid(id);
        map.addAttribute("pg",list);
        //跳转到修改页面
        return "manager/DataEdit";
	}
	//修改
	@RequestMapping("/updshow")
	 public String updshow(Model map,String type,String tiaomu,String zhi,Integer state,Integer id){
		BasDict b=new BasDict();
		b.setDictType(type);
		b.setDictIsEditable(state);
		b.setDictValue(zhi);
		b.setDictId(id);
		b.setDictItem(tiaomu);
      System.out.println(type+" "+tiaomu+" "+zhi+" "+state+" "+id);
		dataBaseService.updById(b);//修改用户信息
       //修改后重新获取所有数据信息
       List<BasDict> list = dataBaseService.findAll();
       map.addAttribute("dalist",list);
       //修改完成后跳转数据字典页面
       return "manager/DirectionData";
       
	}
	//添加
	@RequestMapping("/addshow")
	 public String Addshow(Model map,String type,String tiaomu,String zhi,Integer state,Integer id){
		BasDict b=new BasDict();
		b.setDictType(type);
		b.setDictIsEditable(state);
		b.setDictValue(zhi);
		b.setDictId(id);
		b.setDictItem(tiaomu);
		dataBaseService.AddBaseDict(b);//添加用户信息
      //添加后重新获取所有数据信息
      List<BasDict> list = dataBaseService.findAll();
      map.addAttribute("dalist",list);
      //修改完成后跳转数据字典页面
      return "manager/DirectionData";
	}
	//修改页面
		@RequestMapping("/addshowpage")
		 public String addshowpage(Model map){
	        //跳转到添加修改页面
	        return "manager/DataAdd";
		}
	//pro分页pro模糊查询
			@RequestMapping("/findNTB")
			public String proSelectSerices(Model map,Product product,String prodName,String prodType,String prodBatch,HttpServletRequest request,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
				product.setProdName(prodName);
				product.setProdType(prodType);
				product.setProdBatch(prodBatch);
				Integer pageSize=3;//每页显示记录数
		        //分页查询
			    PageHelper.startPage(pageNo, pageSize);
				java.util.List<Product> list = dataBaseService.findByNTB(product);
				PageInfo<Product> pg=new PageInfo<Product>(list);
				map.addAttribute("pg", pg);
				return "manager/ProductSelect";
			}
	//Sto分页sto模糊查询
	@RequestMapping("/findWW")
	public String stoSelectSerices(Model map,Storage storage,String stkWarehouse,String stkWare,HttpServletRequest request,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
		storage.setStkWarehouse(stkWarehouse);
		storage.setStkWare(stkWare);
		Integer pageSize=3;//每页显示记录数
        //分页查询
	    PageHelper.startPage(pageNo, pageSize);
		java.util.List<Storage> list = dataBaseService.findByWW(storage);
		PageInfo<Storage> pg=new PageInfo<Storage>(list);
		map.addAttribute("pg", pg);
		return "manager/DepartSelect";
	}
		
}

