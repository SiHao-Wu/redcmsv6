<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.redcms.beans.*" %>
<%@taglib uri="/redcms/tags" prefix="cms" %>
<!DOCTYPE html>
<head>
<%@include file="header.jsp" %>
<link href="css/plugins/codemirror/codemirror.css" rel="stylesheet">
<link href="css/plugins/codemirror/ambiance.css" rel="stylesheet">
<title>增加模栏目</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
      
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>增加栏目</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                       <!-- 内容开始 -->
                        <div class="row">
           <div class="col-sm-12">
           <form action="admin/template" method="post" class="form-inline">
                                   <div class="form-group">
                                      <input type="hidden" name="action" value="add"/>
                                        <input type="text" name="newname" placeholder="请输入文件名" class="form-control">
                                  
                                  <button class="btn btn-sm btn-primary" type="submit">新建 </button>
                                    </div>
                                    
                                        
                                       
                                    
                            </form>
       </div>
     </div>
                       
                    <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                           
                            <h5>模版文件列表：</h5>
                            <ul class="folder-list" style="padding: 0">
                            
                            <%
                            String []files=(String[])request.getAttribute("allfile");
                            if(null!=files&&files.length>0)
                            {
                            	for(String f:files)
                            	{
                            %>
                                <li>
                                <a href="admin/template?action=edit&fname=<%=f%>">
                                <i class="glyphicon glyphicon-file"></i> 
                                <%=f %>
                                </a>
                                </li>
                                <%
                            	}
                                %>
                              
                                <%
                            }
                                %>
                            </ul>
                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="row">
                    <div class="col-sm-12">
<!-- coder start -->
                    <div class="ibox ">
                    <div class="ibox-title">
                        <h5>选择要修改的文件</h5>
                    </div>
                    <div class="ibox-content">

<form action="admin/template" method="post">
<input type="hidden" name="action" value="editSave"/>
<input type="hidden" name="fname" value="<%=request.getAttribute("fname")%>"/>
<textarea id="code1" name="txt"><%=request.getAttribute("jspcont")%></textarea>
<button type="submit" class="btn btn-info">修改模版文件</button>
</form>
 <!-- coder end -->
                    </div>
                </div>
            </div>
        </div>

                       <!-- 内容结束 -->
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
</body>
</html>
<%@include file="booter.jsp" %>
<!-- CodeMirror -->
    <script src="js/plugins/codemirror/codemirror.js"></script>
    <script src="js/plugins/codemirror/mode/javascript/javascript.js"></script>

    <!-- 自定义js -->
  

    <script>
        $(document).ready(function () {

            var editor_one = CodeMirror.fromTextArea(document.getElementById("code1"), {
                lineNumbers: true,
                matchBrackets: true,
                styleActiveLine: true,
                theme: "ambiance"
            });

            

        });
    </script>