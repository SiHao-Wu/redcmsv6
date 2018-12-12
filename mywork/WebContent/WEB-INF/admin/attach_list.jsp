<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*,com.redcms.db.*" %>
<%@taglib uri="/redcms/tags" prefix="cms" %>
<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<title>附件管理</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>附件管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <%
                    PageDiv<Attachs> pd=(PageDiv<Attachs>)request.getAttribute("pd");
                    %>
                    <div class="ibox-content" style="font-size:12px;">
                    
                    <form action="admin/attach" method="post">
                    <input type="hidden" name="action" value="del"/>
                    <div class="row">
                      <div class="col-sm-3"> 
                      
                      <button type="button" class="btn btn-info" id="selectall">全选</button>
                      <button type="submit" class="btn btn-danger pull-right">删除</button></div>
                      <div class="col-sm-9">
                      
                           
                             
                            <div class="btn-group">
                                <a href="admin/attach?pageNo=<%=pd.getPageNo()-1==0?1:pd.getPageNo()-1%>&cid=${cid}" class="btn btn-white"><i class="fa fa-chevron-left"></i>
                                </a>
                                <%
                                 for(int i=pd.getStart();i<=pd.getEnd();i++)
                                 {
                                %>
                                <a href="admin/attach?pageNo=<%=i%>&cid=${cid}" class="btn btn-white"><%=i%></a>
                                <%} %>
                            
                                <a href="admin/attach?pageNo=<%=pd.getPageNo()+1>=pd.getTotalPage()?pd.getTotalPage():pd.getPageNo()+1%>&cid=${cid}"  class="btn btn-white"><i class="fa fa-chevron-right"></i>
                                </a> 
                        </div>
                         
                           <span>当前<span style="color:red;"><%=pd.getPageNo()%></span>/<%=pd.getTotalPage() %>页&nbsp;&nbsp总共:<b><%=pd.getTotalCount()%></b>条</span>
                            
                      </div>
                    </div>
                    <div class="row">
                     <div class="col-sm-12">
                    
                       <!-- 内容开始 -->
                       <%
                       
                          
                         if(null!=pd&&null!=pd.getList())
                         for(Attachs at:pd.getList())
                         {
                       %>
                    <div class="file-box">
                            <div class="file">
                              
                                    <span class="corner"></span>
                                     <%
                                        String oldname=at.getPath().toLowerCase();
                                        if(oldname.endsWith(".jpg")||oldname.endsWith(".png")||oldname.endsWith(".gif"))
                                        {
                                        	%>
                                        	<div class="image">
                                        <img alt="image" class="img-responsive" src="<%=at.getPath()%>" width="200" height="100">
                                    </div>
                                        	<%
                                        }else
                                        {
                                        	%>
                                   <div class="icon">
                                        <i class="fa fa-file"></i>
                                    </div>
                                        	<%
                                        }
                                     %>
                                   
                                    
                                    <div class="file-name">
                                        <%=at.getOrgname() %>
                                        <br/>
                                        <small>
                                        
                                        </small>
                                        <small><input type="checkbox" name="ids" class="i-checks" value="<%=at.getId()%>"/></small>
                                    </div>
                             
                            </div>

                        </div>
                        <%
                         }
                        %>
                    
                       
                    </div>
               </div>
               </form>
                       <!-- 内容结束 -->
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
</body>
</html>
<%@include file="booter.jsp" %>
<script type="text/javascript">
   $(function(){
     $("#selectall").click(function(){
    	 
    	
        if($(this).text()=="全选")
    	   {
    	     $("input[name='ids']").prop("checked",true);
    	     $(this).html("取消");
    	   }else
    		   {
    		   $("input[name='ids']").prop("checked",false);
    		   $(this).html("全选");
    		   } 
     });
     
     });
 </script>