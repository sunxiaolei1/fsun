package com.fsun.web.init;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fsun.common.utils.PropertiesUtil;

/**
 * 
 * 服务启动时加载系统配置信息
 *
 */
public class SystemSettingContextListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

	public void contextInitialized(ServletContextEvent event) {
		
		ServletContext servletContext = event.getServletContext();
		try {
			System.out.println("Settings is loading ........................");
			PropertiesUtil propertiesUtil= new PropertiesUtil("localConfig.properties");
			Properties ps  = propertiesUtil.getProperties();			
			servletContext.setAttribute("systemName", new String(ps.getProperty("systemName")));
			servletContext.setAttribute("titleName", new String(ps.getProperty("titleName")));
			servletContext.setAttribute("companyLtd", new String(ps.getProperty("companyLtd")));			
			servletContext.setAttribute("companyTel", new String(ps.getProperty("companyTel")));				
			servletContext.setAttribute("companyFax", new String(ps.getProperty("companyFax")));				
			servletContext.setAttribute("companyName", new String(ps.getProperty("companyName")));							
			System.out.println("Settings loaded successfully !");			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
	}

	public void contextDestroyed(ServletContextEvent event) {
		
	}
}
