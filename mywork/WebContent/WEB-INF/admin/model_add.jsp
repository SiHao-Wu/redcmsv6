<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>RedCMS v1.3 - 模型管理</title>
    <base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"/> 
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
                        <h5>增加模型</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    
                    
                     <div class="ibox-content">
                       
<form class="form-horizontal" action="admin/model" method="post">
<input type="hidden" name="action" value="addSave"/>
  <div class="form-group">
  	   
	    <label  class="col-sm-2 control-label">模型名：</label>
	    <div class="col-sm-4">
	      <input type="text" name="name" class="form-control" id="inputEmail3" placeholder="请输入模型名">
	    </div>
	    
	     <label class="col-sm-2 control-label">路径:</label>
	    <div class="col-sm-4">
	      <input type="text" name="path" class="form-control" id="inputPassword3" placeholder="请输入路径，英文">
	    </div>
  </div>
  
  
  <div class="form-group">
  	    <label class="col-sm-2 control-label">模版:</label>
	    <div class="col-sm-2">
	      <select name="template"  class="form-control">
		       	<option value="-1">默认</option>
	       </select>
	    </div>
	      <div class="checkbox col-sm-2">
        <label>
          <input type="checkbox"  value="1" name="hasContent">是否单页
        </label>
      </div>
	    
        <label  class="col-sm-2 control-label">排序：</label>
	    <div class="col-sm-2 ">
	       <select name="priority"  class="form-control">
	        <%for(int i=10;i>0;i--){ %>
	       	<option value="<%=i%>"><%=i%></option>
	       	<%} %>
	 
	       </select>
	    </div>

	   <div class="checkbox col-sm-2">
        <label>
          <input type="checkbox" value="1" name="is_def">是否默认
        </label>
      </div>
      
  </div>
  <div class="form-group">
         <label  class="col-sm-2 control-label">标题图：</label>
	    <div class="col-sm-4" style="display: inline-block;">
	      <input type="text" name="title_width"  value="130">
	      x
	      <input type="text" name="title_height"  value="130" >
	    </div>
	    
	       <label  class="col-sm-2 control-label">内容图：</label>
	    <div class="col-sm-4" style="display: inline-block;">
	      <input type="text" name="content_width"  value="310">
	      x
	      <input type="text" name="content_height"  value="310" >
	    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-6">
      <button type="submit" class="btn btn-success">增加模型</button>
    </div>
  </div>
</form>
                       
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
