package com.turing.service;

import java.util.List;

import com.turing.entity.CstCustomer;
import com.turing.entity.CstService;
import com.turing.entity.SysUser;

/**
 * 客户服务接口
 * 
 *
 */
public interface IcstService {
	//查询所有的服务
	//模糊查询
	List<CstService> dimList(String name,String title,String type,String state,String bDate,String lDate);
	//查询所有用户
	List<SysUser> userList();
	//根据名字查询用户
	List<SysUser> selectUserByName(String name);
	
	//添加服务
	int insertService(CstService service);
	
	//修改服务
	int updateService(CstService service);
	
	//删除服务
	int deleteService(Integer id);
	
	//根据id查询服务
	CstService selectById(Integer id);
		
	//根据名字查询客户
	List<CstCustomer> selectCus(String name);
}
