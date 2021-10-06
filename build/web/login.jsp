<%-- 
    Document   : login
    Created on : Sep 20, 2021, 1:13:21 PM
    Author     : Minh Khoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/loginStyle.css" rel="stylesheet" >
    </head>
    <body>
<!--        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/EventManagement/LoginGoogleHandler&response_type=code
    &client_id=428640701768-fgq8e77is2ufa6l6q758mpp9262gls0e.apps.googleusercontent.com&approval_prompt=force">Login With FPT mail</a>  -->
        
        <div class="wrapper">
            <nav class="navbar">
                <img class="logo" src="css/img/logo.png">
                <ul>
                    <li><a class="active" href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/EventManagement/LoginGoogleHandler&response_type=code
    &client_id=428640701768-fgq8e77is2ufa6l6q758mpp9262gls0e.apps.googleusercontent.com&approval_prompt=force">
                            <img class src="css/img/logo-gg-new.png">
                            Sign in with @fpt.edu.vn</a></li>
                </ul>
            </nav>
            <div class="center">
                <h1>Welcome To </h1>
                <h2>FPT Event</h2>
            </div>


        </div>
        <div class="footer-bar">
        <footer>
            <h2><img class="logo" src="css/img/footerLogo.svg"/></h2>
            <p class="copyright">© 2021 GROUP 5</p>
        </footer>
            </div>
    </body>
</html>
