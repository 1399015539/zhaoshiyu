package com.web.service;
/**
 * 客户信息service类
 * @author asus
 *
 */

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.entity.Account;

@Service
public interface AccountService {
	public int add(Account account);
	public int edit(Account account);
	public List<Account> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
	public Account findByName(String name);
}
