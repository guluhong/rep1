package com.turing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.entity.SysUser;
import com.turing.entity.SysUserExample;
import com.turing.mapper.SysUserMapper;
import com.turing.service.IWxplogin;

@Service
public class wxploginImpl implements IWxplogin{
	
	@Autowired
	private SysUserMapper sysUserMapper;

	
	public SysUser wpxlogin(SysUser sysUser) {
		return sysUserMapper.wxpselectSysUser(sysUser);
	}


	public int register(SysUser user) {
		// TODO Auto-generated method stub
		return sysUserMapper.insertSelective(user);
	}


	public boolean registerCheck(SysUser user) {
		// TODO Auto-generated method stub
		SysUserExample example = new SysUserExample();
		example.createCriteria().andUserNameEqualTo(user.getUserName());
		return sysUserMapper.selectByExample(example).size()>0?false:true;
	}

	
}
