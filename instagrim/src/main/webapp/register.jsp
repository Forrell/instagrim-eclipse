<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <header>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>
                
                <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>
       
        <article>
            <h3>Register as user</h3>
            
            
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

		<form name="frm" method="POST"  action="Register"  onSubmit="return validateForm()">
                <ul>
                	<li>First Name <input type="text" name="first_name"></li>
               		<li>Last Name <input type="text" name="last_name"></li>
               		<li>Your Address <input type="text" name="address"></li>
               		<li>Email Address <input type="email" name="email"></li>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Register"> 
            </form>

        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
