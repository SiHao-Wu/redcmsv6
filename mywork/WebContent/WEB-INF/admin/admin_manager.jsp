<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*" %>

<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<title>管理员管理</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>管理员管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                       <!-- 内容开始 -->
                   
<form class="form-inline" method="post" action="admin/admin">
   <input type="hidden" name="action" value="saveAdd"/>
  <div class="form-group">
  <!--   <label for="exampleInputEmail2">Email</label> -->
    <input type="email" name="uname" class="form-control" id="exampleInputEmail2" placeholder="请输入用户名">
  </div>
   <div class="form-group">
    <!-- <label for="exampleInputName2">Name</label> -->
    <input type="password" name="upwd" class="form-control" id="exampleInputName2" placeholder="请输入密码">
  </div>
  <div class="form-group">
    <select class="form-control" name="upur">
      <option value="100000">管理员</option>
      <option value="010000">普通管理员</option>
       <option value="0010000">一般</option>
    </select>
  </div>
  <button type="submit" class="btn btn-info">增加</button>
</form>
                    
<table class="table table-striped">
  <tr><th>#</th><th>用户名</th><th>密码</th><th>级别</th><th>管理</th></tr>
  <%
  int index=1;
   List<Admin> list=(List<Admin>)request.getAttribute("list");
    		for(Admin a:list)
    		{
  %>
 <form  method="post" action="admin/admin">
 <input type="hidden" name="action" value="update"/>
  <tr>
  <td>
     <%=index++ %>
  </td>
    <td>
    <input type="hidden" name="id" value="<%=a.getId()%>"/>
      <input type="hidden" name="uname"  value="<%=a.getUname()%>"/>
      <%=a.getUname() %>
    </td>
     <td>
     <input type="hidden" name="upwd"  value="<%=a.getUpwd()%>"/>
     
     <input type="text" name="newpwd" class="form-control" placeholder="输入新密码"/>
     </td>
      <td>
         <select class="form-control" name="upur">
			          <option value="100000" <%=a.getUpur().startsWith("100")?"selected=\"selected\"":"" %>>管理员</option>
			      <option value="010000" <%=a.getUpur().startsWith("010")?"selected=\"selected\"":"" %>>普通管理员</option>
			       <option value="0010000" <%=a.getUpur().startsWith("001")?"selected=\"selected\"":"" %>>一般</option>
         </select>
      </td>
      <td>
         <button type="submit"  class="btn btn-info" >修改</button>
         <a  class="btn btn-danger" href="admin/admin?action=del&id=<%=a.getId()%>">删除</a>
      </td>
     
  </tr>
  </form>
  <%
    		}
  %>
  
</table>
                       <!-- 内容结束 -->
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
</body>
</html>
<%@include file="booter.jsp" %>