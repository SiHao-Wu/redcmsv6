<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"; %>
<!DOCTYPE html>
<html>

<head>
 <base href="<%=path%>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>RedCMS - 主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
   
</head>

<body style="font-family:微软雅黑;" class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                  
                     <li >
                        <a class="navbar-minimalize J_menuItem">
                            <i class="glyphicon glyphicon-home" style="font-size:24px;color:#FFF;"></i>
                            <span class="nav-label" style="font-size:24px;color:#FFF;">RedCMS</span>
                        </a>
                        
                    </li>
                         <li>
                        <a class="J_menuItem" href="admin/article/createIndexHtml">
                            <i class="glyphicon glyphicon-file"></i>
                            <span class="nav-label">生成首页</span>
                        </a>
                    </li>
               <!--      <li>
                        <a class="J_menuItem" href="admin/foward?page=admin/welcome.jsp">
                            <i class="glyphicon glyphicon-list-alt"></i>
                            <span class="nav-label">后台主页</span>
                        </a>
                        
                    </li> -->
                     <!-- 文章管理 -->
                     <li>
                        <a class="J_menuItem" href="admin/article">
                            <i class="fa fa-desktop"></i>
                            <span class="nav-label">文章管理</span>
                        </a>
                    </li>
                      <!-- 文章管理 -->
                    
                     <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-tasks"></i>
                            <span class="nav-label">栏目管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="admin/channel">增加栏目</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/channel/channelList">管理栏目</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="admin/channel/pubAllchannel?pageSize=20">生成静态</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#">
                            <i class="fa fa-user"></i>
                            <span class="nav-label">系统管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="admin/model">模型管理</a>
                            </li>
                              <li>
                                <a class="J_menuItem" href="admin/template">模版管理</a>
                            </li>
                              <li>
                                <a class="J_menuItem" href="admin/attach">附件管理</a>
                            </li>
                              <li>
                                <a class="J_menuItem" href="admin/druid">数据库监控</a>
                            </li>
                            
                            <li>
                                <a class="J_menuItem" href="admin/admin">用户管理</a>
                            </li>
                  
                        </ul>
                    </li>
                    <li class="line dk"></li>
                                   
                    <li>
                        <a class="J_menuItem" href="admin/login?action=logout">
                            <i class="glyphicon glyphicon-off"></i>
                            <span class="nav-label">注销</span>
                        </a>
                        
                    </li>
             
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1" >
        
         <!--    <div class="row border-bottom">
                <nav  class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                   
                    <h3 style="text-align: center;line-height: 30px;">
                    <span class="float:left;">Welcome,admin</span> 
                    <a href=""><span style="float:right;" class="glyphicon glyphicon-off">注销</span></a>
                    </h3>
                </nav>
            </div> -->
           <!-- <iframe id="J_iframe" width="100%" height="100%" src="admin/foward?page=admin/welcome.html" frameborder="0" seamless></iframe>  -->
            <div class="row J_mainContent"  id="content-main">
                 <iframe id="J_iframe" name="J_iframe" width="100%" height="100%" src="admin/foward?page=admin/welcome.jsp" frameborder="0" seamless></iframe> 
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

<!-- end -->
        <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <!-- <i class="fa fa-laptop modal-icon"></i> -->
                        <h6 class="modal-title">选择要发布文章的栏目</h6>
                        
                    </div>
                    <div class="modal-body" style="margin:0 10px;">
                        <p>
                        <form action="admin/article/add" id="modform" target="J_iframe" method="post">
                                <div class="form-group">
                                   <cms:channelselect isMultiple="true"/>
                                 </div>
                         </form>
                          </p>
                          
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" id="addarticle" class="btn btn-primary">发布</button>
                    </div>
                </div>
            </div>
        </div>


    <!-- 全局js -->
  <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
 <script src="js/hAdmin.js?v=4.1.0"></script>
   <script type="text/javascript" src="js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>
  <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
   

    <!-- Bootstrap-Treeview plugin javascript -->
    <script src="js/plugins/treeview/bootstrap-treeview.js"></script>
    <script src="js/demo/treeview-demo.js"></script>

     <script type="text/javascript">
        $(function(){
        	$("#addarticle").click(function(){
        		$("#modform").submit();
        		$('#myModal').modal('hide');
        		
        	});
        });
     </script>
</body>

</html>
