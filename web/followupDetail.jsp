<%-- 
    Document   : followupDetail
    Created on : Oct 3, 2021, 11:09:10 AM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.event.FollowupDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit FollowUp Event Page</title>
    </head>
    <body>
        <%
            List<FollowupDTO> list = (List<FollowupDTO>) request.getAttribute("FOLLOWUP_LIST");
            if (list != null) {
                if (!list.isEmpty()) {
                    for (FollowupDTO followup : list) {
                
        %>
        
        <h2><%=followup.getFollowupDetail()%></h2>
            <img src ="<%=followup.getFollowupImage()%>"> 

        <iframe width="560" height="315" src="<%=followup.getFollowupVideo()%>" 
                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <%
                    }
                }
            }
        %>
    </body>
</html>
