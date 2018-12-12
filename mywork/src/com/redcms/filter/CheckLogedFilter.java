package com.redcms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.redcms.beans.Admin;
@WebFilter("/admin/*")
public class CheckLogedFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException 
	{
		 HttpServletRequest  req=(HttpServletRequest)arg0;
		 HttpServletResponse resp=(HttpServletResponse)arg1;
		 
		 String url=req.getRequestURL().toString();
		 
		 HttpSession hs=req.getSession();
		 Admin admin=(Admin)hs.getAttribute("loged");
		if(null!=admin||url.indexOf("admin/login")!=-1)
		{
			arg2.doFilter(req, resp);
		}else
		{
			resp.sendRedirect("login");
		}
		 
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException 
	{
		// TODO Auto-generated method stub
		
	}

}
