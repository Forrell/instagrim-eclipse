<%-- 
    Document   : Profile
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts"%>
<%@ page import="com.datastax.driver.core.Cluster"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
   <body>
        <header >
            
        </header>
        <nav id="top" >
            <ul id="menu">
          	  <li><a href="/Instagrim/index.jsp"><img src="http://i.imgur.com/PzqdyMRl.png" title="source: imgur.com" /></a></li>
                <li><a href="upload.jsp" >Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>



                 <li><a href="/Instagrim/profile.jsp">Profile</a></li>
                 <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                 <li><a href="logout.jsp">Logout</a></li>
         
                    <%}
                            }else{
                            	
                                %>
                 <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <%               
                    }%>
               
   </ul>
        </nav>
        
 
        <article>
            <h3>Your Profile</h3>
		<%
			
			String user = lg.getUsername();
			User us = new User();
			Cluster cluster = null;
			cluster = CassandraHosts.getCluster();
			us.setCluster(cluster);
			lg.setFirstName(us.getFirstName(user));
			lg.setLastName(us.getLastName(user));
			lg.setEmail(us.getEmail(user));
			
			lg.setPicid(us.getPicid(user));
		%>
<!--  Quick method for getting user avatar, just selects first image from user database -->
		<IMG HEIGHT=100 WIDTH=100 SRC="/Instagrim/Image/<%=lg.getPicid()%>" > <br> 
		<ul>
			<li>User name: <% out.print(lg.getUsername()); %></li>
			<li>First name: <% out.print(lg.getFirstName()); %></li>
			<li>Last name: <% out.print(lg.getLastName()); %>	</li>
			<li>Email: <% out.print(lg.getEmail()); %> </li>
  </ul>

		<form action="details.jsp">
			<input type="submit" value="Edit Details">
		</form>
		<br /> 
		
		<a href="/Instagrim/Profile.jsp" ></a><br/>
        </article>
         <footer>
            <ul>
                <li class="footer"><a href="/Instagrim"><h2>Home</h2></a></li>
            </ul>
        </footer>
    </body>
</html>
