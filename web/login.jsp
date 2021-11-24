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
        <title>Login JSP Page</title>
        <link href="css/loginStyle.css" rel="stylesheet" >
    </head>
    <body>
        <div class="wrapper">
            <nav class="navbar">
                <div class="icon">
                    <h2><img class="logo" src="css/img/logo.png"> <span>Event</span></h2>
                </div>
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
        <footer>
            <div class="footer-align">
                <div class="footer-copyright">
                    <h3><img class="logo" src="css/img/logo.png"/><span>Event</span></h3>
                    <small class="copyright">Copyright © 2021 by GROUP 5</small>
                </div>
                <div class="follow-contact">
                    <h3>Contact</h3>
                    <small><span class="las la-envelope"></span><span> eventnotifygroup5@gmail.com</span></small>
                    <br>
                    <small><span class="las la-phone"></span><span> 0914 291 596</span></small>
                </div>
                <div class="follow-address">
                    <h3>Address</h3>
                    <small><span class="las la-map-marker-alt"></span><span> Lô E2a-7, Đường D1, Khu Công Nghệ Cao, Long Thạnh</span>
                        <br><span> Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh</span></small>
                </div>
            </div>
        </footer>
    </body>
</html>
