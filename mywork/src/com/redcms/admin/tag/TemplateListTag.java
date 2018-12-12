package com.redcms.admin.tag;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.redcms.util.TemplateFileFilter;





public class TemplateListTag extends SimpleTagSupport 
{
    private String temType;//模板的类型，只能中index list content
    private String fieldName; //表单项的名字
    private String defVal;//哪一项默认选中
    
	@Override
	public void doTag() throws JspException, IOException 
	{
		StringBuilder sb=new StringBuilder();
		if(null==fieldName)
		{
			if("index".equals(temType))fieldName="index_tem";
			if("list".equals(temType))fieldName="list_tem";
			if("content".equals(temType))fieldName="content_tem";
		}
		//sb.append("<select class='form-control' name='"+fieldName+"'>");
		sb.append("<select   name='"+fieldName+"'>");
		if(!"content".equals(temType))
		{
			
			sb.append("<option value='-1'>不需要"+("list".equals(temType)?"列表":"首页")+"模板</option>");
			
		}
		//模板从硬盘目录中取出来
		PageContext pc=(PageContext)this.getJspContext();
		ServletContext sc=pc.getServletContext();
		String realpath=sc.getRealPath("WEB-INF/template");
		
		String alltem[]=TemplateFileFilter.getTemplateFiles(realpath, temType);
		if(null!=alltem&&alltem.length>0)
		{
			for(String temfile:alltem)
			{
				
				if(temfile.equals(defVal))
				{
					
					sb.append("<option  selected='selected' value='"+temfile.substring(0,temfile.lastIndexOf("."))+"'>"+temfile+"</option>");	
				}else
				{
				sb.append("<option value='"+temfile.substring(0,temfile.lastIndexOf("."))+"'>"+temfile+"</option>");
				}
			}
		}
	
		
		sb.append("</select>");
		
		this.getJspContext().getOut().println(sb.toString());
	}
	public String getTemType() {
		return temType;
	}
	public void setTemType(String temType) {
		this.temType = temType;
	}

	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getDefVal() {
		return defVal;
	}
	public void setDefVal(String defVal) {
		this.defVal = defVal;
	}
}
