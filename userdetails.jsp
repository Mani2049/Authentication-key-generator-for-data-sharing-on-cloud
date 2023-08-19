<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Aggregate key </title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">
                 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="css/style6.css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	</head>


	<body>
            
                  <%
            if (request.getParameter("msg23") != null) {
        %>
        <script>alert('Activation successfully');</script>
        <%
            }
            if (request.getParameter("msgg") != null) {
        %>
        <script>alert('File Upload Failed');</script>
        <%
            }
        %>
		
		<div id="site-content">
			<header class="site-header">
				<div class="top-header">
					<div class="container">
						<a href="index.html" id="branding">
							<img src="images/logo.png" alt="Company Name" class="logo">
							<div class="logo-text">
								<h1 class="site-title">Provably Secure Key-Aggregate Cryptosystems
with Broadcast Aggregate Keys for Online Data Sharing on the Cloud</h1>
								<small class="description"></small>
							</div>
						</a> <!-- #branding -->
					
						<div class="right-section pull-right">
							<a href="#" class="phone"><img src="images/icon-phone.png" class="icon"></a>
					
							<form action="#" class="search-form">
								<input type="text" placeholder="Search...">
								<button type="submit"><img src="images/icon-search.png" alt=""></button>
							</form>
						</div>
					</div> <!-- .container -->
				</div> <!-- .top-header -->

				
				<div class="bottom-header">
					<div class="container">
						<div class="main-navigation">
							<button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
							<ul class="menu">
                                                               <li class="menu-item"><a href="cloudhomepage.jsp">cloud Home</a></li>
                                                                <li class="menu-item"><a href="userdetails.jsp">User details</a></li>
								<li class="menu-item"><a href="file_share.jsp">share file</a></li>
                                                                <li class="menu-item"><a href="index.html">Log out</a></li>
								
							</ul> <!-- .menu -->
						</div> <!-- .main-navigation -->
						
						<div class="social-links">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-google-plus"></i></a>
							<a href="#"><i class="fa fa-pinterest"></i></a>
						</div>
						
						<div class="mobile-navigation"></div>
					</div>
				</div>
				
			</header> <!-- .site-header -->

			<div class="hero hero-slider">
				<ul class="slides">
					<li data-bg-image="dummy/12.jpg">
						<div class="container">
							
						</div>
					</li>
					
					
				</ul>
			</div> <!-- .hero-slider -->

			<main class="main-content">
				<div class="fullwidth-block greet-section">
					<div class="container">
						
						<small class="section-subtitle">Owner & User details</small>

                                          
                                                
                                                
                                         
                                                
                                                
                                     
                                                
                                                
						<!-- .row -->
 <table class="responstable">
  
  <tr>
    <th>User ID</th>
    <th data-th="Driver details"><span>Email ID</span></th>
    <th>Name</th>
    <th>Date of birth</th>
    <th>State</th>
     <th>Role</th>
    <th>Country</th>
    <th>Activate</th>
   
  </tr>
   <%
		      Class.forName("com.mysql.jdbc.Driver");
       		  System.out.println("loading class loaders");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/key1","root","root");
              
              Statement st=con.createStatement();
              String f="select * from reg ";
              ResultSet rs=st.executeQuery(f);
              
              while(rs.next())
              {
            	  String a=rs.getString("id");
                  String b=rs.getString("email");
            	  String c=rs.getString("uname");
                  String d=rs.getString("dob");
            	   String e=rs.getString("state");                   
                   String i=rs.getString("role");                              //i=g
            	    String g=rs.getString("country");
                     String h=rs.getString("activate");
                      String j=rs.getString("pass");
                  
                
               
                  
                 
            	 
	     	%>      
  <tr>
     <td><%=a %></td>
    <td><%=b %></td>
    <td><%=c %></td>
    <td><%=d %></td>
      <td><%=e %></td>
        <td><%=i %></td>
          <td><%=g %></td>
            
    <td><a href="Update1.jsp?id=<%=a%>&&email=<%=b%>&&uname=<%=c%>&&role=<%=i%>&&pass=<%=j%>">Update</a></td>
    
  </tr>
  
        <%} %>        
 
  
</table>   
						
					</div> <!-- .container -->
				</div> <!-- .fullwidth-block -->

				
				

				 <!-- .fullwidth-block -->
   
				 <!-- .fullwidth-block -->

				
			</main>

			<div class="site-footer">
				

				<div class="bottom-footer">
					<div class="container">
						

						<div class="colophon">Copyright (JPINFOTECH) 2016-2017. Design by Anbu</div>
					</div>
				</div>
			</div>
		</div>

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>

</html>>
