package com.redcms.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.redcms.servelt.core.Action;
@WebServlet("/admin/index")
public class AdminMainServlet extends Action {

	@Override
	public void index()throws ServletException, IOException {
		// TODO Auto-generated method stub
       forword("admin/index.jsp");
	}

}
