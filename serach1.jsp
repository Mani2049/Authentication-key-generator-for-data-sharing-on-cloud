<%@page import="action.Dbconn"%>
<%@page contentType="text/html" pageEncoding="windows-1251"%>
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
                                                               <li class="menu-item"><a href="userhomepage.jsp">User Home</a></li>
								<li class="menu-item"><a href="file_search.jsp">Search file</a></li>
                                                                <li class="menu-item"><a href="sdown.jsp">Download file</a></li>
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
						
						<small class="section-subtitle">User file Request</small>

                                          
                                                
                                                
                                         
                                                
                                                
                                     
                                                
                                                
						<!-- .row -->
 <table class="responstable">
  
  <tr>
    <th>File ID</th>
    
    <th>File Attribute</th>
    <th>file name</th>
    <th>File Request</th>
     
   
  </tr>
   <%int fid=0;
   
       String search=request.getParameter("search");
   
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = Dbconn.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from upload where filekey LIKE '%" + search + "%'");
                                    if (rs.next()) {
                                    session.setAttribute("SSpkey", rs.getString("pkey"));
                                    session.setAttribute("SSfilekey", rs.getString("filename"));
                                    session.setAttribute("SSsecret_key", rs.getString("secret_key"));
                                    session.setAttribute("SSend_time", rs.getString("end_time"));
                                    session.setAttribute("SSstart_time", rs.getString("start_time"));
                                      			
                                    do{  
                            %>
                            <tr>
                                <td><%=rs.getString("id")%></td>
                                <td><%=rs.getString("filekey")%></td>     
                                <td><%=rs.getString("filename")%></td>     
 
                                <td> <a href="req.jsp?id=<%=rs.getString("id")%>"><font style="color: green">Send</a></font> </td>   
                            </tr>  
                                     <% }while (rs.next());%>
                                     
                                     <% }else{ 
                                        response.sendRedirect("other.jsp");
                                        
   %>   
                                        <%
                                  
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
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
