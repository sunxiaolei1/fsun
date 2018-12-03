package com.fsun.web.init;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

/**
 * 
 * 服务启动时加载系统配置信息
 *
 */
public class SystemSettingContextListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

	public void contextInitialized(ServletContextEvent event) {
		ServletContext servletContext = event.getServletContext();
		//TaskUtils.setServletContext(servletContext);
		try {

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}
