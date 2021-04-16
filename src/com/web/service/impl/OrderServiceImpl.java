package com.web.service.impl;
/**
 * 订单信息实现类
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.OrderDao;
import com.web.entity.Order;
import com.web.entity.OrderItem;
import com.web.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	@Override
	public int add(Order Order) {
		// TODO Auto-generated method stub
		return orderDao.add(Order);
	}

	@Override
	public int edit(Order Order) {
		// TODO Auto-generated method stub
		return orderDao.edit(Order);
	}

	@Override
	public List<Order> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return orderDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return orderDao.getTotal(queryMap);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return orderDao.delete(id);
	}

	@Override
	public int addItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderDao.addItem(orderItem);
	}

	
}
