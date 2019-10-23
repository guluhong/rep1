package com.turing.service;

import java.util.List;

import com.turing.entity.BasDict;
import com.turing.entity.Product;
import com.turing.entity.Storage;

public interface basCall {
      
	/**
	 * 	查询数据字典管理信息
	 * @return 所有信息对象集合
	 */
	List<BasDict> findAll();
	/**
	 * 	根据id查询数据字典管理信息
	 * @param id
	 * @return
	 */
	BasDict findByid(Integer id);
	/**
	 * 	修改
	 * @param b 数据对象
	 * @return	返回受影响行数
	 */
	int updById(BasDict b);
	/**
	 * 	添加
	 * @param b 数据对象
	 * @return	返回受影响行数
	 */
	int AddBaseDict(BasDict b);
	
	int delById(Integer id);
	/**
	 * 模糊查询data
	 * @param example
	 * @return
	 */
	List<BasDict> findByTIV(BasDict b);
	/**
	 * 模糊查询pro
	 * @param example
	 * @return
	 */
	List<Product> findByNTB(Product b);
	/**
	 * 模糊查询sto
	 * @param example
	 * @return
	 */
	List<Storage> findByWW(Storage b);
	/**
	 * Pro分页
	 * @return
	 */
	List<Product> findProPage();
	/**
	 * Sto分页
	 * @return
	 */
	List<Storage> findStoPage();
}
