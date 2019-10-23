package com.turing.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.entity.CstCustomer;
import com.turing.entity.CstCustomerExample;
import com.turing.entity.CstService;
import com.turing.entity.CstServiceExample;
import com.turing.entity.CstServiceExample.Criteria;
import com.turing.entity.SysUser;
import com.turing.entity.SysUserExample;
import com.turing.mapper.CstCustomerMapper;
import com.turing.mapper.CstServiceMapper;
import com.turing.mapper.SysUserMapper;
import com.turing.service.IcstService;

/**
 * 客户服务的实现类
 * 
 *
 */
@Service
public class CstServiceImpl implements IcstService {

	//注入mapper层
	@Autowired
	private CstServiceMapper mapper;
	@Autowired
	private SysUserMapper userMapper;
	@Autowired
	private CstCustomerMapper customerMapper;
	
	//添加
	
	public int insertService(CstService service) {
		return mapper.insertSelective(service);
	}

	//删除
	
	public int deleteService(Integer id) {
		return mapper.deleteByPrimaryKey(id);
	}

	//修改
	
	public int updateService(CstService service) {
		return mapper.updateByPrimaryKeySelective(service);
	}

	//查询用户
	
	public List<SysUser> userList() {
		return userMapper.selectByExample(null);
	}

	//根据id查询
	public CstService selectById(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	//模糊查询
	
	public List<CstService> dimList(String name, String title, String type, String state,String bDate,String lDate
			)  {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		//创建CstServiceExample对象
		CstServiceExample example=new CstServiceExample();
		Criteria criteria = example.createCriteria();
		if(name!=null && name!="") {
			criteria.andSvrCustNameLike("%"+name+"%");
			
		}
		if(title!=null && title!="") {
			criteria.andSvrTitleLike("%"+title+"%");
			
		}
		if(type!=null && type!="") {
			if (type.equals("全部")) {
				criteria.andSvrTypeLike("%"+"%");
			}else {				
				criteria.andSvrTypeLike("%"+type+"%");
			}
		}
		if(bDate!=null && lDate!=null && bDate!="" && lDate!="") {
			try {
				criteria.andSvrCreateDateBetween(format.parse(bDate), format.parse(lDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(state!=null && state!="") {
			if(state.equals("全部")) {
				criteria.andSvrStatusLike("%"+"%");
			}else {				
				criteria.andSvrStatusLike("%"+state+"%");
			}
		}
		return mapper.selectByExample(example);
	}

	//根据名字查询客户
	public List<CstCustomer> selectCus(String name) {
		CstCustomerExample example=new CstCustomerExample();
		com.turing.entity.CstCustomerExample.Criteria criteria = example.createCriteria();
		criteria.andCustNameEqualTo(name);
		return customerMapper.selectByExample(example);
	}

	//根据名字查询用户
	public List<SysUser> selectUserByName(String name) {
		SysUserExample example=new SysUserExample();
		com.turing.entity.SysUserExample.Criteria criteria = example.createCriteria();
		criteria.andUserNameEqualTo(name);
		return userMapper.selectByExample(example);
	}
	
}
