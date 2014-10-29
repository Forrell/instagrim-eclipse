<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
     
       
        <article>
            <h3>Login</h3>
            
            
<!-- My First pass at Input validation , at the form level. This stops the user killing the web application with null entry -->

		<script>
				function validateForm() {
				if (document.frm.username.value == "") {
					alert("User Name should not be empty");
					document.frm.username.focus();
					return false;
				} else if (document.frm.password.value == "") {
					alert("Password should be not be empty");
					document.frm.password.focus();
					return false;
				}
			}
		</script>

		<form name="frm" method="POST"  action="Login"  onSubmit="return validateForm()">
                <ul>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Login"> 
                
                
             
                
            </form>

        </article>
         <footer>
            <ul>
                <li class="footer"><a href="/Instagrim"><h2>Home</h2></a></li>
            </ul>
        </footer>
    </body>
</html>
