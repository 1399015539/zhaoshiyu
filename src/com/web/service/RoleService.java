package com.web.service;

import java.util.List;
import java.util.Map;

import com.web.entity.Role;

/**
 * 角色service
 * @author asus
 *
 */
public interface RoleService {
	public int add(Role role);
	public int edit(Role role);
	public int delete(Long id);
	public List<Role> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
	public Role find(Long id);
}
