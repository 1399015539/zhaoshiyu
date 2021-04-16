package com.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.entity.Authority;

/**
 * 	权限service接口
 * @author asus
 *
 */
@Service
public interface AuthorityService {
	public int add(Authority authority);
	public int deleteByRoleId(Long roleId);
	public List<Authority> findListByRoleId(Long roleId);
}
