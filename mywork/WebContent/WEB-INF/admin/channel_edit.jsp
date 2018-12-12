<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="red" uri="/redcms/tags" %>
<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<title>修改栏目</title>
	<link rel="stylesheet" href="css/plugins/webuploader/webuploader.css" />
 <script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>

    <script src="js/jquery.min.js?v=2.1.4"></script>
	<script type="text/javascript" src="js/plugins/webuploader/webuploader.min.js" ></script>
</head>

<%
Channel chl=(Channel)request.getAttribute("channel");
Class chlclazz=chl.getClass();
%>
<body class="gray-bg" style="font-family:微软雅黑;">
   
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改栏目</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    
                    
                     <div class="ibox-content">
                       <!--面板开始-->   
<form class="form-horizontal" action="admin/channel" method="post">
<input type="hidden" value="editsave" name="action"/>
		      <div class="form-group col-sm-4">
				    <label  class="col-sm-5 col-md-4 control-label">模型名:</label>
				    <div class="col-sm-7 col-md-8">
				    <input type="hidden" name="model_id" value="${mo.id}"/>
				    <input type="hidden" name="id" value="${channel.id}"/>
				    ${mo.name}
				    </div>
		      </div>
		      
		       <div class="form-group col-sm-4">
				    <label  class="col-sm-5 col-md-4 control-label">父栏目:</label>
				    <div class="col-sm-7 col-md-8">
				    
				     <select name="parent_id">
				      <option value="0">顶层栏目</option>
				       <c:forEach items="${parentchannel}" var="p">
				         <option value="${p.id}" ${channel.parent_id==p.id?"selected=\"selected\"":""}>${p.name}</option>
				       </c:forEach>
				     </select>
				    </div>
		      </div>
		      
<c:forEach items="${modelItems}" var="mis">
        
         <c:set value="${mis.field}" var="misField" scope="request"/>
          
          <%
		       String field=(String)request.getAttribute("misField");
               Object result="";
          try{
        	     java.lang.reflect.Field cfield=chlclazz.getDeclaredField(field);
  		         if(null!=cfield)
  		         {
  		       cfield.setAccessible(true);
  		       result=cfield.get(chl); 
  		         }
          }catch(Exception e)
          {
        	  
          }
		  
		      %>

              <c:if test="${mis.is_single==0}">
	              <div class="form-group col-sm-4">
					    <label  class="col-sm-5 col-md-4 control-label">${mis.field_dis}:</label>
	                  <div class="col-sm-7 col-md-8">
					 
              </c:if>
               <c:if test="${mis.is_single==1}">
	              <div class="form-group col-sm-12 ">
					   <label  class="col-sm-2 col-md-1 control-label">${mis.field_dis}::</label>
	             <div class="col-sm-8 col-md-10" >
					  
              </c:if>
<c:choose>
    <c:when test="${mis.data_type==1 ||(mis.is_custom==1)}">
    
		    <c:choose>
		    <c:when test="${mis.field=='index_tem'}">
		        <red:tempFiles temType="index" fieldName="${mis.field}" defVal="${channel.index_tem}"/>
		    </c:when>
		    <c:when test="${mis.field=='list_tem'}">
		        <red:tempFiles temType="list" fieldName="${mis.field}"  defVal="${channel.list_tem}"/>
		    </c:when>
		     <c:when test="${mis.field=='content_tem'}">
		        <red:tempFiles temType="content" fieldName="${mis.field}"  defVal="${channel.content_tem}"/>
		    </c:when>
		   <c:when test="${mis.is_custom==1}"> 
		      <%
		      String cosvalue="";
		         Map<String,String> map=(Map<String,String>)request.getAttribute("channalattr");
		         if(null!=map)
		         {
		        	 cosvalue=map.get(field);
		         }
		      %>
		   
		         <input type="text" name="${mis.field}"  class="form-control" value="<%=cosvalue%>"  placeholder="${mis.field_dis}" >
		    </c:when>
		    
		      <c:when test="${mis.field=='t_name'}">
		         <select name="${mis.field}">
		           <option value="data1" <%=(null!=result&&result.equals("data1"))?"selected=\"selected\"":"" %> >data1</option>
		           <option value="data2" <%=(null!=result&&result.equals("data2"))?"selected=\"selected\"":"" %>>data2</option>
		           <option value="data3" <%=(null!=result&&result.equals("data3"))?"selected=\"selected\"":"" %>>data3</option>
		           <option value="data4" <%=(null!=result&&result.equals("data4"))?"selected=\"selected\"":"" %>>data4</option>
		          
		         </select>
		    </c:when>
		    <c:otherwise>
		       <input type="text" name="${mis.field}"  class="form-control" value="<%=result%>"  placeholder="${mis.field_dis}" >
		    </c:otherwise>
		</c:choose>

    </c:when>
     <c:when test="${(mis.data_type==2)&&(mis.is_custom==0)}">
        <c:if test="${mis.field=='priority'}">
		   <select name="priority">
		       <%
		          for(int i=10;i>0;i--)
		          {
		        	  request.setAttribute("temi", i);
		        	  %>
		        	  <option value="<%=i%>"  ${channel.priority==temi?"selected=\"selected\"":""}><%=i%></option>
		        	  <%
		          }
		       %>
		       </select>
		    </c:if>
     <c:if test="${mis.field!='priority'}">

       <input type="number" name="${mis.field}"  class="form-control" value="<%=result%>"  placeholder="${mis.field_dis}" value="${mis.field}">
       </c:if>
    </c:when> 
    <c:when test="${mis.data_type==3 &&(mis.is_custom==0)}">
     		    <textarea col=23 rows="5" name="${mis.field}" id="${mis.field}_id" class="control-label" style="width:100%;height:300px;" ><%=result%></textarea>
<script type="text/javascript">
				    	
        KindEditor.ready(function(K) {
                window.editor = K.create('#${mis.field}_id',{			
                	uploadJson : 'admin/uploadpic/imgupload',
    					allowFileManager : false,
				fileManagerJson : '../jsp/file_manager_json.jsp'
                });
        });
</script>
    </c:when>
   <c:when test="${mis.data_type==4 &&(mis.is_custom==0)}">
        
        <input  class="form-control layer-date" name="${mis.field}" value="<%=result%>" placeholder="YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
    </c:when>
   <c:when test="${mis.data_type==5 &&(mis.is_custom==0)}">
       
                     <input  type="hidden"   value="<%=result%>"  name="${mis.field}" id="${mis.field}_field"/>
                     <%
                     if(null!=result&&(!"null".equals(result))&&(!"".equals(result)))
                     {
                     %>
				     <img src="<%=result%>" width="68" height="57" style="cursor: pointer;" id="${mis.field}_id" />
				     <%
                     }else
                     {
                    	 %>
                    	  <img src="img/upload.jpg" width="68" height="57" style="cursor: pointer;" id="${mis.field}_id" />
                    	 <%
                     }
				     %>
                     <!-- <label class="laydate-icon col-sm-1"></label>-->
					<script type="text/javascript">
			        KindEditor.ready(function(K) {
							var editor = K.editor({
								uploadJson : 'admin/uploadpic/imgupload',
								allowFileManager : false
							});
							
							K('#${mis.field}_id').click(function() {
								editor.loadPlugin('image', function() {
									editor.plugin.imageDialog({
										imageUrl : K('#${mis.field}_field').val(),
										clickFn : function(url, title, width, height, border, align) {
											K('#${mis.field}_field').val(url);
											K('#${mis.field}_id').attr("src",url);
											editor.hideDialog();
										}
									});
								});
							});
						});
					</script>
    </c:when>
    <c:when test="${mis.data_type==6 &&(mis.is_custom==0)}">
      
        <div id="pics_${mis.field}">${mis.field_dis}</div>
        <ul id="shows_${mis.field}">
         <c:if test="${mis.field=='pics1'}">
	           <c:forEach items="${pics1}" var="pics">
	              <li>
	              <img src="${pics.path}" width="30" height="30"/>
	              <input type='hidden' name='pics1_ids' value='${pics.id}'/>
	              <select name='pics1_priority'>
	              <%
	                for(int i=10;i>0;i--)
	                {
	                	  request.setAttribute("temii", i);
		        	  %>
		        	  <option value="<%=i%>"  ${pics.priority==temii?"selected=\"selected\"":""}><%=i%></option>
		        	  <%
	                }
	              %>
	              </select>
	              <input type='text' name='pics1_dis' placeholder='图片描述'  value="${pics.picdis}"/>
	              
	              </li>
	            </c:forEach>
           </c:if>
                 <c:if test="${mis.field=='pics2'}">
	           <c:forEach items="${pics2}" var="pics">
	               <li>
	              <img src="${pics.path}" width="30" height="30"/>
	              <input type='hidden' name='pics2_ids' value='${pics.id}'/>
	              <select name='pics2_priority'>
	              <%
	                for(int i=10;i>0;i--)
	                {
	                	  request.setAttribute("temii", i);
		        	  %>
		        	  <option value="<%=i%>"  ${pics.priority==temii?"selected=\"selected\"":""}><%=i%></option>
		        	  <%
	                }
	              %>
	              </select>
	              <input type='text' name='pics2_dis' placeholder='图片描述'  value="${pics.picdis}"/>
	              
	              </li>
	            </c:forEach>
           </c:if>
        </ul>
      
      <script type="text/javascript">

$(function() {
  // 初始化Web Uploader
var uploader${mis.field} = WebUploader.create({
    // 选完文件后，是否自动上传。
    auto: true,
    // swf文件路径
    swf: 'js/plugins/webuploader/Uploader.swf',
    // 文件接收服务端。
    server: 'admin/uploadpic/imguploadpictures',
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick:  '#pics_${mis.field}',
    // 只允许选择图片文件。
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    }
});


uploader${mis.field}.on( 'uploadSuccess', function( file,response ) {
	$("#shows_${mis.field}").append("<li><img src='"+response.url+"' width='30' height='30'/><input type='hidden' name='${mis.field}_ids' value='"+response.upid+"'/><select name='${mis.field}_priority'><c:forEach begin='1' end='10' var='proid'><option value='${proid}'>${proid}</option></c:forEach></select><input type='text' name='${mis.field}_dis' placeholder='图片描述' /></li>");
});

uploader${mis.field}.on( 'uploadError', function( file ) {
	$("#shows_${mis.field}").appendt('上传出错');
});

	});
</script>        


    </c:when>
    <c:otherwise>
       
    </c:otherwise>
</c:choose>
                       
                        
					    </div>
			      </div>
              
				   
</c:forEach>


 <div class="form-group">
    <div class="col-sm-offset-3 col-sm-6">
      <button type="submit" class="btn btn-success">修改栏目</button>
    </div>
  </div>
</form>
                 <!--面板结束-->      
                    </div>
                    
                 </div>
            </div>
        </div>
   </div>
    
    <!-- 全局js -->

    <script src="js/bootstrap.min.js?v=3.3.6"></script>
 <script src="js/plugins/layer/laydate/laydate.js"></script>
 

</body>

</html>