package com.redcms.servlet.admin;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.redcms.beans.Channel;
import com.redcms.beans.ChannelAttr;
import com.redcms.beans.Model;
import com.redcms.beans.ModelItem;
import com.redcms.beans.Pictures;
import com.redcms.db.Db;
import com.redcms.servelt.core.Action;
@WebServlet("/admin/channel")
public class ChannelServlet extends Action {

	@Override
	public void index() throws ServletException, IOException {
		try {
			List<Model> models=Db.query("select * from model order by priority", new BeanListHandler<Model>(Model.class));
			setAttr("models",models);
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		forword("admin/channel_list.jsp");
	}
	public void toadd() throws ServletException, IOException {
		int mid=this.getInt("mid");
		if(mid>0) {
			try {
				Model mo=Db.query("select * from model where id=?", new BeanHandler<Model>(Model.class),mid);
				List<ModelItem> modelItems=Db.query("select * from model_item where model_id=? and is_channel=1 and is_display=1 order by priority", new BeanListHandler<ModelItem>(ModelItem.class),mid);
				List<Channel> parentchannel=Db.query("select * from channel where parent_id=0 or parent_id is null", new BeanListHandler<Channel>(Channel.class));
				
				List<Model> models=Db.query("select * from model order by priority", new BeanListHandler<Model>(Model.class));
				
				setAttr("mo", mo);
				setAttr("modelItems", modelItems);
				setAttr("parentchannel", parentchannel);
				forword("admin/channel_add.jsp");
			
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			
		}
		else {
			index();
		}
	}
	
	public void addsave()throws ServletException, IOException {
		//增加channel
		String sql="insert into channel(model_id,name,title,keywords,description,parent_id,pic01,pic02,priority,links,t_name,index_tem,list_tem,content_tem,create_time,txt,txt1,txt2,num01,num02,date1,date2) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Channel channel=new Channel();
		this.getBean(channel);
		channel.setCreate_time(new Date());
		
		try {
			Object rowparam[]=new Object[] {channel.getModel_id(),channel.getName(),channel.getTitle(),channel.getKeywords(),channel.getDescription(),channel.getParent_id(),channel.getPic01(),channel.getPic02(),channel.getPriority(),channel.getLinks(),channel.getT_name(),channel.getIndex_tem(),channel.getList_tem(),channel.getContent_tem(),channel.getCreate_time(),
					channel.getTxt(),channel.getTxt1(),channel.getTxt2(),channel.getNum01(),channel.getNum02(),channel.getDate1(),channel.getDate2()};
			Db.update(sql,rowparam);
			Object lastobj=Db.query("select LAST_INSERT_ID() from dual", new ArrayHandler())[0];

			long lastid=0;
			if(lastobj instanceof Long)
			{
				lastid=((Long)lastobj);
			}else if(lastobj instanceof BigInteger)
			{
				lastid=((BigInteger)lastobj).longValue();
			}
		//	System.out.println("********************");
		//更改pictures表  图集
			for(int i=1;i<3;i++) {
				String [] ids=req.getParameterValues("pics"+i+"_ids");
				String [] prio=req.getParameterValues("pics"+i+"_priority");
				String [] diss=req.getParameterValues("pics"+i+"_dis");
				if(null!=ids&&null!=prio&&null!=diss&&ids.length==prio.length&&ids.length==diss.length) {
					String sqlba="update pictures set channel_id=?,picdis=?,priority=?,sequ=? where id=?";
					Object [][]parasm=new Object[ids.length][];
					for(int z=0;z<ids.length;z++)
					{
						Object[] row=new Object[5];
						row[0]=lastid;
						row[1]=diss[z];
						row[2]=Integer.parseInt(prio[z]);
						row[3]=z;
						row[4]=ids[z];
						parasm[z]=row;
					}
					Db.batch(sqlba, parasm);
				}
			}
			
		//	System.out.println("*>>>>>>>>>>>>>>>>>>>>>>>>*******");
			//增加额外字段
			String sqlmol="select * from model_item where model_id=? and is_channel=1 and is_custom=1 order by priority";
			List<ModelItem> modelitemlist=Db.query(sqlmol, new BeanListHandler<ModelItem>(ModelItem.class),channel.getModel_id());
			if(null!=modelitemlist&&modelitemlist.size()>0) {
				Object[][] params=new Object[modelitemlist.size()][];
				List<Object[]> attrlist=new ArrayList<Object[]>();
				
				for(ModelItem  mi:modelitemlist) {
					String insersql="insert into channel_attr(channel_id,field_name,field_value) values(?,?,?)";
					String value=req.getParameter(mi.getField());
					Object[] row=new Object[3];
					row[0]=lastid;
					row[1]=mi.getField();
					row[2]=value;
					
					attrlist.add(row);
					Db.update(insersql,row);
					
					
				}
			}
			setAttr("msg", "增加栏目成功");		
		} catch (SQLException e) {
			setAttr("err", "增加栏目失败");
			e.printStackTrace();
		}
	
		index();

	}
	
	//跳转修改页面
	public void  channeledit()  throws ServletException, IOException {
		int id=this.getInt("id");
		if(id>0) {
			try {
				Channel channel=Db.query("select * from channel where id=?", new BeanHandler<Channel>(Channel.class),id);
				Model mo=Db.query("select * from model where id=?", new BeanHandler<Model>(Model.class),channel.getModel_id());
				List<ModelItem> modelItems=Db.query("select * from model_item where model_id=? and is_channel=1 and is_display=1 order by priority", new BeanListHandler<ModelItem>(ModelItem.class),mo.getId());
				List<ChannelAttr> mapattr=Db.query("select * from channel_attr where channel_id=?", new BeanListHandler<ChannelAttr>(ChannelAttr.class),id);
				Map<String,String> channalattr=new HashMap<String,String>();
		        if(null!=mapattr)
		        for(ChannelAttr ca:mapattr)
		        {
		        	channalattr.put(ca.getField_name(), ca.getField_value());
		        }
				
		        List<Channel> parentchannel=Db.query("select * from channel where parent_id=0 or parent_id is null", new BeanListHandler<Channel>(Channel.class));
		    	//图集一
				List<Pictures> pics1=Db.query("select * from pictures where channel_id=? and sequ=1", new BeanListHandler<Pictures>(Pictures.class),id);
				
				//图集二
				List<Pictures> pics2=Db.query("select * from pictures where channel_id=? and sequ=2", new BeanListHandler<Pictures>(Pictures.class),id);
				setAttr("channalattr", channalattr);
				setAttr("pics1", pics1);
				setAttr("pics2", pics2);
				setAttr("mo", mo);
				setAttr("modelItems", modelItems);
				setAttr("parentchannel", parentchannel);
				setAttr("channel",channel);
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		this.forword("admin/channel_edit.jsp");

	}
	
	
	//保存修改
	public void editsave() throws ServletException, IOException {
		try {
			//修改栏目的值
			Channel channel=new Channel();
			this.getBean(channel);
			channel.setCreate_time(new Date());
			String sql="update channel set model_id=?,name=?,title=?,keywords=?,description=?,parent_id=?,pic01=?,pic02=?,priority=?,links=?,t_name=?,index_tem=?,list_tem=?,content_tem=?,create_time=?,txt=?,txt1=?,txt2=?,num01=?,num02=?,date1=?,date2=? where id=?";
			Object rowparam[]=new Object[] {channel.getModel_id(),channel.getName(),channel.getTitle(),channel.getKeywords(),channel.getDescription(),channel.getParent_id(),channel.getPic01(),channel.getPic02(),channel.getPriority(),channel.getLinks(),channel.getT_name(),channel.getIndex_tem(),channel.getList_tem(),channel.getContent_tem(),channel.getCreate_time(),
					channel.getTxt(),channel.getTxt1(),channel.getTxt2(),channel.getNum01(),channel.getNum02(),channel.getDate1(),channel.getDate2(),channel.getId()};
			
			Db.update(sql,rowparam);
			
			//删除扩展字段
			Db.update("delete from channel_attr where channel_id=?",channel.getId());
			
			//修改扩展字段
			String sqlmol="select * from model_item where model_id=? and is_channel=1 and is_custom=1 order by priority";
			List<ModelItem> modelitemlist=Db.query(sqlmol, new BeanListHandler<ModelItem>(ModelItem.class),channel.getModel_id());
			
			if(null!=modelitemlist&&modelitemlist.size()>0) {
				   String insersql="insert into channel_attr(channel_id,field_name,field_value) values(?,?,?)";
				   for (ModelItem mi : modelitemlist) {
					   String value=req.getParameter(mi.getField());
					   Object[] row=new Object[3];
					   row[0]=channel.getId();
					   row[1]=mi.getField();
					   row[2]=value;
					   Db.update(insersql,row);

				   }
				
			}
		
			//图集
			for(int i=1;i<3;i++) {
				String [] ids=req.getParameterValues("pics"+i+"_ids");
				String [] prio=req.getParameterValues("pics"+i+"_priority");
				String [] diss=req.getParameterValues("pics"+i+"_dis");
				
				if(null!=ids&&null!=prio&&null!=diss&&ids.length==prio.length&&ids.length==diss.length) {
					String sqlba="update pictures set channel_id=?,picdis=?,priority=?,sequ=? where id=?";
					Object [][]parasm=new Object[ids.length][];
					for(int z=0;z<ids.length;z++)
					{
						Object[] row=new Object[5];
						row[0]=channel.getId();
						row[1]=diss[z];
						row[2]=Integer.parseInt(prio[z]);
						row[3]=i;
						row[4]=ids[z];
						
						parasm[z]=row;
						
					}
					
					Db.batch(sqlba, parasm);
					
				}
			}
			setAttr("msg", "修改成功!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		index();
	}

	//删除栏目
	public void channeldel() throws ServletException, IOException {
		
		int id=this.getInt("id");
		if(id>0) {
			try {
				//删除栏目扩展字段
				Db.update("delete from channel_attr where channel_id=?",id);
				//删除图集
				Db.update("delete from pictures where channel_id=?",id);
				//删除栏目子栏目
				Db.update("delete from channel where parent_id=?",id);

				Db.update("delete from channel where id=?",id);

				setAttr("msg","删除成功");
			} catch (SQLException e) {
				setAttr("err", "删除失败");
				e.printStackTrace();
			}
		}
		index();
		
	}
	
}
