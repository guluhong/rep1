package com.turing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turing.entity.BasDict;
import com.turing.entity.BasDictExample;
import com.turing.entity.BasDictExample.Criteria;
import com.turing.entity.Product;
import com.turing.entity.ProductExample;
import com.turing.entity.Storage;
import com.turing.entity.StorageExample;
import com.turing.mapper.BasDictMapper;
import com.turing.mapper.ProductMapper;
import com.turing.mapper.StorageMapper;
import com.turing.mapper.SysUserMapper;
import com.turing.service.basCall;

@Service
public class basCallimpl implements basCall {
	@Autowired
	private BasDictMapper baseDictMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private StorageMapper storageMapper;
	//修改数据
	public int updById(BasDict b) {
		return baseDictMapper.updateByPrimaryKey(b);
	}
	//查找所有数据
	public List<BasDict> findAll() {
		
		return baseDictMapper.selectByExample(null);
	}
	public int delById(Integer id) {
		return baseDictMapper.deleteByPrimaryKey(id);
	}
	public List<Product> findProPage() {
		return productMapper.selectByExample(null);
	}
	public List<Storage> findStoPage() {
		return storageMapper.selectByExample(null);
	}
	public BasDict findByid(Integer id) {
		return baseDictMapper.selectByPrimaryKey(id);
	}
	/**
	 * 模糊查询
	 */
	public List<BasDict> findByTIV(BasDict b) {
		BasDictExample example=new BasDictExample();
		Criteria criteria = example.createCriteria();
		if (b!= null) {
			String dictType = b.getDictType();
			String dictValue = b.getDictValue();
			String dictItem = b.getDictItem();
			if(dictType!=null&&dictType!="") {
				criteria.andDictTypeLike('%'+b.getDictType()+'%');				
			}
			if(dictItem!=null&&dictItem!="") {
				criteria.andDictItemLike('%'+b.getDictItem()+'%');
			}
			if(dictValue!=null&&dictValue!="") {
				criteria.andDictValueLike('%'+b.getDictValue()+'%');
			}
		}
		return baseDictMapper.selectByExample(example);
	}
	
	public int AddBaseDict(BasDict b) {
		return baseDictMapper.insert(b);
	}
	public List<Product> findByNTB(Product p) {
		ProductExample pexample=new ProductExample();
		com.turing.entity.ProductExample.Criteria pcriteria = pexample.createCriteria();
		if (p!= null) {
			String prodName = p.getProdName();
			String prodType = p.getProdType();
			String prodBatch = p.getProdBatch();
			if(prodName!=null&&prodName!="") {
				pcriteria.andProdNameLike('%'+prodName+'%');	
			}
			if(prodType!=null&&prodType!="") {
				pcriteria.andProdTypeLike('%'+prodType+'%');
			}
			if(prodBatch!=null&&prodBatch!="") {
				pcriteria.andProdBatchLike('%'+prodBatch+'%');
			}
		}
		return productMapper.selectByExample(pexample);
	}
	public List<Storage> findByWW(Storage s) {
		StorageExample sexample=new StorageExample();
		com.turing.entity.StorageExample.Criteria scriteria = sexample.createCriteria();
		if (s!= null) {
			String stkWare = s.getStkWare();
			String warehouse = s.getStkWarehouse();
			if(stkWare!=null&&stkWare!="") {
				scriteria.andStkWareLike('%'+stkWare+'%');				
			}
			if(warehouse!=null&&warehouse!="") {
				scriteria.andStkWarehouseLike('%'+warehouse+'%');
			}
		}
		return storageMapper.selectByExample(sexample);
}
}
