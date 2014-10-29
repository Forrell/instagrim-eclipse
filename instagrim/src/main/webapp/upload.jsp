<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h3>File Upload</h3>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Press"> to upload the file!
            </form>

        </article>
         <footer>
            <ul>
                <li class="footer"><a href="/Instagrim"><h2>Home</h2></a></li>
            </ul>
        </footer>
    </body>
</html>
