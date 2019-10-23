package com.turing.service;

import com.turing.entity.SysUser;

public interface IWxplogin {

	SysUser wpxlogin(SysUser sysUser);
	
	int register(SysUser user);
	
	boolean registerCheck(SysUser user);
	
}
