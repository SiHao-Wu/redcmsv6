<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*" %>
<%@taglib uri="/redcms/tags" prefix="cms" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>内容管理列表</title>
<%@include file="header.jsp" %>
    <style type="text/css">
    	#treemenu ul{ list-style:none; padding: 0;}
    	#treemenu .parent_menu>span{ font-family: "微软雅黑"; color: #333; font-weight: bold; line-height: 35px;cursor: pointer;}
  
    	#treemenu .sub_menu { color: #333; line-height: 32px; padding-left: 22px;}
    	#treemenu .sub_menu a{ color: #333;}
    </style>


	</head>
	<body>
	<div style="height: 30px;"></div>
		<div class="container" >
			<div class="row">
				 <div class="col-sm-2" >
				 	 <!--left start-->
				 	 <cms:channelTree/>
 
 	     <!--left end-->
				 </div>
				 <div class="col-sm-10"  style="border-left:1px #ccc solid;">
				    <!--right start-->
				    <div class="row">
				       <div style="padding-left: 20px">
				        <c:if test="${empty channel}">
				          <span>先选择要发布的栏目</span>
				        </c:if>
				        <c:if test="${not (empty channel)}">
				        ${channel.name}
				         <a href="admin/article?action=toadd&channelId=${channel.id}" class="btn btn-info" style="margin: 10px 20px;">＋添加新文章</a>
				        </c:if>
				    	</div>
				    </div>
				    <table class="table table-hover table-striped table-condensed table-responsive">
				    	<tr><th><input type="checkbox" id="allselect"/></th><th  style="text-align: center;">ID</th><th>标题</th><th>栏目</th><th>时间</th><th>管理</th></tr>
				    	
				    	<c:forEach items="${page.records}" var="data" varStatus="datastat">
				    	<tr>
				    	<td>
				    	  <input type="checkbox" value="${data.id}_${data.tName}" name="ids"/>
				    	 
				    	</td>
				    	<td>${datastat.count}</td>
				    	<td><a href="web/articleshow?dataId=${data.id}&tName=${data.tName}">${data.title}</a></td>
				    	<td>${data.channelName}</td>
				    	<td><fmt:formatDate type="both" value="${data.createtime}" /></td>
				    		<td>
				    			<a href="admin/data/toedit?dataId=${data.id}&tName=${data.tName}" class="btn btn-info btn-sm">
				    				<i class="fa fa-edit"></i>
				    			</a>
				    			<a href="admin/data/delete?dataId=${data.id}&tName=${data.tName}" class="btn btn-danger btn-sm">
				    				<i class="fa fa-close"></i>
				    			</a>
				    		</td>
				    	</tr>
				    	</c:forEach>
				    <!-- 	
				    	<tr><td>1</td><td>黄金接连下跌难道又等大妈来托盘</td><td>新闻国内</td>
				    		<td>2016-10-11 13:55:46</td>
				    		<td>
				    			<a href="#" class="btn btn-info btn-sm">
				    				<i class="fa fa-edit"></i>
				    			</a>
				    			<a href="#" class="btn btn-danger btn-sm">
				    				<i class="fa fa-close"></i>
				    			</a>
				    		</td>
				    	</tr>
				    	-->
				    </table>
				      <div class="text-center">
                            <div class="btn-group">
                                <a href="admin/data/list?channelId=${channelId}&pageNo=${(page.current-1)<1?1:(page.current-1)}" class="btn btn-white" type="button"><i class="fa fa-chevron-left"></i>
                                </a>
                                <c:forEach var="it" begin="${(page.current-4)<1?1:(page.current-4)}" end="${(page.current+4)>page.pages?page.pages:(page.current+4)}">
                                   <a href="admin/data/list?channelId=${channelId}&pageNo=${it}"  class="btn btn-white">${it}</a>
                                </c:forEach>
                             <!--    
                                <button class="btn btn-white">1</button>
                                <button class="btn btn-white  active">2</button>
                                <button class="btn btn-white">3</button>
                                <button class="btn btn-white">4</button>
                                <button class="btn btn-white">5</button>
                                <button class="btn btn-white">6</button>
                                <button class="btn btn-white">7</button> -->
                                <a href="admin/data/list?channelId=${channelId}&pageNo=${(page.current+1)>page.pages?page.pages:(page.current+1)}" class="btn btn-white" type="button"><i class="fa fa-chevron-right"></i>
                                </a>
                                <button class="btn btn-white">第${page.current}/${page.pages}页,共${page.total}条</button>
                            </div>
                            <div style="line-height: 36px; text-align: left;">
                              <a href="#" class="btn btn-success">生成静态文件</a>&nbsp;&nbsp;<button  id="delall" class="btn btn-danger">批量删除</button>
                            </div>
                        </div>
				    <!--right end-->
				 </div>
			</div>
		</div>
		 <!-- 全局js -->
    <%@include file="booter.jsp" %>
    <script type="text/javascript">
  
    
    
    	$(function(){
    		
    		$(".parent_menu:has('ul')>span").click(function(){
    			var ultart=$(this).parent().find("ul");
    			var isshow=ultart.css("display");
    			if(isshow=="block")
    			{
    				$(this).find("i").attr("class","fa fa-folder");
    				ultart.slideUp("slow");
    			}else
    			{
    				$(this).find("i").attr("class","fa fa-folder-open");
    				ultart.slideDown("slow");
    			} 
    			
    			
    		});
    		
/*     		 $("#allselect").click(function(){
    	    	 
    		       if($(this).prop("checked"))
    		    	   {
    		    	     $("input[name='ids']").prop("checked",true);
    		    	   }else
    		    		   {
    		    		   $("input[name='ids']").prop("checked",false);
    		    		   }
    		     }); */
   /*  		 
    		 $("#delall").click(function(){

    			  var temp = document.createElement("form");
    			    temp.action = "admin/data/deleteBatch";
    			    temp.method = "post";
    			    temp.style.display = "none";
    			    var opt = document.createElement("input");
    		        opt.name = "channelId";
    		        opt.value =${channelId};
    		 
    		        temp.appendChild(opt);
    	    	
    	    	 var ids="";
    	    	
    	    	 $("input[name='ids']").each(function () {
    	    		 if($(this).prop("checked"))
    	    			 {

    	    			 var topt = document.createElement("input");
    	    		       topt.name = "dataId";
    	    		        topt.value =$(this).val();
    	    		        // alert(opt.name)
    	    		        temp.appendChild(topt);
    	    			 }
    	         });
    	    	 document.body.appendChild(temp);
    	 	    temp.submit();
    	    	 return temp;
 
	    
    	     }); */
    		 
    		
    	});
    	
    	
    	  function post(URL, PARAMS)
    		{
    		    var temp = document.createElement("form");
    		    temp.action = URL;
    		    temp.method = "post";
    		    temp.style.display = "none";
    		    for (var x in PARAMS)
    		    {
    		        var opt = document.createElement("input");
    		        opt.name = x;
    		        opt.value = PARAMS[x];
    		        // alert(opt.name)
    		        temp.appendChild(opt);
    		    }
    		    document.body.appendChild(temp);
    		    temp.submit();
    		    return temp;
    		}
    </script>
   
	</body>
</html>
