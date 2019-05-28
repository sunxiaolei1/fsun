package com.fsun.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

/**
 * session超时处理过滤器
 *
 * @author Gang Sun
 */
public class SessionTimeOutFilter implements Filter {

	/**
	 * 保存在session中的key
	 */
	private static final String SESSION_KEY = "user";

	/**
	 * 字符编码
	 */
	private static final String ENCODING = "UTF-8";

	/**
	 * 处理session过期
	 */
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession(true);
		response.setCharacterEncoding(ENCODING);
		
		// 判断session是否过期
		Object user = session.getAttribute(SESSION_KEY);
		if (session == null || user == null) {
			// 此处考虑ajax操作session过期的操作,如果ajax请求过程中session过期,则指定过期状态码为：911
			String requestType = request.getHeader("X-Requested-With");
			if (requestType != null && StringUtils.isNotBlank(requestType)
					&& requestType.equalsIgnoreCase("XMLHttpRequest")) {
				// 设置返回状态码
				response.setStatus(911);
				// 在http头中设置超时标识
				response.setHeader("sessionStatus", "timeout");
				// 在http头中添加session超时后跳转的页面
				response.addHeader("loginUrl", "");
				return;
			}else{
				chain.doFilter(request, response);
				return;
			}
		} else {
			chain.doFilter(request, response);
			return;
		}

	}

	/**
	 * 初始化参数配置
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {
	}

}
