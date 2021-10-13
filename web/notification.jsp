<%-- 
    Document   : notification
    Created on : Oct 13, 2021, 6:16:47 PM
    Author     : Minh Khoa
--%>

<%@page import="java.util.List"%>
<%@page import="com.group5.follow.FollowDTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        
        <h1>Hello User: <%=loginUser.getName()%></h1>
        <h3>ID: <%=loginUser.getId()%></h3>
        <h3>Email: <%=loginUser.getEmail()%></h3>
        <h3>Role <%=loginUser.getRoleID()%></h3>
        
        <form action="MainController">
            <input type="hidden" name="eventID" value="<%=loginUser.getId()%>"/>
            <input type="submit" name="action" value="ShowFollowEvent"/>
        </form>
            
        <%
            List<FollowDTO> followList = (List<FollowDTO>) request.getAttribute("FOLLOW_LIST");
            if (followList != null) {
                if (!followList.isEmpty()) {
        %>    
        <table border="1">
            <thead>
                <tr>
                    <th>Event Name</th>   
                    <th>Unfollow</th>
                </tr>
            </thead>
            <tbody>
        <%
                    for (FollowDTO follow : followList) {                              
        %>
        <tr>
            <td><%=follow.getEventName()%></td>
            <td>
                <form action="MainController">
                    <input type="hidden" name="eventID" value="<%=follow.getEventID()%>"/>
                    <input type="submit" name="action" value="FollowOrUnfollow"/>
                </form>
            </td>
        </tr>
        <%
            
        }
            
        }
            
        }
            
        %>
    </body>
</html>
