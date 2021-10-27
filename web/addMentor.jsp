<%-- 
    Document   : addMentor
    Created on : Oct 27, 2021, 8:53:45 AM
    Author     : Minh Khoa
--%>

<%@page import="java.util.List"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% List<UserDTO> mentorList = (List<UserDTO>) request.getAttribute("LIST_MENTOR");%>
                                    
        
        <form action="MainController">
            
            <input type="hidden" name="eventID" value="<%= eventID%>"/>                            
            <input type="submit" name="action" value="AddMentor"/>
        </form>
    </body>
</html>
