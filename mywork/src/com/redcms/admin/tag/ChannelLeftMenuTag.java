package com.redcms.admin.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.redcms.beans.Channel;
import com.redcms.beans.Model;
import com.redcms.db.Db;


public class ChannelLeftMenuTag extends SimpleTagSupport {
	 private Logger log=Logger.getLogger(ChannelLeftMenuTag.class);
	 
	
	    
		@Override
		public void doTag() throws JspException, IOException 
		{
		    StringBuilder sb=new StringBuilder();
		  
		    
		    sb.append("<div id=\"treemenu\">");
		    sb.append("<ul>");
		  //  sb.append("<li class=\"parent_menu\"><span><i class=\"fa fa-folder\"></i> 根节点</span></li>");
		    try {
			         
		    	List<Channel> parent=Db.query("select * from channel where parent_id=0 or parent_id is null", new BeanListHandler<Channel>(Channel.class));
				
				if(null!=parent&&parent.size()>0)
				{
					int index=1;
					for(Channel c:parent)
					{
						
						Model mm=Db.query("select * from model where id=?", new BeanHandler<Model>(Model.class),c.getModel_id());
						sb.append("<li class=\"parent_menu\"><span><i class=\"fa fa-folder\"></i> "+c.getName()+"</span>");
						
						
						List<Channel> subs=Db.query("select * from channel where parent_id=? or parent_id is null order by priority", new BeanListHandler<Channel>(Channel.class),c.getId());
						
						if(null!=subs&&subs.size()>0)
						{
							sb.append("<ul>");
							for(Channel s:subs)
							{
								sb.append("<li class=\"sub_menu\"><span class=\"fa fa-file-image-o\"></span> ");
								sb.append("<a href=\"admin/article?action=list&pageNo=1&channel_id="+s.getId()+"\">");
								sb.append(s.getName());
								sb.append("</a>");
								sb.append("</li>");
							}
							sb.append("</ul>");
						}
						sb.append("</li>");
					}
				}
				
				
		    } catch (Exception e) {
				log.error("ChannelLeftMenuTag_ERROR_43_显示栏目列表出错"+e);
			}
		    
		    sb.append("</ul>");
		    sb.append("</div>");
		    
		    this.getJspContext().getOut().println(sb.toString());
		}
		
}
