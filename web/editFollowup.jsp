<%-- 
    Document   : editFollowup
    Created on : Oct 10, 2021, 2:49:26 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.event.FollowupDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            
            List<FollowupDTO> list = (List<FollowupDTO>) request.getAttribute("FOLLOWUP_LIST");
            if (list != null) {
                if (!list.isEmpty()) {
                    for (FollowupDTO followup : list) {
                
        %>
        
        <form action="MainController">
            <h2>Followup Detail</h2><input type="text" name="followupDetail" value="<%=followup.getFollowupDetail()%>"/></br>
            Image(please enter the image's link): 
            <input type="text" name="followupImage" value="<%=followup.getFollowupImage()%>" /></br>
            
            Video(please enter a YouTube embed video link):
            <input type="text" name="followupVideo" value="<%=followup.getFollowupVideo()%>"/>
            
            <input type="hidden" name="eventID" value="<%=followup.getEventID()%>"/>
            <input type="hidden" name="followupID" value="<%=followup.getFollowupID()%>"/>
                   
            <input type="submit" name="action" value="ConfirmEditFollowup"/>
            
        </form>
        
        <%
                    }
                }
            }
        %>
    </body>
</html>
