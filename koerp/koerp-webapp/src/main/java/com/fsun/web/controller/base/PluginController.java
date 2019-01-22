package com.fsun.web.controller.base;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/base/plugin")
public class PluginController extends BaseController{
	
	/**
	 * @description 显示列表
	 * @return ModelMap
	 * @param
	 * @update 2012-8-9 下午3:52:06
	 */
	@RequestMapping(value = "/index", method={RequestMethod.GET,RequestMethod.POST})
	public String manage() {
		return "base/plugin/index";
	}
	
	
	private final String path = "/views/base/plugin/";
	
	/**
	 * 用户虚拟机模板下载
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/lodopDownload", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
    public void lodopDownload(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{  
        response.setCharacterEncoding("utf-8");  
        response.setContentType("multipart/form-data");  
        String fileName = java.net.URLDecoder.decode(request.getParameter("fileName"),"utf-8");
        
        String rootPath= request.getServletContext().getRealPath("/");
        HttpSession session = request.getSession();
        //String rootPath = request.getSession().getServletContext().getRealPath("/");
        response.setHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO8859-1" ));  
        OutputStream os = null;
        InputStream inputStream = null;
        try {  
            inputStream = new FileInputStream(rootPath + path + fileName);
            os = response.getOutputStream();  
            byte[] b=new byte[1024];  
            int length;  
            while((length=inputStream.read(b))>0){  
                os.write(b,0,length);  
            }              
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }finally {
        	try {
    			if(inputStream != null){
    				inputStream.close();
    			}
				if(os != null){
	        		os.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}  
    }  
}
