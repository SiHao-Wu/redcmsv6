package com.redcms.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;

import com.redcms.beans.Admin;
import com.redcms.db.Db;
import com.redcms.servelt.core.Action;
import com.redcms.util.Md5Encrypt;

@WebServlet("/admin/login")
public class AdminServlet extends Action {

	@Override
	public void index()throws ServletException, IOException {
		
		this.forword("admin/login.jsp");

	}
	
	public void checkLogin() throws ServletException,IOException{
		Admin admin=new Admin();
		this.getBean(admin);
		
		String serverrand=(String) req.getSession().getAttribute("randomCode");
		String rand=this.getString("rand");
		if(rand.equals(serverrand)) {
			String sql="select * from admin where uname=? and upwd=? limit 1";
			try {
				Admin loged=Db.query(sql, new BeanHandler<Admin>(Admin.class),admin.getUname(),Md5Encrypt.md5(admin.getUpwd()));
				if(null!=loged&&loged.getUname().equals(admin.getUname())) {
					req.getSession().setAttribute("loged", loged);
					redirect("index");
				}else {
					setAttr("err", "用户名或密码错误");
					index();
				}
			
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}
		else {
			setAttr("err","验证码错误");
			index();
		}
		
	}
	public void logout()throws ServletException, IOException {
		   
		   req.getSession().removeAttribute("loged");
		   req.getSession().invalidate();
		   
		   redirect("login");
	}
	

}
