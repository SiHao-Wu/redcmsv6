<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

   <script> if(window.top !== window.self){ window.top.location = window.location;} </script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h1 style="font-size:38px;letter-space:30px;">RedCMS v1.3</h1>
            </div>
            <h3>欢迎使用 RedCMS v1.3</h3>

            <form class="m-t" role="form" action="admin/login" method="post">
                <input type="hidden" name="action" value="checkLogin"/>
           
           
                <div class="form-group">
                    <input type="email" name="uname" class="form-control" placeholder="用户名" required="" value="admin@qq.com">
                </div>
                <div class="form-group">
                    <input type="password" name="upwd" class="form-control" placeholder="密码" required="">
                </div>
                <div  class="form-group">
                  <lable><img src="randimg" onclick="this.src='randimg?m='+Math.random();" style="cursor:pointer;"/></lable>
                  <input type="text" placeholder="输入验证码" style="width:160px;float: left;" name="rand"  class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


                <!-- <p class="text-muted text-center"> <a href="#"><small>忘记密码了？</small></a> | <a href="#">注册一个新账号</a>
                </p> -->

            </form>
        </div>
    </div>

    <!-- 全局js -->
  <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/sweetalert.min.js"></script>
  <%
     String msg=(String)request.getAttribute("msg");
     String err=(String)request.getAttribute("err");
     if(null!=msg)
     {
    	 out.println(" <script type=\"text/javascript\">swal('"+msg+"!','','success'); </script>");
    	
     }else if(null!=err)
     {
    	 out.println(" <script type=\"text/javascript\">swal('"+err+"!','','error'); </script>");
     }
   %>

</body>

</html>
