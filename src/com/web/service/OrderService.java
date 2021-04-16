package com.web.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.entity.Order;
import com.web.entity.OrderItem;

/**
 * 订单信息service
 * @author llq
 *
 */
@Service
public interface OrderService {
	public int add(Order order);
	public int addItem(OrderItem orderItem);
	public int edit(Order Order);
	public List<Order> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
}
