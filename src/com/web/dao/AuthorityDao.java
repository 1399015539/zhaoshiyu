package com.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Authority;

/**
 * 权限实现类dao
 * @author asus
 *
 */
@Repository
public interface AuthorityDao {
	public int add(Authority authority);
	public int deleteByRoleId(Long roleId);
	public List<Authority> findListByRoleId(Long roleId);
}
