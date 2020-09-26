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
<title>Accept OTP</title>
</head>
<body>
<div class="container">
	<br>
	<br>
    <div class="row">
    <div class="col-md-4 col-xs-0">								<!-- COL 1 --> </div>
        <div class="col-md-4 col-xs-12">
           
            <p style="color: ${param.color};">${param.message} </p>
           		 <div class="panel-body">
                

       
      
                <form class="form-signin" action="Accept_OTP" method="post">
                 
                 <div class="form-group input-group">
                <div class="input-group-addon">
                <span class="glyphicon glyphicon-comment"></span>
                </div>
               
               <input type="text" name="Entered_OTP" class="form-control" placeholder=" Enter OTP " required  maxlength="6" style="width: 120px;">
               
                </div>
                
                <button class="btn icon-btn btn-group btn-group-xs btn-info " type="submit">
                   Submit</button>
                 
                </form>
                
                </div>
               
               <form class="form-signin" action="Resend_OTP" id='form-id' method="post">
                	<a onclick="document.getElementById('form-id').submit();" href="#" text-center new-account">Resend OTP </a><span class="clearfix"></span>
               </form>
                </div>
                </div>
                </div>
       
                 
            
                
</body>




</html>