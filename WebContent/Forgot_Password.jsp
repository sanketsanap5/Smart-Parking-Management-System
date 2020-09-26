<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>

<p style="color: red;">${param.message} </p>
 <div class="panel-body">
                
                <form class="form-signin" action="Forgot_Password" method="post">
                <div class="input-group">
                <div class="input-group-addon">
                <span class="glyphicon glyphicon-envelope"></span>
                </div>
                <input type="text" name="Email" class="form-control" placeholder="Email" required autofocus>
               
               </div>
                <br>
                 <div class="input-group">
                <div class="input-group-addon">
                <span class="glyphicon glyphicon-phone"></span>
                </div>
                <input type="text" name="Mobile_No" class="form-control" placeholder="Mobile No" required>
                
                </div>
                <br>
                <center>  <button class="btn icon-btn btn-group btn-group-xs btn-info " type="submit">
                   Submit</button>
                   </center>
                </form>
  </div>

</body>
</html>