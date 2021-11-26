<%-- 
    Document   : unBan
    Created on : Nov 25, 2021, 7:47:57 PM
    Author     : ASUS
--%>

<%-- 
    Document   : unban
    Created on : Nov 6, 2021, 4:33:59 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unban Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            
            if (loginUser.getStatus().equals("ACT")) {
        %>
        <h1>Error: This user is still active</h1>
        <%
        } else {
String reason = "";
        %>
        <h1>You are currently being ban. Please Enter an unban request!</h1>
        <form action="MainController">
            <input type="hidden" name="nameRegister" value="<%=loginUser.getName()%>" />
            <input type="hidden" name="gmail" value="<%=loginUser.getEmail()%>"/>
            <br>
            <h2>Write clearly: <span>Please enter the reason you want to be unban.</span></h2><br>
            <br><input class="textbox" size="25%" height="50" name="reason" value="<%=reason%>"/><br>          
            <button type="submit" name="action" value="ConfirmResquestUnban">Confirm Resquest</button><br>

            <%

                String message = (String) request.getAttribute("STUDENT_MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <%= message%>
        </form>
        <%
            }
        %>
    </body>
</html>
