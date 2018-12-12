

package com.redcms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.redcms.beans.Admin;
import com.redcms.db.Db;
import com.redcms.servelt.core.Action;
import com.redcms.util.Md5Encrypt;
@WebServlet("/admin/admin")
public class AdminManagerservlet extends Action {

	@Override
	public void index() throws ServletException, IOException {
		List<Admin> list=null;
		try {
			list=Db.query("select * from admin",new BeanListHandler<Admin>(Admin.class));
			setAttr("list", list);
		} catch (SQLException e) {
			setAttr("err", "查询管理员失败");
			e.printStackTrace();
		}
		this.forword("admin/admin_manager.jsp");
		
	}
	
	public void saveAdd() throws ServletException,IOException{
		Admin admin=new Admin();
		admin.setActive((byte)1);
		this.getBean(admin);
		admin.setUpwd(Md5Encrypt.md5(admin.getUpwd()));
		try {
			Db.update("insert into admin(uname,upwd,upur) values(?,?,?)",admin.getUname(),admin.getUpwd(),admin.getUpur());
			setAttr("msg", "增加管理员成功");
			
		} catch (SQLException e) {
			setAttr("err", "增加管理员失败");
			e.printStackTrace();
		}
		index();
	}
	
	//删除
	public void del() throws ServletException,IOException{
		
		int id=this.getInt("id");
		if(id>0) {
			try {
				Db.update("delete from admin where id=?",id);
				setAttr("msg", "删除管理员成功!");
			} catch (SQLException e) {
				setAttr("err","删除管理员失败!");
				e.printStackTrace();
			}
			
		}
		
		index();
		
	}
	
	//修改
	public void update() throws ServletException,IOException{
		Admin admin=new Admin();
		admin.setActive((byte)1);
		String newpwd=this.getString("newpwd");
		this.getBean(admin);
		if(!"".equals(admin.getUname())) {
			admin.setUpwd(Md5Encrypt.md5(newpwd));
			
			try {
				Db.update("update admin set uname=?,upwd=?,upur=? where id=?",admin.getUname(),admin.getUpwd(),admin.getUpur(),admin.getId());
				setAttr("msg", "修改成功");
			
			} catch (SQLException e) {
				setAttr("err","修改失败");
				e.printStackTrace();
			}
		}
		index();
	}
	
	
	
}





