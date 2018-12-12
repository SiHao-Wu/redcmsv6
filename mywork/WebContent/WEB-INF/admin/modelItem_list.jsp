<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<title>模型字段管理</title>
<style>
  body{ font-size:12px;}
</style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                <%--
                Model model=(Model)request.getAttribute("model");
                List<ModelItem> list=(List<ModelItem>)request.getAttribute("modelitemlist");
                if(null!=model&&null!=list)
                {
                --%>
                    <div class="ibox-title">
                        <h5>模型${ischannel==1?"栏目":"内容"}字段管理--${model.name}</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                    
 <form class="form-inline" action="admin/modelItem" method="post">
 <input type="hidden" name="action" value="addSave"/>

   <input type="hidden" value="${ischannel}" name="is_channel"/>
   <input type="hidden"  value="${model.id}" name="model_id" id="modelID"/>
     <input type="hidden"  value="1" name="is_custom"/>
  <div class="form-group">
    <input type="text" name="field" class="form-control" size="3"  placeholder="字段名">
  </div>
  <div class="form-group">
    <input type="text" name="field_dis" class="form-control"   placeholder="字段描述">
  </div>
    <div class="form-group">
     <select name="data_type" class="form-control">
                                      <option value="1" >字符串</option>
							          <option value="2" >数字</option>
							          <option value="3" >文本</option>
							          <option value="4" >日期</option>
							          <option value="5" >图片</option>
							          <option value="6" >图集</option>
							      <!--     <option value="7" >附件集</option> -->
                                </select>
  </div>
    <div class="form-group">
	                              <input type="checkbox" value="1" name="is_display"/>显示
  </div>
    <div class="form-group">
    <select name="priority" class="form-control">
                                
                                   <%for(int i=10;i>0;i--)
                                	   {%>
                                    <option value="<%=i%>"><c:out value="<%=i%>"/></option>
                                    <%
                                	   }
                                    %>
                             
                               
                                </select>
  </div>
  <div  class="form-group">
   <input type="checkbox" value="1" name="is_required"/>必须

  </div>
    <div  class="form-group">
     <input type="checkbox" value="1" name="is_single"/>独行
  </div>
  
  
   <div  class="form-group">
   <input type="text" class="form-control" name="txt_size" size="3" placeholder="长度"/>
   </div>
    <div  class="form-group">
    <input type="text" class="form-control" name="def_value" size="3" placeholder="默认值"/>
    </div>
  
  <button type="submit" class="btn btn-primary">增加字段</button>
</form>

                    
                       <!-- 内容开始 -->
                       <table class="table table-striped table-hover table-responsive">
                         <tr>
                             <th colspan="2">序号</th>
                             <th>字段名</th>
                             <th>描述</th>
                             <th>类型</th>
                             <th>启用</th>
                             <th>顺序</th>
                             <th>必须</th>
                             <th>独行</th>
                             <th>长度</th>
                             <th>默认值</th>
                             <th>操作</th>
                         </tr>
                         <c:forEach items="${showlist}" var="mi" varStatus="mistat">

                         <form action="admin/modelItem" method="post">
                          <input type="hidden" name="action" value="update"/>
                         <tr>
                             <td>
                             <input type="hidden" value="${ischannel}" name="is_channel"/>
                             <c:if test="${mi.is_display==1}">
                               <input type="checkbox" value="${mi.id}" class="models_id"/></td>
                             </c:if>
                             <td><c:out value="${mista.count}"></c:out>
                             <input type="hidden" value="${mi.id}" name="id"/>
                              <input type="hidden"  value="${mi.model_id}" name="model_id"/>
                             </td>
                             <td>
                             ${mi.field}
                             </td>
                             <td><input type="text" name="field_dis" class="form-control" value="${mi.field_dis}"/></td>
                              <td>
                             
                              
                                <select name="data_type" class="form-control">
                                      <option value="1" ${mi.data_type==1?"selected=\"selected\"":""}>字符串</option>
							          <option value="2" ${mi.data_type==2?"selected=\"selected\"":""}>数字</option>
							          <option value="3" ${mi.data_type==3?"selected=\"selected\"":""}>文本</option>
							          <option value="4" ${mi.data_type==4?"selected=\"selected\"":""}>日期</option>
							          <option value="5" ${mi.data_type==5?"selected=\"selected\"":""}>图片</option>
							          <option value="6" ${mi.data_type==6?"selected=\"selected\"":""}>图集</option>
                                </select>
                                
                              </td>
                              <td>
                               <c:if test="${mi.is_custom<2}">
	                                                       
	                              <input type="checkbox"  value="1" name="is_display"  ${mi.is_display==1?"checked='checked'":""}/>
                             </c:if>
                             
                            <%--   <input type="checkbox"   name="isDisplay" value="1"  ${mi.isDisplay==1?"checked=\"checked\"":""}/> --%>
                           
                              </td>
                              <td>
                                <select name="priority" class="form-control">
                              
                                   <%
                                     for(int i=10;i>0;i--)
                                     {
                                    	 
                                       request.setAttribute("tem", i);
                                   %>
                                    <option ${mi.priority==tem?"selected='selected'":"" } value="<%=i%>"><%=i%></option>
                                    <%
                                     }
                                    %>
                            
                               
                                </select>
                              </td>
                              <td>
                           <%--     <select name="isRequired"  class="form-control">
                              <option value="1" ${mi.isRequired==1?"selected=\"selected\"":""}>必须</option>
                               <option value="0" ${mi.isRequired==0?"selected=\"selected\"":""}>不必须</option>
                              </select> --%>
               
                              
                         <input type="checkbox"   name="is_required" value="1" ${mi.is_required==1?"checked='checked'":"" }/>
                             
                              </td>
                               <td>
                                <input type="checkbox"   name="is_single" value="1" ${mi.is_single==1?"checked=\"checked\"":"" }/>
                                </td>
                                <td>
                               <input type="text" class="form-control" name="txt_size" size="3" value="${mi.txt_size }"/>
                               
                                <%--  <select name="isSingle"  class="form-control">
                              <option value="1" ${mi.isSingle==1?"selected=\"selected\"":""}>独行</option>
                               <option value="0" ${mi.isSingle==0?"selected=\"selected\"":""}>多列</option>
                              </select> --%>
                              </td>
                                <td><input type="text" class="form-control" name="def_value" size="3" value="${mi.def_value }"/></td>
                                <td>  <input type="submit"   value="更新" class="btn  ${mi.is_display==1?"btn-success":"btn-default"}"/></td>
                         </tr>
                        
                         </form>
                     </c:forEach>
                         <tr>
                           <td colspan="11">
                           <input type="hidden" value="${model.id}" id="model_id"/>
                            <input type="button"  id="hidall"  value="隐藏选中字段 "  class="btn  btn-info"/>
                           </td>
                         </tr>
                       </table>
                       <!-- 内容结束 -->
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
 <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>

    <script type="text/javascript" src="js/sweetalert.min.js"></script>
   <script type="text/javascript">
     $(function(){
    	 $("#hidall").click(function(){
    		 
    		 var ids="&modelId="+$("#modelID").val()+"&ischannel=${ischannel}&";	
        	  $(".models_id:checked").each(function(){
        		 ids+="miid="+$(this).val()+"&";
        	 }); 
        	 
        	window.location="admin/modelItem?action=updateBatchId"+ids;
    	 });
        
     });
     
   </script>
   
   <%
     String msg=(String)request.getAttribute("msg");
     String err=(String)request.getAttribute("err");
     if(null!=msg)
     {
    	 out.println("<script type=\"text/javascript\" src=\"js/sweetalert.min.js\"></script>");
    	 out.println("<script type=\"text/javascript\">");
    	 out.println("swal('"+msg+"!','','success');");
    	out.println("</script>");
     }else if(null!=err)
     {
    	 out.println("<script type=\"text/javascript\" src=\"js/sweetalert.min.js\"></script>");
    	 out.println("<script type=\"text/javascript\">");
    	 out.println("swal('"+err+"!','','error');");
    	 out.println("</script>");
     }
   %>
</body>
</html>
