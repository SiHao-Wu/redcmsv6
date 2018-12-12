<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*" %>
<%@taglib uri="/redcms/tags" prefix="cms" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<title>栏目管理</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>栏目管理
                                  	<button type="button" 
 	   	data-placement="right" 
 	   	data-html="true" 
 	   	data-content="<c:forEach items="${models}" var="mo"><a href='admin/channel?action=toadd&mid=${mo.id}' class='btn btn-xs btn-info' style='margin:3px;'>${mo.name}</a><br/></c:forEach>" id="ashow" class="btn btn-success">
		
		增加栏目
		</button>
                        </h5>
               
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                       <!-- 内容开始 -->
                      <table class="table table-striped table-hover table-responsive">
	<tr>
		<th  align='center'>序号</th>
		<th>栏目名称</th>
		<th>模型</th>
		<th>排序</th>
		<th>管理</th>
	</tr>
                        <cms:allChannel/>
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

   <script type="text/javascript">
   $(function(){
	   var show=false;
	   $("#ashow").click(function(){
	   	if(!show)
	   	{
	   		show=true;
		$("#ashow").popover('show');
	   	}else{
	   		show=false;
		$("#ashow").popover('hide');
	   	}
		
	});  
   });
   </script>
</body>
</html>
<%@include file="booter.jsp" %>