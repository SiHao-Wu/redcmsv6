package com.redcms.util;
import java.io.File;
import java.io.FilenameFilter;

public class TemplateFileFilter 
{
	/**
	 * 找指定目录下的指定文件列表
	 * @param realpath
	 * @param pattern   list   index   content
	 * @return
	 */
   public static  String [] getTemplateFiles(String realpath,final String pattern)
   {
	   File f=new File(realpath);
	   String [] re=null;
	   
	   re=f.list(new FilenameFilter() {
		
		@Override
		public boolean accept(File dir, String name) 
		{
			if(name.indexOf(pattern)!=-1)
				return true;
			else
			return false;
		}
	});
	   return re;
	   
	   
   }
}
