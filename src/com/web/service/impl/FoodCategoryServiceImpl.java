package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.FoodCategoryDao;
import com.web.entity.FoodCategory;
import com.web.service.FoodCategoryService;

@Service
public class FoodCategoryServiceImpl implements FoodCategoryService {

	@Autowired
	private FoodCategoryDao foodCategoryDao;
	
	@Override
	public int add(FoodCategory foodCategory) {
		// TODO Auto-generated method stub
		return foodCategoryDao.add(foodCategory);
	}

	@Override
	public int edit(FoodCategory foodCategory) {
		// TODO Auto-generated method stub
		return foodCategoryDao.edit(foodCategory);
	}

	@Override
	public List<FoodCategory> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return foodCategoryDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return foodCategoryDao.getTotal(queryMap);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return foodCategoryDao.delete(id);
	}

	@Override
	public List<FoodCategory> findAll() {
		// TODO Auto-generated method stub
		return foodCategoryDao.findAll();
	}

}
