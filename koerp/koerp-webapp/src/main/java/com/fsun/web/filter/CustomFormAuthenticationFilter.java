package com.fsun.web.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.fsun.common.utils.StringUtils;

/**
 * Shiro权限控制-区分Ajax请求
 * 
 * @ClassName: CustomFormAuthenticationFilter
 * @author: wuchulin
 * @date: 2018年4月26日 上午9:57:35
 */
public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {

		if (isLoginRequest(request, response)) {// 是否为登录地址
			if (isLoginSubmission(request, response)) {// 是否为form提交
				return executeLogin(request, response);
			} else {
				// 放行
				return true;
			}
		} else {
			// 判断session里是否有用户信息
			if (!SecurityUtils.getSubject().isAuthenticated()) {
				HttpServletRequest httpServletRequest = WebUtils
						.toHttp(request);
				if (isAjax(httpServletRequest)) {
					HttpServletResponse httpServletResponse = WebUtils
							.toHttp(response);
					httpServletResponse.setStatus(911);
					// 在http头中设置超时标识
					httpServletResponse.setHeader("sessionStatus", "timeout");
					return false;
				} else {
					saveRequestAndRedirectToLogin(request, response);
					return false;
				}
			}
			return true;
		}
	}

	/**
	 * 
	 * 判断是否ajax请求
	 * 
	 * @param: @param request
	 * @param: @return
	 * @return: boolean
	 * @throws
	 */
	private static boolean isAjax(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		if (!StringUtils.isEmpty(header) && "XMLHttpRequest".equalsIgnoreCase(header))
			return true;
		return false;
	}
}