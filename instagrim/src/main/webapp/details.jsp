<%--
Document : details.jsp
Created on : Sep 24, 2014, 12:04:14 PM
Author : Administrator
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Instagrim</title>
<link rel="stylesheet" type="text/css" href="Styles.css" />
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

	<form method="POST" action="UserInfo">

		<!-- Changed the user name field so that the user cannot change the value. The user name value has to stay constant -->
<ul>
		<li>User name (read only): <input type="text" name="username" readonly value=<%=lg.getUsername()%>> </li>
		<li>First name: <input type="text" name="firstName" value=<%=lg.getFirstName()%>> </li>
		<li>Last name: <input type="text" name="lastName" value=<%=lg.getLastName()%>></li>
		<li>Email: <input type="text" name="email" value=<%=lg.getEmail()%>></li>
		<input type="submit" value="Submit change">
		</ul>
	</form>
</body>
</html>