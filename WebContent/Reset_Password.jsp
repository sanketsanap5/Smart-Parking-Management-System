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

<title>Reset Password</title>
</head>
<body>

<div class="container">
	<br>
	<br>
    <div class="row">
    <div class="col-md-4 col-xs-0">								<!-- COL 1 --> </div>
        <div class="col-md-4 col-xs-12">
           

<div class="panel-body">
                 <form class="form-horizontal" action="Reset_Password" method="post">
                 <label for="New_Password"> Enter New Password</label>
                 <div class="form-group">
                 <div class="col-md-4 inputGroupContainer">
                 <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-lock"></i>
                </span>
                <input type="password" name="New_Password" class="form-control" placeholder="New Password" required autofocus style="width: 150px;">
                <br>
                </div>
                </div>
                </div>
                <br/>
                <button class="btn icon-btn btn-group btn-group-xs btn-info " type="submit" >
                   Submit</button>
                  
                </form>
 </div>
                 
</div>

</div>
</div>

</body>
</html>