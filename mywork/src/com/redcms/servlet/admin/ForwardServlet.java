package com.redcms.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.redcms.servelt.core.Action;
@WebServlet("/admin/foward")
public class ForwardServlet extends Action {

	@Override
	public void index() throws ServletException, IOException {
		
		String page=this.getString("page");
		forword(page);
		
	}

}
