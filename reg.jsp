<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>Aggregate key</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Perfect Match Register Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- css files -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/jquery-ui.css" />
<!-- //css files -->
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Tangerine:400,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=GFS+Neohellenic:400,400i,700,700i&amp;subset=greek" rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1> Register Form</h1>
		</div>
		<!--//header-->
		<!--main-->
	<div class="agileits-register">
		<form action="regis" method="post">
				
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Name:</span>
					<input type="text" name="name" placeholder=" " required=""/>
					<div class="clear"> </div>
				</div>
                    <div class="w3_modal_body_grid">
					<span>Email:</span>
					<input type="email" name="email" placeholder="" required=""/>
					<div class="clear"> </div>
				</div>
                    <div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Password:</span>
					<input type="password" name="Pass" placeholder="" required=""/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Phone Number</span>
					<input type="text" name="phone" placeholder="" required=""/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid">
					<span>Gender:</span>
                                        <select id="w3_country1" name="gender" onchange="change_country(this.value)" class="frm-field required"> 
						<option value="#">------------- Select Gender  ----------</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>    
						 						
					</select>
					<div class="clear"> </div>
				</div>
				
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Date Of Birth:</span>
                                        <input class="date" id="datepicker" required="" name="dob" type="text" value="mm/dd/yyyy" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '2/08/2013';}" required="" />
					<div class="clear"> </div>
				</div>
                    <div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>State:</span>
					<input type="text" name="state" placeholder="" required=""/>
					<div class="clear"> </div>
				</div>
                    <div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>country:</span>
					<input type="text" name="country" placeholder="" required=""/>
					<div class="clear"> </div>
				</div>
                    <div class="w3_modal_body_grid">
					<span>Role:</span>
                                        <select id="w3_country1" name="role" onchange="change_country(this.value)" class="frm-field required"> 
						<option value="#">------------- Select Role ----------</option>
						<option value="Data owner">Data owner</option>
						<option value="User">Data user</option>    
						 						
					</select>
					<div class="clear"> </div>
				</div>
				
				
				
				
				<input type="submit" value="Register Here" />
				<div class="clear"></div>
			</form>
		</div>
		<div class="banner-left">
			<img src="images/1.png" alt=""> 
		</div>
		
	<div class="clear"></div>
		<!--//main-->
		<!--footer-->
		
		<!--//footer-->
	</div>
	
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- Calendar -->
<script src="js/jquery-ui.js"></script>
	<script>
	  $(function() {
		$( "#datepicker" ).datepicker();
	 });
	</script>
<!-- //Calendar -->		

</body>
</html>