<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.redcms.beans.*,java.util.*" %>   
<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"/> 
    <title>RedCMS v1.3 - 模型管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    
</head>

<body class="gray-bg" style="font-family:微软雅黑;">
   
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>模型列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    
                    
                     <div class="ibox-content">
                       <div>
                       	 <a href="admin/model?action=add" class="btn btn-success"> 增加模型</a>
                       </div>
      <table class="table table-striped table-hover" align="center">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>模型名</th>
                                    <th>路径</th>
                                    <th>是否默认</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   List<Model> list=(List<Model>)request.getAttribute("list");
                                   if(null!=list)
                                   {
                                	   for(int i=0;i<list.size();i++)
                                	   {
                                		   Model m=list.get(i);
                                		   %>
                               <tr>
                                    <td><%=(i+1)%></td>
                                    <td><%=m.getName() %></td>
                                    <td><%=m.getPath() %></td>
                                    <td><%=m.getIs_def()==1?"默认":"无" %></td>
                                    <td>
                                       <a href="admin/model?action=edit&id=<%=m.getId()%>" class="btn btn-primary">修改</a>
                                       <a href="admin/model?action=delModel&id=<%=m.getId()%>" class="btn btn-danger">删除</a>
                                       <a href="admin/modelItem?action=channelList&ischannel=0&id=<%=m.getId()%>" class="btn btn-success">内容字段管理</a>
                                       <a href="admin/modelItem?action=channelList&ischannel=1&id=<%=m.getId()%>" class="btn btn-info">栏目字段管理</a>
                                    </td>
                                </tr>
                                		   <%
                                	   }
                                   }
                                %>
                          
                            </tbody>
                        </table>
                      
                       
                    </div>
                    
                 </div>
            </div>
        </div>
   </div>
    
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
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
