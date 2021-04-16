package com.web.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
/**
 * 后台登陆拦截器
 * @author asus
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();
		
		Object admin = request.getSession().getAttribute("admin");
		if(admin == null) {
			//表示还没有登陆或者登录失效
			System.out.println("链接"+requestURI+"进入拦截器");
			String header = request.getHeader("X-Requested-With");
			//判断是不是ajax请求
			if("XMLHttpRequest".equals(header)) {
				Map<String, String> ret = new HashMap<String, String>();
				ret.put("type", "error");
				ret.put("msg", "登录会话超时或还没登陆请重新登陆！");
				response.getWriter().write(JSONObject.fromObject(ret).toString());
				return false;
			}
			//表示是普通链接跳转直接重定向到登陆页面
			response.sendRedirect(request.getServletContext().getContextPath() + "/system/login");
			return false;
		}
		return true;
	}

}
