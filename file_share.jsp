<%@page import="action.Dbconn"%>
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
        <script>alert('File_Send_to_TPA');</script>
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
					<li data-bg-image="dummy/email.jpg">
						<div class="container">
							
						</div>
					</li>
					
					
				</ul>
			</div> <!-- .hero-slider -->

			<main class="main-content">
				<div class="fullwidth-block greet-section">
					<div class="container">
						
						<small class="section-subtitle">Share file</small>

                                          
                                                
                                                
                                         
                                                
                                                
                                     
                                                
                                                
						<!-- .row -->
 <table class="responstable">
  
  <tr>
      <th>File Id</th>
    <th>user name</th>
    <th>Email</th>
    <th>File name</th>
    
    <th>Status</th>
     <th>share file</th>
 
   
  </tr>
    <%   Class.forName("com.mysql.jdbc.Driver");
       		  System.out.println("loading class loaders");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/key1","root","root");
              
              Statement st=con.createStatement();
              String f="select * from request where status='No'";
              ResultSet rs=st.executeQuery(f);
              
              while(rs.next())
              {
            	  String a=rs.getString("id");
                  String b=rs.getString("email");
            	  String c=rs.getString("user_name");
                  String d=rs.getString("file_name");
                  String g=rs.getString("status");
            	   String e=rs.getString("secret_key");                   
                  
                
               
                  
                 
            	 
	     	%>      
  <tr>
             <td><%=a %></td>
            <td><%=c %></td>
           <td><%=b %></td>
            <td><%=d %></td>
           <td><%=g %></td>
          
           <td><a href="update4.jsp?id=<%=a%>&&email=<%=b%>&&uname=<%=c%>&&fname=<%=d%>&&skey=<%=e%>">share file</a></td>
                            <tr />
                            <%


                                    }
                                

                            %>
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